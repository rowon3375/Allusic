package music.is.mylife.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import music.is.mylife.vo.Tag;
import music.is.mylife.vo.UserLog;

@Repository
public class UserLogDAO {

	@Autowired
	private SqlSession session;

	//한 유저가 해당 곡에 매긴 별점 출력(곡)
	public double selectUserStar(UserLog ul) {
		UserLogMapper mapper = session.getMapper(UserLogMapper.class);
		
		double dou = 0.0;
		Double count = mapper.selectUserStar(ul);
		
		if (count != null) {
			dou = count;
		}
		
		return dou;
	}
	
	/*
	 * 1. 로그 출력
	 */
	// 한 유저가 지금까지 평가한 곡들의 별점 총합
	public double selectAllStarCountByUser(String user_id) {
		UserLogMapper mapper = session.getMapper(UserLogMapper.class);

		double dou = 0.0;
		Double count = mapper.selectAllStarCountByUser(user_id);

		if (count != null) {
			dou = count;
		}

		return dou;

	}

	// 한 유저가 지금까지 별점을 매긴 곡 수
	public double selectSongCountByUser(String user_id) {
		UserLogMapper mapper = session.getMapper(UserLogMapper.class);

		return mapper.selectSongCountByUser(user_id);

	}

	// 한 유저가 지금까지 매긴 별점의 총합
	public double selectAllStarSumByUser(String user_id) {
		UserLogMapper mapper = session.getMapper(UserLogMapper.class);

		double dou = 0.0;
		Double count = mapper.selectAllStarSumByUser(user_id);

		if (count != null) {
			dou = count;
		}

		return dou;

	}

	// 한 유저가 가장 많이 준 별점
	public double selectTopStarByUser(String user_id) {
		UserLogMapper mapper = session.getMapper(UserLogMapper.class);

		double dou = 0.0;
		Double count = mapper.selectTopStarByUser(user_id);

		if (count != null) {
			dou = count;
		}

		return dou;

	}

	// 특정 유저의 Top3 태그 3개를 불러옴
	public ArrayList<Tag> selectTop10TagByUser(String user_id) {
		UserLogMapper mapper = session.getMapper(UserLogMapper.class);

		return mapper.selectTop10TagByUser(user_id);
	}

	// 특정 유저의 Top3 가수를 불러옴
	public ArrayList<UserLog> selectTop3SingerByUser(String user_id) {
		UserLogMapper mapper = session.getMapper(UserLogMapper.class);

		return mapper.selectTop3SingerByUser(user_id);
	}

	// 특정 유저의 Top3 국가를 불러옴
	public ArrayList<UserLog> selectTop3CountryByUser(String user_id) {
		UserLogMapper mapper = session.getMapper(UserLogMapper.class);

		return mapper.selectTop3CountryByUser(user_id);
	}

	// 특정 유저의 Top3 장르를 불러옴
	public ArrayList<UserLog> selectTop3GenreByUser(String user_id) {
		UserLogMapper mapper = session.getMapper(UserLogMapper.class);

		return mapper.selectTop3GenreByUser(user_id);
	}

	/*
	 * 2. 로그 입력
	 */
	// 원래 해당 곡의 별점을 출력
	public double selectSongStarById(UserLog ul) {
		UserLogMapper mapper = session.getMapper(UserLogMapper.class);

		double dou = 0.0;
		Double count = mapper.selectSongStarById(ul);

		if (count != null) {
			dou = count;
		}

		return dou;

	}

	// 해당 곡에 별점을 줬는지 확인
	public int songStarCheck(UserLog ul) {
		UserLogMapper mapper = session.getMapper(UserLogMapper.class);

		return mapper.songStarCheck(ul);
	}

	// 해당 태그에 별점을 줬는지 확인
	public int tagStarCheck(UserLog ul) {
		UserLogMapper mapper = session.getMapper(UserLogMapper.class);

		return mapper.tagStarCheck(ul);
	}

	// 해당 가수에 별점을 줬는지 확인
	public int singerStarCheck(UserLog ul) {
		UserLogMapper mapper = session.getMapper(UserLogMapper.class);

		return mapper.singerStarCheck(ul);
	}

	// 해당 국가에 별점을 줬는지 확인
	public int countryStarCheck(UserLog ul) {
		UserLogMapper mapper = session.getMapper(UserLogMapper.class);

		return mapper.countryStarCheck(ul);
	}

	// 해당 장르에 별점을 줬는지 확인
	public int genreStarCheck(UserLog ul) {
		UserLogMapper mapper = session.getMapper(UserLogMapper.class);

		return mapper.genreStarCheck(ul);
	}

	// 해당 곡에 별점을 준 적이 없다면 insert
	public int insertSongLog(UserLog ul) {
		UserLogMapper mapper = session.getMapper(UserLogMapper.class);

		return mapper.insertSongLog(ul);
	}

	// 해당 태그에 별점을 준 적이 없다면 insert
	public int insertTagLog(UserLog ul) {
		UserLogMapper mapper = session.getMapper(UserLogMapper.class);

		return mapper.insertTagLog(ul);
	}

	// 해당 가수에 별점을 준 적이 없다면 insert
	public int insertSingerLog(UserLog ul) {
		UserLogMapper mapper = session.getMapper(UserLogMapper.class);

		return mapper.insertSingerLog(ul);
	}

	// 해당 국가에 별점을 준 적이 없다면 insert
	public int insertCountryLog(UserLog ul) {
		UserLogMapper mapper = session.getMapper(UserLogMapper.class);

		return mapper.insertCountryLog(ul);
	}

	// 해당 장르에 별점을 준 적이 없다면 insert
	public int insertGenreLog(UserLog ul) {
		UserLogMapper mapper = session.getMapper(UserLogMapper.class);

		return mapper.insertGenreLog(ul);
	}

	// 해당 곡에 별점을 준 적이 있다면 update
	public int updateSongLog(UserLog ul) {
		UserLogMapper mapper = session.getMapper(UserLogMapper.class);

		return mapper.updateSongLog(ul);
	}

	// 해당 태그에 별점을 준 적이 있다면 update
	public int updateTagLog(UserLog ul) {
		UserLogMapper mapper = session.getMapper(UserLogMapper.class);

		return mapper.updateTagLog(ul);
	}

	// 해당 가수에 별점을 준 적이 있다면 update
	public int updateSingerLog(UserLog ul) {
		UserLogMapper mapper = session.getMapper(UserLogMapper.class);

		return mapper.updateSingerLog(ul);
	}

	// 해당 국가에 별점을 준 적이 있다면 update
	public int updateCountryLog(UserLog ul) {
		UserLogMapper mapper = session.getMapper(UserLogMapper.class);

		return mapper.updateCountryLog(ul);
	}

	// 해당 장르에 별점을 준 적이 있다면 update
	public int updateGenreLog(UserLog ul) {
		UserLogMapper mapper = session.getMapper(UserLogMapper.class);

		return mapper.updateGenreLog(ul);
	}

}
