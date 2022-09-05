package music.is.mylife.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import music.is.mylife.vo.UserInfo;

@Repository
public class UserDAO {

	@Autowired
	private SqlSession session;

	/* 로그인 하기
 	이름: selectUser
 	파라미터 타입: String
 	변수 이름: user_id
 	리턴 타입: UserInfo
	 */
	public UserInfo selectUser(String user_id) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		
		//user_info 검색 결과를 변수 idCheck에 담음
		UserInfo idCheck = mapper.selectUser(user_id);
		
		return idCheck;
	}
	
	
	/* 회원가입 하기
	 	이름: insertUser
	 	파라미터 타입: UserInfo
	 	변수 이름: userinfo
	 	리턴 타임: int
	 */
	public int insertUser(UserInfo userinfo) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		//중복 유저 처리
		if(mapper.joinDupleCheck(userinfo) > 0) {
			return 0;
		}
		//회원가입 데이터 변수 user에 담음
		mapper.insertUser(userinfo);
		
		return 1;
	}
	
	public int joinDupleCheck(UserInfo userinfo) {
		UserMapper mapper = session.getMapper(UserMapper.class);
		
		//중복이면 1, 아니면 0
		int result = mapper.joinDupleCheck(userinfo);
		
		return result;
		
	}
}
