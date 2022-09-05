package music.is.mylife.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import music.is.mylife.dao.ListDAO;
import music.is.mylife.vo.ListComment;
import music.is.mylife.vo.Playlist;

@Service
public class ListService {

	@Autowired
	ListDAO ldao;
	
	// 해당 곡이 들어있는 리스트 부르기(곡)
	public ArrayList<Playlist> selectListId(int song_id){
		ArrayList<Playlist> listId = ldao.selectListId(song_id);
		
		return listId;
	}
	
	//플레이리스트의 배너 사진 가져오기(곡)
	public ArrayList<Playlist> listBanner(int playlist_id){
		ArrayList<Playlist> banner = ldao.selectListBanner(playlist_id);
		
		return banner;
	}
	
	//리스트 곡 정보 출력
	public ArrayList<Playlist> listSong(int playlist_id){
		ArrayList<Playlist> listSong = ldao.selectListSong(playlist_id);
		
		return listSong;
	}
	
	//리스트 정보 출력
	public Playlist listInfo(int playlist_id) {
		Playlist info = ldao.selectListInfo(playlist_id);
		
		return info;
	}
	
	/**
	 * 해당 리스트 곡 개수
	 * @param playlist_id
	 * @return int
	 */
	public int countSong(int playlist_id) {
		int count = ldao.selectCountSong(playlist_id);
		
		return count;
	}
	
	/**
	 * 리스트 댓글 개수
	 * @param playlist_id
	 * @return int
	 */
	public int countComment(int playlist_id) {
		int countComment = ldao.selectCountComment(playlist_id);
		
		return countComment;
	}
	
	
	/**
	 * 리스트 좋아요 검색
	 * @param playlist_id
	 * @return Playlist
	 */
	public Playlist listLike(int playlist_id) {
		Playlist like = ldao.selectListLike(playlist_id);
		
		return like;
	}
	
	/**
	 * 리스트 전체 출력
	 * @param listReply
	 * @return
	 */
	public ArrayList<ListComment> listComment(int playlist_id){
		ArrayList<ListComment> list = ldao.selectListComment(playlist_id);
		
		return list;
	}
	
	/**
	 * 리스트 댓글 입력
	 * @param comment
	 * @return int
	 */
	public int insertCommnet(ListComment reply) {
		int listReply = ldao.insertListCommnet(reply);
		
		return listReply;
	}
	
	/**
	 * 댓글 삭제하기
	 * @param delComment
	 * @return
	 */
	public int deleteComment(ListComment delComment) {
		int commentDel = ldao.deleteComment(delComment);
		
		return commentDel;
	}
	
	
	/**
	 * 리스트 좋아요수 올리기/내리기
	 * @param playlist_id
	 * @return int
	 */
	public int updateLike(Playlist pl) {
		int plusLike = ldao.updateLike(pl);
		
		return plusLike;
	}
	
}
