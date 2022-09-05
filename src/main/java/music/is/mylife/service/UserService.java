package music.is.mylife.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import music.is.mylife.dao.UserDAO;
import music.is.mylife.vo.UserInfo;


@Service
public class UserService {
	@Autowired
	UserDAO ud;

	
	/**
	 * 회원가입 처리
	 * @param userinfo
	 * @return
	 */
	public boolean insertUser(UserInfo userinfo) {
		
		//회원가입 처리
		int join = ud.insertUser(userinfo);
		
		if(join > 0) {
			return true;
		}else {return false;}
	}
	
	/**
	 * 로그인 하기
	 * @param user_id
	 * @return
	 */
	public UserInfo selectUser(String user_id) {
		
		UserInfo user_info = ud.selectUser(user_id);
		
		return user_info;
	}
}
