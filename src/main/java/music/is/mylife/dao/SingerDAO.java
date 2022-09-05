package music.is.mylife.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import music.is.mylife.vo.Singer;

@Repository
public class SingerDAO {
	
	@Autowired
	private SqlSession session;
	
	//한 유저가 지금까지 별점을 매긴 곡 수
	public Singer selectSingerById(int singer_id) {
		SingerMapper mapper = session.getMapper(SingerMapper.class);
		
		return mapper.selectSingerById(singer_id);
		
	}
}
