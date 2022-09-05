package music.is.mylife.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import music.is.mylife.dao.SongDAO;
import music.is.mylife.dao.UserLogDAO;
import music.is.mylife.vo.Song;


@Service
public class HomeService {

	@Autowired
	SongDAO sd;
	@Autowired
	UserLogDAO uld;
	
	//곡 아이디로 곡 정보 가져오기
	public Song selectSongsById(int song_id){
		return sd.selectSongsById(song_id);
	}
	
	/**
	 * 조회수가 높은 순으로 상위 10개의 곡 출력(메인)
	 * @param song
	 * @return ArrayList<Song>
	 */
	public ArrayList<Song> selectTopSong(Song song){
		ArrayList<Song> songList = sd.selectTopSong(song);
		
		return songList;
	}
	
	/**
	 * 선택한 장르의 곡들을 조회수 순으로 출력(메인)
	 * @param song
	 * @return ArrayList<Song>
	 */
	public ArrayList<Song> selectSongByGenre(String genre){
		ArrayList<Song> songList = sd.selectSongByGenre(genre);
		
		return songList;
	}
	
	
	
}
