package music.is.mylife.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import music.is.mylife.vo.Tag;

@Repository
public class TagDAO {
	
	@Autowired
	private SqlSession session;
	
	//해당 곡의 상위 10개 태그 목록 가져오기(곡)
	public ArrayList<Tag> selectTop10TagBySongId(int song_id){
		
		TagMapper mapper = session.getMapper(TagMapper.class);
		
		ArrayList<Tag> st = mapper.selectTop10TagBySongId(song_id);
		
		
		return st;
	}
	
	//해당 곡의 상위 10개 태그 목록 가져오기
	public ArrayList<Tag> selectTop3TagBySongId(int song_id){
		
		TagMapper mapper = session.getMapper(TagMapper.class);
		
		
		ArrayList<Tag> st = mapper.selectTop3TagBySongId(song_id);
		
		return st;
	}
	
	
	//태그 id를 입력받아 태그 목록 가져옴
	public Tag selectTagsById(int tag_id){
		TagMapper mapper = session.getMapper(TagMapper.class);
		
		return mapper.selectTagsById(tag_id);
	}
	
}
