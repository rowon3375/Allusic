package music.is.mylife.dao;

import music.is.mylife.vo.UserInfo;

public interface UserMapper {
	/* 로그인하기
	 	이름: selectIdCheck
	 	파라미터 타입: String
	 	변수 이름: user_id
	 	리턴 타입: UserInfo
	 */
	public UserInfo selectUser(String user_id);
	
	
	/* 회원가입 하기
		이름: insertUser
		파라미터 타입: UserInfo
		변수 이름: userinfo
		리턴 타임: int
	*/
	public int insertUser(UserInfo userinfo);
	
	/* 회원중복 체크
		이름: insertUser
		파라미터 타입: UserInfo
		변수 이름: userinfo
		리턴 타임: int
	 */
	public int joinDupleCheck(UserInfo userinfo);

}
