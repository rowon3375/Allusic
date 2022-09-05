package music.is.mylife.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import music.is.mylife.vo.ListComment;
import music.is.mylife.vo.Playlist;
import music.is.mylife.vo.Song;

@Repository
public class ListDAO {
	
	@Autowired
	private SqlSession session;
	
	//해당 곡이 들어있는 리스트 부르기(곡)
	public ArrayList<Playlist> selectListId(int song_id){
		ListMapper mapper = session.getMapper(ListMapper.class);
		ArrayList<Playlist> listId = mapper.selectListId(song_id);
		
		return listId;
	}

	/** 
	 * 플레이리스트의 리스트 배너 상위 5개 출력(곡)
	 * @return ArrayList<Song>
	 */
	public ArrayList<Playlist> selectListBanner(int playlist_id){
		ListMapper mapper = session.getMapper(ListMapper.class);
		
		ArrayList<Playlist> banner = mapper.selectListBanner(playlist_id);
		
		return banner;
	}
	
	//해당 유저의 모든 리스트 좋아요 수 
	public double selectListLikesByUser(String user_id) {
		ListMapper mapper = session.getMapper(ListMapper.class);
		
		double dou = 0.0;
		Double count = mapper.selectListLikesByUser(user_id);
		
		if (count != null) {
			dou = count;
		}
		
		return dou;
		
	}
	
	//해당 유저의 모든 리스트에 지금까지 달린 모든 댓글 수
	public double selectListCommentsNumByUser(String user_id) {
		ListMapper mapper = session.getMapper(ListMapper.class);
		
		double listCommentNum = mapper.selectListCommentsNumByUser(user_id);
		
		return listCommentNum;
	}
	
	//해당 유저의 총 리스트 수
	public double selectListCountByUser(String user_id) {
		ListMapper mapper = session.getMapper(ListMapper.class);
		
		double listCount = mapper.selectListCountByUser(user_id);
		
		return listCount;
	}
		
	//리스트 곡 정보 출력
	public ArrayList<Playlist> selectListSong(int playlist_id){
		ListMapper mapper = session.getMapper(ListMapper.class);
		
		ArrayList<Playlist> listSong = mapper.selectListSong(playlist_id);
		
		return listSong;
	}
	
	//리스트 정보 출력
	public Playlist selectListInfo(int playlist_id) {
		ListMapper mapper = session.getMapper(ListMapper.class);
		
		Playlist info = mapper.selectListInfo(playlist_id);
		
		return info;
	}
	
	
	/**
	 * 해당 리스트 곡 개수
	 * @param playlist_id
	 * @return int
	 */
	public int selectCountSong(int playlist_id) {
		ListMapper mapper = session.getMapper(ListMapper.class);
		int count = mapper.selectCountSong(playlist_id);
		
		return count;
	}
	
	/**
	 * 리스트 댓글 개수
	 * @param playlist_id
	 * @return int
	 */
	public int selectCountComment(int playlist_id) {
		ListMapper mapper = session.getMapper(ListMapper.class);
		int commentNum = mapper.selectCountComment(playlist_id);
		
		return commentNum;
	}
	
	
	/**
	 * 리스트 좋아요 검색
	 * @param playlist_id
	 * @return Playlist
	 */
	public Playlist selectListLike(int playlist_id) {
		ListMapper mapper = session.getMapper(ListMapper.class);
		Playlist like = mapper.selectListLike(playlist_id);
		
		return like;
	}
	
	/**
	 * 리스트 전체 출력
	 * @param listReply
	 * @return
	 */
	public ArrayList<ListComment> selectListComment(int playlist_id){
		ListMapper mapper = session.getMapper(ListMapper.class);
		ArrayList<ListComment> list = mapper.selectListComment(playlist_id);
		
		return list;
	}
	
	/**
	 * 리스트 댓글 입력
	 * @param comment
	 * @return int
	 */
	public int insertListCommnet(ListComment reply) {
		ListMapper mapper = session.getMapper(ListMapper.class);
		int listReply = mapper.insertListCommnet(reply);
		
		return listReply;
	}
	
	/**
	 * 댓글 삭제하기
	 * @param delComment
	 * @return
	 */
	public int deleteComment(ListComment delComment) {
		ListMapper mapper= session.getMapper(ListMapper.class);
		int commentDel = mapper.deleteComment(delComment);
		
		return commentDel;
	}
	
	/**
	 * 리스트 좋아요수 올리기 /내리기
	 * @param playlist_id
	 * @return int
	 */
	public int updateLike(Playlist pl) {
		ListMapper mapper = session.getMapper(ListMapper.class);
		int plusLike = mapper.updateLike(pl);
		
		return plusLike;
	}
	
}
