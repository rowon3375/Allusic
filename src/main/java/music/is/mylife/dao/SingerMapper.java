package music.is.mylife.dao;

import java.util.ArrayList;

import music.is.mylife.vo.Singer;

public interface SingerMapper {
	// 가수 아이디를 입력받아 가수 한명 불러옴
	public Singer selectSingerById(int singer_id);
	
	//가수 정보 ( 가수 이름, 가수 사진 ) 불러옴 불러왔을 때 여러개 이기 때문에 ArrayList로 받음
	public ArrayList<Singer> selectSinger(int singer_id);
	//가수와 관련된 영상(URL주소)을 가지고옴 여러개 이기 때문에 ArrayList로 받음
	public ArrayList<String> selectVideo(int singer_id);
}	
