package music.is.mylife.dao;

import java.util.ArrayList;

import music.is.mylife.vo.Tag;

public interface TagMapper {

	//곡 아이디를 입력받아 해당 곡의 상위 태그 10개를 반환(곡)
	public ArrayList<Tag> selectTop10TagBySongId(int song_id);
	//song_id를 입력받아서 해당 곡의 상위 태그 3개를 반환 하는 sql문//
	public ArrayList<Tag> selectTop3TagBySongId(int song_id);
	
	
	//태그 id를 입력받아 태그 리턴
	public Tag selectTagsById(int tag_id);
	
	
}
