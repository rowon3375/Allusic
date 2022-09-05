package music.is.mylife.controller;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import music.is.mylife.service.HomeService;
import music.is.mylife.service.ListService;
import music.is.mylife.service.SongService;
import music.is.mylife.vo.Playlist;
import music.is.mylife.vo.Song;
import music.is.mylife.vo.Tag;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	SongService ss;

	@Autowired
	HomeService hs;
	
	@Autowired
	ListService ls;

	
	/**
	 * 1. 조회수 상위 5개의 곡 값을 main.jsp에 넘기기 2. 발라드 곡 값을 main.jsp에 넘기기
	 * 
	 * @param song
	 * @param model
	 * @return main.jsp
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String topSong(Song song, Model model) {
		//조회수가 높은 순으로 상위 10개의 곡 출력(메인)
		ArrayList<Song> songList = hs.selectTopSong(song);
		//선택한 장르의 곡들을 조회수 순으로 출력(메인)
		ArrayList<Song> songList2 = hs.selectSongByGenre("발라드");

		model.addAttribute("songList", songList);
		model.addAttribute("songList2", songList2);

		return "main";
	}


}
