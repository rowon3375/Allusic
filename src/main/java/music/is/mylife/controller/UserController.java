package music.is.mylife.controller;

import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import music.is.mylife.service.UserService;
import music.is.mylife.vo.Song;
import music.is.mylife.vo.UserInfo;

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	UserService us;
	
	
	/**
	 * 회원가입 처리
	 * @param userinfo
	 * @param model
	 * @return redirect:/
	 */
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(@ModelAttribute("userinfo") UserInfo userinfo ,Model model) {
				
		if(us.insertUser(userinfo)) {
			System.out.println("회원가입 성공!!!!");
		}else {
			System.out.println("회원가입 실패!!!!");
		}
			
		//회원가입 처리
		return "redirect:/";
	}
	
	
	/**
	 * 로그인 하기
	 * @param user_id
	 * @param user_pw
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(String user_id, String user_pw, Model model, HttpSession session) {
		
		UserInfo user_info = us.selectUser(user_id);
		
		//아이디와 패스워드가 존재할 때 user_id를 세션에 설정
		if(user_info != null && user_info.getUser_pw().equals(user_pw)) {
			session.setAttribute("user_id", user_id);
		}
		return "redirect:/";
	}
	
	/**
	 * 로그아웃 하기
	 * @param status
	 * @return
	 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.invalidate();
		//session.removeAttribute("user_id");
		
		return "redirect:/";
	}
	
	
}
