package music.is.mylife.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import music.is.mylife.dao.ListDAO;
import music.is.mylife.dao.SingerDAO;
import music.is.mylife.dao.TagDAO;
import music.is.mylife.dao.UserLogDAO;
import music.is.mylife.vo.Singer;
import music.is.mylife.vo.Tag;
import music.is.mylife.vo.UserInfo;
import music.is.mylife.vo.UserLog;


@Service
public class AnalysisService {
	//Autowired DAO, 세션(선택)
	@Autowired
	UserService us;
	@Autowired
	ListDAO ld;
	@Autowired
	UserLogDAO uld;
	@Autowired
	TagDAO td;
	@Autowired
	SingerDAO sid;
	
	//현재 로그인 한 사람의 id를 가지고 유저 정보 불러옴
	public UserInfo selectUser(String user_id) {
		
		return us.selectUser(user_id);
	}
	
	//유저의 평점 수/별점 부분에 들어갈 데이터들을 구하는 함수
	public HashMap<String, Double> userGradeInfo(String user_id) {
		
		HashMap<String, Double> userGradeList = new HashMap<>();
		
		//한 유저가 지금까지 평가한 곡들의 별점 총합
		double allStarCount = uld.selectAllStarCountByUser(user_id);
		
		//총 리스트 좋아요 수
		double listLikeNum = ld.selectListLikesByUser(user_id);
		//총 리스트 코멘트 수
		double listCommentNum = ld.selectListCommentsNumByUser(user_id);
		//해당 유저의 총 리스트 수
		double listCount = ld.selectListCountByUser(user_id);
		//유저가 별점을 매긴 곡의 개수
		double allsongCount = uld.selectSongCountByUser(user_id);
		//한 유저가 지금까지 매긴 별점의 평균
		double allStarSum = uld.selectAllStarSumByUser(user_id);
		//한 유저가 가장 많이 준 별점
		double topStar = uld.selectTopStarByUser(user_id);
		
		userGradeList.put("allStarCount", allStarCount);
		userGradeList.put("listLikeNum", listLikeNum);
		userGradeList.put("listCommentNum", listCommentNum);
		userGradeList.put("listCount", listCount);
		
		userGradeList.put("allsongCount", allsongCount);
		userGradeList.put("allStarSum", allStarSum);
		userGradeList.put("topStar", topStar);
		
		return userGradeList;
	}
	
	//선호 태그 수 10개 가져오기
	public ArrayList<String> selectTop10TagByUser(String user_id){
		ArrayList<Tag> tagList = uld.selectTop10TagByUser(user_id);
		ArrayList<String> tagNameList = new ArrayList<String>();
		
		//태그 수만큼 태그 이름 가져오기
		for(Tag t : tagList) {
			Tag tagName = td.selectTagsById(t.getTag_id());
			
			tagNameList.add(tagName.getTag_name());
		}
		
		
		return tagNameList;
	}
	
	//선호 가수 6명 가져오기
	public ArrayList<Singer> selectTop3SingerByUser(String user_id){
		ArrayList<UserLog> singerLogList = uld.selectTop3SingerByUser(user_id);
		ArrayList<Singer> singerList = new ArrayList<Singer>();
		
		//태그 수만큼 태그 이름 가져오기
		for(UserLog ul : singerLogList) {
			Singer singer = sid.selectSingerById(ul.getSinger_id());
			
			singerList.add(singer);
		}
		
		
		return singerList;
	}
	
	//선호 장르 수 3개 가져오기
	public ArrayList<UserLog> selectTop3GenreByUser(String user_id){
		ArrayList<UserLog> genreLogList = uld.selectTop3GenreByUser(user_id);
		
		return genreLogList;
	}
	
	//선호 국가 수 3개 가져오기
	public ArrayList<UserLog> selectTop3CountryByUser(String user_id){
		ArrayList<UserLog> countryLogList = uld.selectTop3CountryByUser(user_id);
		
		return countryLogList;
	}
	
	
	
}
