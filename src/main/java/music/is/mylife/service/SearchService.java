package music.is.mylife.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import music.is.mylife.dao.SongDAO;
import music.is.mylife.vo.Song;


@Service
public class SearchService {
	//Autowired DAO, 세션(선택)
	@Autowired
	SongDAO sdao;
	
	//곡명으로 검색
	public ArrayList<Song> searchSongsBySongName(String searchText) {
		ArrayList<Song> searchResult1 = sdao.selectSongsBySongName(searchText);
		
		return searchResult1;
	}
	
	//가수명으로 검색
	public ArrayList<Song> searchSongsBySingerName(String searchText) {
		ArrayList<Song> searchResult2 = sdao.selectSongsBySingerName(searchText);
		
		return searchResult2;
	}
}
