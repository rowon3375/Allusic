package music.is.mylife.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import music.is.mylife.dao.SongDAO;
import music.is.mylife.dao.TagDAO;
import music.is.mylife.dao.UserDAO;
import music.is.mylife.dao.UserLogDAO;
import music.is.mylife.vo.Playlist;
import music.is.mylife.vo.Song;
import music.is.mylife.vo.Tag;
import music.is.mylife.vo.UserInfo;
import music.is.mylife.vo.UserLog;

@Service
public class SongService {
	// Autowired DAO, 세션(선택)

	@Autowired
	SongDAO sdao;
	@Autowired
	TagDAO tdao;
	@Autowired
	UserDAO udao;
	@Autowired
	UserLogDAO uld;
	@Autowired
	TagDAO td;
	
	//곡id, 가수 id를 입력받아 곡 객체 하나가져오기(곡)
	public Song selectAllSong(Song song) {
		Song selectSong = sdao.selectAllSong(song);

		return selectSong;
	}
	
	
	// 특정 곡의 평균 별점을 가져옴(곡)
	public double selectStars(int song_id) {
		
		double avg = sdao.selectStars(song_id);
		
		System.out.println("songservice avg" + avg);
		
		return avg;
	}
	
	//해당 유저가 해당 곡에 매긴 별점을 가져옴(곡)
	public double selectUserStar(int song_id, String user_id) {
		
		UserLog ul = new UserLog();
		ul.setSong_id(song_id);
		ul.setUser_id(user_id);
		
		return uld.selectUserStar(ul);
	}
	
	//해당 곡의 상위 10개 태그 목록 가져오기(곡)
	public ArrayList<Tag> selectTag(int song_id) {

		ArrayList<Tag> tag = tdao.selectTop10TagBySongId(song_id);
		return tag;
	}
	
	//유저 아이디를 받아 유저가 가지고 있는 리스트를 가져옴(곡)
	public ArrayList<Playlist> selectList(String user_id) {

		ArrayList<Playlist> playlist = sdao.selectList(user_id);

		return playlist;
	}
	
	//새 플레이리스트 추가
	public Boolean insertPlaylist(Playlist playlist) {
		
		//추가하려고 하는 리스트가 중복되어있는지 확인
		if(sdao.listDupleCheck(playlist) > 0) {
			//중복되어 있다면 아무것도 하지 않음
			return false;
		}
		
		//중복되어 있지 않다면 새 리스트 추가
		int result = sdao.insertList(playlist);
		
		return true;

	}
	
	//플레이리스트에 곡 추가
	public void insertSong(Playlist playlist) {
		//해당 playlist에 해당 곡이 있는지 없는지 확인(플레이리스트 id, song_id를 조건으로)
		int count = sdao.selectSongCount(playlist);
		
		//중복이 되어있지 않다면 곡을 플레이리스트에 추가
		if(count==0) {
				sdao.insertSong(playlist);
		}
		else {
			return;
		}
	}
		

		
		/*
		 * 곡의 id를 받아서 상위 4개 리스트를 반환하는 method
		 * */
		public ArrayList<Playlist> selectTop4ListBySongId(int song_id){
			
			ArrayList<Playlist> list = sdao.selectTop4ListBySongId(song_id);
			
			return list;
			
		}
	
	
	
	
	
	

	public int selectPlayListId(String list_name) {

		int playlist_id = sdao.selectPlayListId(list_name);

		return playlist_id;
	}


	
	


	
	
	
	
	/**
     * 리스트 페이지에서 회원가입 처리
     * @param userinfo
     * @return
     */
    public String insertListUser(UserInfo userinfo) {
        //회원가입 처리
        int join = udao.insertUser(userinfo);

        if(join != 1) {
            return "list/listpage";
        }
        return "list/listpage";
    }
    
	


	
	
	/* 
	 * 2. 별점 매길 시 유저 로그 입력
	 */
	public void recordUserLog(UserLog ul) {
		//중복된 곡이 있을 때
		if(uld.songStarCheck(ul) > 0) {
			//all_star는 신규별점 - 기존 별점 차이만큼, grade_count는 안올라가게
			//**user_song_log 테이블에서 한 유저가 한 곡에 별점을 준 기록은 한행만 있기 때문(새로 insert 하는게 아니라 update하는 식)
			double star = ul.getStar() - uld.selectSongStarById(ul);
			ul.setAll_star(star);
			
			System.out.println("별점 : " + star);
			System.out.println("ul 별점 : " + ul.getStar());
			System.out.println("기존별점 : " + uld.selectSongStarById(ul));
			
			//user_song_log 업데이트
			uld.updateSongLog(ul);
			
			tagLogInsert(ul);
			singerLogInsert(ul);
			countryLogInsert(ul);
			genreLogInsert(ul);
			
		}else{
			//중복된 곡이 없을 때. 별점 : 새로 추가한 별점 값이 그대로 증가, 카운트 : 1 증가
			ul.setAll_star(ul.getStar());
			ul.setGrade_count(1);
			
			//곡 새로 추가
			uld.insertSongLog(ul);
			//tagLog 입력
			tagLogInsert(ul);
			singerLogInsert(ul);
			countryLogInsert(ul);
			genreLogInsert(ul);
		}
		
	}
	
	//태그 로그 처리 : 중복된 태그가 없으면 insert, 있으면 update
	public void tagLogInsert(UserLog ul) {
		//상위 3개 태그
		ArrayList<Tag> tagList = td.selectTop3TagBySongId(ul.getSong_id());
		
		for(Tag t : tagList) {
			//n번째 태그 id를 조건으로 줌 -> 중복검사 위함
			ul.setTag_id(t.getTag_id());
			
			//중복된 태그 있는지 확인. 
			if(uld.tagStarCheck(ul) > 0) {
				//업데이트
				uld.updateTagLog(ul);
			}else {
				//중복된 태그가 없어. insert
				uld.insertTagLog(ul);
			}
		}
	}
	
	//가수 로그 처리 : 중복된 태그가 없으면 insert, 있으면 update
	public void singerLogInsert(UserLog ul) {
		
		//중복된 가수 있는지 확인. 
		if(uld.singerStarCheck(ul) > 0) {
			//중복된 가수가 있다면 업데이트
			uld.updateSingerLog(ul);
		}else {
			//중복된 태그가 없어. insert
			uld.insertSingerLog(ul);
		}
	}
	//국가 로그 처리 : 중복된 태그가 없으면 insert, 있으면 update
	public void countryLogInsert(UserLog ul) {
		
		//중복된 국가 있는지 확인. 
		if(uld.countryStarCheck(ul) > 0) {
			//중복된 국가가 있다면 업데이트
			uld.updateCountryLog(ul);
		}else {
			//중복된 국가가 없어. insert
			uld.insertCountryLog(ul);
		}
	}
	//장르 로그 처리 : 중복된 태그가 없으면 insert, 있으면 update
	public void genreLogInsert(UserLog ul) {
		
		//중복된 장르가 있는지 확인. 
		if(uld.genreStarCheck(ul) > 0) {
			//중복된 장르가 있다면 업데이트
			uld.updateGenreLog(ul);
		}else {
			//중복된 장르가 없어. insert
			uld.insertGenreLog(ul);
		}
	}


}
