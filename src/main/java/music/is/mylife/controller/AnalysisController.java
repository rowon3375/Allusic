package music.is.mylife.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import music.is.mylife.service.AnalysisService;
import music.is.mylife.service.HomeService;
import music.is.mylife.service.SongService;
import music.is.mylife.vo.Singer;
import music.is.mylife.vo.Song;
import music.is.mylife.vo.Tag;
import music.is.mylife.vo.UserInfo;
import music.is.mylife.vo.UserLog;

@RequestMapping("analysis")
@Controller
public class AnalysisController {

	private static final Logger logger = LoggerFactory.getLogger(AnalysisController.class);
	
	@Autowired
	AnalysisService as;
	@Autowired
	SongService ss;

	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main(Song song, Model model, HttpSession session) {
		
		String user_id = (String)session.getAttribute("user_id");
		
		//유저 id가 xxxx인(현재 로그인한 사용자) 유저를 가져옴
		UserInfo u_info = as.selectUser(user_id);
		
		//유저의 평점 수/별점 부분에 들어갈 데이터들을 담고있는 변수
		HashMap<String, Double> userGradeList = as.userGradeInfo(user_id);
		//해당 유저 선호 태그 수 10개 가져오기
		ArrayList<String> tagNameList = as.selectTop10TagByUser(user_id);
		//선호 가수 6명 가져오기
		ArrayList<Singer> singerList = as.selectTop3SingerByUser(user_id);
		//선호 장르 6개 가져오기
		ArrayList<UserLog> genreLogList = as.selectTop3GenreByUser(user_id);
		//선호 국가 3개 가져오기
		ArrayList<UserLog> countryLogList = as.selectTop3CountryByUser(user_id);
		

		model.addAttribute("u_info", u_info);
		model.addAttribute("userGradeList", userGradeList);
		model.addAttribute("tagNameList", tagNameList);
		model.addAttribute("singerList", singerList);
		model.addAttribute("genreLogList", genreLogList);
		model.addAttribute("countryLogList", countryLogList);
		
		return "analysis/main";
	}
	
	



	
}
