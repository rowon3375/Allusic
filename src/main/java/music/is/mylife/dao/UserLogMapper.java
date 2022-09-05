package music.is.mylife.dao;

import java.util.ArrayList;

import music.is.mylife.vo.Tag;
import music.is.mylife.vo.UserLog;

public interface UserLogMapper {
	//한 유저가 해당 곡에 매긴 별점 출력
	public Double selectUserStar(UserLog ul);
	
	//한 유저가 지금까지 평가한 곡들의 별점 총합
	public Double selectAllStarCountByUser(String user_id);
	
	//한 유저가 지금까지 별점을 매긴 곡 수
	public Double selectSongCountByUser(String user_id);
	//한 유저가 지금까지 매긴 별점의 총합
	public Double selectAllStarSumByUser(String user_id);
	//한 유저가 가장 많이 준 별점
	public Double selectTopStarByUser(String user_id);
	
	//특정 유저의 Top10 태그를 불러옴
	public ArrayList<Tag> selectTop10TagByUser(String user_id);
	
	//특정 유저의 Top3 가수를 불러옴
	public ArrayList<UserLog> selectTop3SingerByUser(String user_id);
	//특정 유저의 Top3 국가를 불러옴
	public ArrayList<UserLog> selectTop3CountryByUser(String user_id);
	//특정 유저의 Top3 장르를 불러옴
	public ArrayList<UserLog> selectTop3GenreByUser(String user_id);
	
	/*
	 * 2. 로그 입력
	 */
	//원래 해당 곡의 별점을 출력 
	public Double selectSongStarById(UserLog ul);
	//해당 곡에 별점을 줬는지 확인
	public Integer songStarCheck(UserLog ul);
	//해당 태그에 별점을 줬는지 확인
	public Integer tagStarCheck(UserLog ul);
	//해당 가수에 별점을 줬는지 확인
	public Integer singerStarCheck(UserLog ul);
	//해당 국가에 별점을 줬는지 확인
	public Integer countryStarCheck(UserLog ul);
	//해당 장르에 별점을 줬는지 확인
	public Integer genreStarCheck(UserLog ul);
	
	
	//해당 곡에 별점을 준 적이 없다면 insert
	public int insertSongLog(UserLog ul);
	//해당 태그에 별점을 준 적이 없다면 insert
	public int insertTagLog(UserLog ul);
	//해당 가수에 별점을 준 적이 없다면 insert
	public int insertSingerLog(UserLog ul);
	//해당 국가에 별점을 준 적이 없다면 insert
	public int insertCountryLog(UserLog ul);
	//해당 장르에 별점을 준 적이 없다면 insert
	public int insertGenreLog(UserLog ul);
	
	
	//해당 곡에 별점을 준 적이 있다면 update
	public int updateSongLog(UserLog ul);
	//해당 태그에 별점을 준 적이 있다면 update
	public int updateTagLog(UserLog ul);
	//해당 가수에 별점을 준 적이 있다면 update
	public int updateSingerLog(UserLog ul);
	//해당 국가에 별점을 준 적이 있다면 update
	public int updateCountryLog(UserLog ul);
	//해당 장르에 별점을 준 적이 있다면 update
	public int updateGenreLog(UserLog ul);
	
	
}
