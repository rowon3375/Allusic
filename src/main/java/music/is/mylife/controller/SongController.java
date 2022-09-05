package music.is.mylife.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import music.is.mylife.service.AnalysisService;
import music.is.mylife.service.HomeService;
import music.is.mylife.service.ListService;
import music.is.mylife.service.SongService;
import music.is.mylife.service.UserService;
import music.is.mylife.vo.Playlist;
import music.is.mylife.vo.Song;
import music.is.mylife.vo.Tag;
import music.is.mylife.vo.UserInfo;
import music.is.mylife.vo.UserLog;

@RequestMapping("song")
@Controller
public class SongController {
	
	private static final Logger logger = LoggerFactory.getLogger(SongController.class);
	
	@Autowired
	SongService ss;
	
	@Autowired
	HomeService hs;
	
	@Autowired
	UserService us;
	
	@Autowired
	ListService ls;
	
	@Autowired
	AnalysisService as;
	
	/**
	 * 곡 이름누르면 해당 곡 페이지로 이동
	 * 1. 해당 곡과 해당 곡의 가수 id를 받아옴
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "songPage", method = RequestMethod.GET)
	public String songPage(Model model, Song song, HttpSession session) {
		//현재 로그인한 유저 id 가져오기
		String user_id = (String)session.getAttribute("user_id");
		//특정 곡 객체 가져오기
		Song selectSong = ss.selectAllSong(song);
		//해당 곡의 평균 별점
		double avg = ss.selectStars(song.getSong_id());
		selectSong.setAvg(avg);
		
		
		//해당 곡의 상위 10개 태그 목록 가져오기
		ArrayList<Tag> tag = ss.selectTag(song.getSong_id());
		// 해당 곡이 들어있는 리스트 부르기
		ArrayList<Playlist> listId = ls.selectListId(song.getSong_id());
		//플레이리스트들을 저장(곡 페이지에서 배너사진 출력때문에 필요)
		ArrayList<ArrayList<Playlist>> banner = new ArrayList<ArrayList<Playlist>>();
		
		/*
		 * 플레이리스트들의 배너 사진을 가져오기 위해 반복문 수행.
		 * 
		 */
		for(Playlist info : listId) {
			//플레이리스트 id를 조건으로 줘서 해당 플레이리스트들의 배너 사진을 가져올 수 있음
			banner.add(ls.listBanner(info.getPlaylist_id()));
		}
		
		//유저가 있을 때만 아래 코드 수행
		if(user_id!=null) {
			//해당 유저가 해당 곡에 매긴 별점
			double starPoint = ss.selectUserStar(song.getSong_id(), user_id);
			//로그인한 사용자의 마이 리스트 목록 불러오기
			ArrayList<Playlist> playlist = ss.selectList(user_id);
			model.addAttribute("starPoint", starPoint);
			model.addAttribute("playlist", playlist);
			
		}
		
		
		
		model.addAttribute("singer_id", song.getSinger_id()); 
		model.addAttribute("song_id", song.getSong_id()); 
		model.addAttribute("Song", selectSong);
		model.addAttribute("Tag", tag);
		//리스트 아이디
		model.addAttribute("listId", listId);
		//리스트 배너 사진
		model.addAttribute("banner", banner);
		
		
		return "song/mainPage";
	}

	
	// 별점 입력시 처리
	@RequestMapping(value = "starLog", method = RequestMethod.POST)
	public String analysisPage(UserLog ul, Model model, HttpSession session) {
		String user_id = (String)session.getAttribute("user_id");
		
		ul.setUser_id(user_id);
		
		//곡과 곡과 관련된 정보에 별점 기록을 남김
		ss.recordUserLog(ul);
		
		//여기서부턴 곡 페이지를 띄우기 위해 필요한 정보들을 넘겨줌
		Song song = new Song();
		song.setSinger_id(ul.getSinger_id());
		song.setSong_id(ul.getSong_id());
		
		//특정 곡 객체 가져오기
		Song selectSong = ss.selectAllSong(song);
		//해당 곡의 평균 별점
		double avg = ss.selectStars(song.getSong_id());
		selectSong.setAvg(avg);
		//해당 곡의 상위 10개 태그 목록 가져오기
		ArrayList<Tag> tag = ss.selectTag(song.getSong_id());
		// 해당 곡이 들어있는 리스트 부르기
		ArrayList<Playlist> listId = ls.selectListId(song.getSong_id());
		//플레이리스트들을 저장(곡 페이지에서 배너사진 출력때문에 필요)
		ArrayList<ArrayList<Playlist>> banner = new ArrayList<ArrayList<Playlist>>();

		/*
		 * 플레이리스트들의 배너 사진을 가져오기 위해 반복문 수행.
		 * 
		 */
		for(Playlist info : listId) {
			//플레이리스트 id를 조건으로 줘서 해당 플레이리스트들의 배너 사진을 가져올 수 있음
			banner.add(ls.listBanner(info.getPlaylist_id()));
		}
		
		//유저가 있을 때만 아래 코드 수행
		if(user_id!=null) {
			//해당 유저가 해당 곡에 매긴 별점
			double starPoint = ss.selectUserStar(song.getSong_id(), user_id);
			//로그인한 사용자의 마이 리스트 목록 불러오기
			ArrayList<Playlist> playlist = ss.selectList(user_id);
			model.addAttribute("starPoint", starPoint);
			model.addAttribute("playlist", playlist);
			
		}
		
		if(user_id!=null) {
			ArrayList<Playlist> playlist = ss.selectList(user_id);
			model.addAttribute("playlist", playlist);
			
		}
		 
			 model.addAttribute("singer_id", song.getSinger_id()); 
			 model.addAttribute("song_id", song.getSong_id()); 
			 model.addAttribute("Song", selectSong);
			 model.addAttribute("Tag", tag);
		 	//리스트 아이디
		 	model.addAttribute("listId", listId);
			//배너 사진
			model.addAttribute("banner", banner);
			//유저가 매긴 별점 담기. 유저가 몇점을 줬는지 맨 처음에 ul에서 받아옴
			model.addAttribute("starPoint", ul.getStar());
		
			
		
		return "song/mainPage";
	}

	
	//여기서부터
	//name, explain, song_id, singer_id 받아옴 -> pl로
	// 새로운 플레이리스트 생성
	@RequestMapping(value="addPlayList",method=RequestMethod.POST)
	public String addPlayList(Playlist pl, Model model,HttpSession session) {
		
		String user_id = (String)session.getAttribute("user_id");
		pl.setUser_id(user_id);
		
		//새 플레이리스트 추가		
		ss.insertPlaylist(pl);
				
		
		//여기서부턴 곡 페이지를 띄우기 위해 필요한 정보들을 넘겨줌
		Song song = new Song();
		song.setSinger_id(pl.getSinger_id());
		song.setSong_id(pl.getSong_id());
		
		//특정 곡 객체 가져오기
		Song selectSong = ss.selectAllSong(song);
		//해당 곡의 평균 별점
		double avg = ss.selectStars(song.getSong_id());
		selectSong.setAvg(avg);
		//해당 곡의 상위 10개 태그 목록 가져오기
		ArrayList<Tag> tag = ss.selectTag(song.getSong_id());
		// 해당 곡이 들어있는 리스트 부르기
		ArrayList<Playlist> listId = ls.selectListId(song.getSong_id());
		//플레이리스트들을 저장(곡 페이지에서 배너사진 출력때문에 필요)
		ArrayList<ArrayList<Playlist>> banner = new ArrayList<ArrayList<Playlist>>();
		
		/*
		 * 플레이리스트들의 배너 사진을 가져오기 위해 반복문 수행.
		 * 
		 */
		for(Playlist info : listId) {
			//플레이리스트 id를 조건으로 줘서 해당 플레이리스트들의 배너 사진을 가져올 수 있음
			banner.add(ls.listBanner(info.getPlaylist_id()));
		}
		
		//유저가 있을 때만 아래 코드 수행
		if(user_id!=null) {
			//해당 유저가 해당 곡에 매긴 별점
			double starPoint = ss.selectUserStar(song.getSong_id(), user_id);
			//로그인한 사용자의 마이 리스트 목록 불러오기
			ArrayList<Playlist> playlist = ss.selectList(user_id);
			model.addAttribute("starPoint", starPoint);
			model.addAttribute("playlist", playlist);
			
		}
			
			 model.addAttribute("singer_id", song.getSinger_id()); 
			 model.addAttribute("song_id", song.getSong_id()); 
			 model.addAttribute("Song", selectSong);
			 model.addAttribute("Tag", tag);
		 	//리스트 아이디
		 	model.addAttribute("listId", listId);
			//배너 사진
			model.addAttribute("banner", banner);

			
		return "song/mainPage";
	}
	
	
	
	// 리스트에 곡 추가하기
	@RequestMapping(value="addSongList",method=RequestMethod.POST)
	public String addSongList(Playlist pl, Model model,HttpSession session) {
		// user_id를 세션으로부터 가져와서 값 저장
		String user_id = (String)session.getAttribute("user_id");
		pl.setUser_id(user_id);
		
		//리스트에 곡 추가하기
		ss.insertSong(pl);
		
		
		//여기서부턴 곡 페이지를 띄우기 위해 필요한 정보들을 넘겨줌
		Song song = new Song();
		song.setSinger_id(pl.getSinger_id());
		song.setSong_id(pl.getSong_id());
		//특정 곡 객체 가져오기
		Song selectSong = ss.selectAllSong(song);
		
		//해당 곡의 평균 별점
		double avg = ss.selectStars(song.getSong_id());
		selectSong.setAvg(avg);
		//해당 곡의 상위 10개 태그 목록 가져오기
		ArrayList<Tag> tag = ss.selectTag(song.getSong_id());
		// 해당 곡이 들어있는 리스트 부르기
		ArrayList<Playlist> listId = ls.selectListId(song.getSong_id());
		//플레이리스트들을 저장(곡 페이지에서 배너사진 출력때문에 필요)
		ArrayList<ArrayList<Playlist>> banner = new ArrayList<ArrayList<Playlist>>();
		
		/*
		 * 플레이리스트들의 배너 사진을 가져오기 위해 반복문 수행.
		 * 
		 */
		for(Playlist info : listId) {
			//플레이리스트 id를 조건으로 줘서 해당 플레이리스트들의 배너 사진을 가져올 수 있음
			banner.add(ls.listBanner(info.getPlaylist_id()));
		}		
		
		//유저가 있을 때만 아래 코드 수행
		if(user_id!=null) {
			//해당 유저가 해당 곡에 매긴 별점
			double starPoint = ss.selectUserStar(song.getSong_id(), user_id);
			//로그인한 사용자의 마이 리스트 목록 불러오기
			ArrayList<Playlist> playlist = ss.selectList(user_id);
			model.addAttribute("starPoint", starPoint);
			model.addAttribute("playlist", playlist);
			
		}		
		
		model.addAttribute("singer_id", song.getSinger_id()); 
		model.addAttribute("song_id", song.getSong_id()); 
		model.addAttribute("Song", selectSong);
		model.addAttribute("Tag", tag);
		//리스트 아이디
		model.addAttribute("listId", listId);
		//배너 사진
		model.addAttribute("banner", banner);
		 
		
		return "song/mainPage";
	}
	
	
	
	
	/**
	 * 곡페이지에서 로그인하기
	 * @param user_id
	 * @param user_pw
	 * @param model
	 * @param session
	 * @return song/songPage
	 */
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(String user_id, String user_pw, Model model, HttpSession session, Song song) {
		//user_id를 조건으로 유저를 가져옴
		UserInfo user_info = us.selectUser(user_id);

		//여기서부턴 곡 페이지를 띄우기 위해 필요한 정보들을 넘겨줌
		//특정 곡 객체 가져오기
		Song selectSong = ss.selectAllSong(song);
		
		//해당 곡의 평균 별점
		double avg = ss.selectStars(song.getSong_id());
		selectSong.setAvg(avg);
		//해당 곡의 상위 10개 태그 목록 가져오기
		ArrayList<Tag> tag = ss.selectTag(song.getSong_id());
		// 해당 곡이 들어있는 리스트 부르기
		ArrayList<Playlist> listId = ls.selectListId(song.getSong_id());
		//플레이리스트들을 저장(곡 페이지에서 배너사진 출력때문에 필요)
		ArrayList<ArrayList<Playlist>> banner = new ArrayList<ArrayList<Playlist>>();		
		
		/*
		 * 플레이리스트들의 배너 사진을 가져오기 위해 반복문 수행.
		 * 
		 */
		for(Playlist info : listId) {
			//플레이리스트 id를 조건으로 줘서 해당 플레이리스트들의 배너 사진을 가져올 수 있음
			banner.add(ls.listBanner(info.getPlaylist_id()));
		}				
		
		//로그인 성공시
		  if(user_info != null && user_info.getUser_pw().equals(user_pw)) {
			  session.setAttribute("user_id", user_id);
			  double starPoint = ss.selectUserStar(song.getSong_id(), user_id);
			  model.addAttribute("starPoint", starPoint);
			  ArrayList<Playlist> playlist = ss.selectList(user_id);
			  model.addAttribute("playlist",playlist);
		  } 
		  //여기서 user_id에 값을 넣어줬기 때문에 밑에서 확인가능.
		  
		
		
		  model.addAttribute("singer_id", song.getSinger_id());
		  model.addAttribute("song_id", song.getSong_id()); 
		  model.addAttribute("Song",  selectSong);
		  model.addAttribute("listId", listId);
		  model.addAttribute("Tag", tag);
		  model.addAttribute("banner", banner);
		  
	
		return "song/mainPage";
	}
	
	
	
	
	/**
	 * 곡페이지에서 회원가입 처리
	 * @param userinfo
	 * @param model
	 * @return ss.insertUser(userinfo)
	 */
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(@ModelAttribute("userinfo") UserInfo userinfo ,Model model, Song song) {
		//회원가입 처리
		if(us.insertUser(userinfo)) {
			System.out.println("회원가입 성공!!!!");
			
		}else {
			System.out.println("회원가입 실패!!!!");
			
		}
		
		//여기서부턴 곡 페이지를 띄우기 위해 필요한 정보들을 넘겨줌
		//특정 곡 객체 가져오기
		Song selectSong = ss.selectAllSong(song);
		
		//해당 곡의 평균 별점
		double avg = ss.selectStars(song.getSong_id());
		selectSong.setAvg(avg);
		//해당 곡의 상위 10개 태그 목록 가져오기
		ArrayList<Tag> tag = ss.selectTag(song.getSong_id());
		// 해당 곡이 들어있는 리스트 부르기
		ArrayList<Playlist> listId = ls.selectListId(song.getSong_id());
		//플레이리스트들을 저장(곡 페이지에서 배너사진 출력때문에 필요)
		ArrayList<ArrayList<Playlist>> banner = new ArrayList<ArrayList<Playlist>>();
		
		/*
		 * 플레이리스트들의 배너 사진을 가져오기 위해 반복문 수행.
		 * 
		 */
		for(Playlist info : listId) {
			//플레이리스트 id를 조건으로 줘서 해당 플레이리스트들의 배너 사진을 가져올 수 있음
			banner.add(ls.listBanner(info.getPlaylist_id()));
		}			

		
		
		model.addAttribute("singer_id", selectSong.getSinger_id());
		model.addAttribute("song_id", selectSong.getSong_id());
		model.addAttribute("Song", selectSong);
		model.addAttribute("listId", listId);
		model.addAttribute("Tag", tag);
		model.addAttribute("banner", banner);

		
		
		return "song/mainPage";
	}
	
	
	
	/**
	 * 곡페이지에서 로그아웃하기
	 * @param session
	 * @param song
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String lougout(HttpSession session, Song song, Model model) {
		
		session.invalidate();
		
		//여기서부턴 곡 페이지를 띄우기 위해 필요한 정보들을 넘겨줌
		//특정 곡 객체 가져오기
		Song selectSong = ss.selectAllSong(song);
		
		//해당 곡의 평균 별점
		double avg = ss.selectStars(song.getSong_id());
		selectSong.setAvg(avg);
		//해당 곡의 상위 10개 태그 목록 가져오기
		ArrayList<Tag> tag = ss.selectTag(song.getSong_id());
		// 해당 곡이 들어있는 리스트 부르기
		ArrayList<Playlist> listId = ls.selectListId(song.getSong_id());
		//플레이리스트들을 저장(곡 페이지에서 배너사진 출력때문에 필요)
		ArrayList<ArrayList<Playlist>> banner = new ArrayList<ArrayList<Playlist>>();
		
		/*
		 * 플레이리스트들의 배너 사진을 가져오기 위해 반복문 수행.
		 * 
		 */
		for(Playlist info : listId) {
			//플레이리스트 id를 조건으로 줘서 해당 플레이리스트들의 배너 사진을 가져올 수 있음
			banner.add(ls.listBanner(info.getPlaylist_id()));
		}			
		
		model.addAttribute("singer_id", song.getSinger_id());
		model.addAttribute("song_id", song.getSong_id());
		model.addAttribute("Song", selectSong);
		model.addAttribute("listId", listId);
		model.addAttribute("banner", banner);
		model.addAttribute("Tag", tag);
	
		
		return "song/mainPage";
	}
	
	
	
	
	
	
}
