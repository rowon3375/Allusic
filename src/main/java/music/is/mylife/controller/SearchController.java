package music.is.mylife.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import music.is.mylife.service.HomeService;
import music.is.mylife.service.SearchService;
import music.is.mylife.service.UserService;
import music.is.mylife.vo.Song;
import music.is.mylife.vo.UserInfo;

@RequestMapping("search")
@Controller
public class SearchController {

	@Autowired
	SearchService sServ;
	@Autowired
	HomeService hs;
	@Autowired
	UserService us;


	@RequestMapping(value = "searchResult", method = RequestMethod.GET)
	public String search(String searchText, Model model) {
		// 곡명으로 검색 검색 결과
		ArrayList<Song> searchResult1 = sServ.searchSongsBySongName(searchText);
		// 가수명으로 검색
		ArrayList<Song> searchResult2 = sServ.searchSongsBySingerName(searchText);
		
		//검색어
		model.addAttribute("searchText", searchText);
		model.addAttribute("searchResult1", searchResult1);
		model.addAttribute("searchResult2", searchResult2);

		return "search/searchResult";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(String user_id, String user_pw, String searchText, Model model, HttpSession session) {
		
		UserInfo user_info = us.selectUser(user_id);
		
		if (user_info != null && user_info.getUser_pw().equals(user_pw)) {
			session.setAttribute("user_id", user_id);
		}
		
		

		return "redirect:searchResult?searchText=" + searchText;
	}

	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(Model model, String searchText, @ModelAttribute("userinfo") UserInfo userinfo) {
		
		if(us.insertUser(userinfo)) {
			System.out.println("회원가입 성공!!");
		}else {
			System.out.println("회원가입 실패!");
		}
		
		return "redirect:searchResult?searchText=" + searchText;
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session, Model model, String searchText) {
		session.invalidate();
		

		return "redirect:searchResult?searchText=" + searchText;
	}


}
