package music.is.mylife.dao;

import java.util.ArrayList;

import music.is.mylife.vo.ListComment;
import music.is.mylife.vo.Playlist;
import music.is.mylife.vo.Song;

public interface ListMapper {
	
	//해당 곡이 들어있는 리스트 부르기(곡)
	public ArrayList<Playlist> selectListId(int song_id);
	//플레이리스트의 리스트 배너 상위 5개 출력(곡)
	public ArrayList<Playlist> selectListBanner(int playlist_id);
	//해당 유저의 모든 리스트 좋아요 수(취향) 
	public Double selectListLikesByUser(String user_id);
	//해당 유저의 모든 리스트에 지금까지 달린 모든 댓글 수(취향)
	public double selectListCommentsNumByUser(String user_id);
	//해당 유저의 총 리스트 수(취향)
	public double selectListCountByUser(String user_id);
		
	//리스트 곡 정보 출력
	public ArrayList<Playlist> selectListSong(int playlist_id);
	//리스트 정보 출력
	public Playlist selectListInfo(int playlist_id);
	//해당 리스트 곡 개수
	public int selectCountSong(int playlist_id);
	//리스트 댓글 개수
	public int selectCountComment(int playlist_id);
	//리스트 좋아요 검색
	public Playlist selectListLike(int playlist_id);
	//리스트 댓글 전체 출력
	public ArrayList<ListComment> selectListComment(int playlist_id);
	//리스트 댓글 입력
	public int insertListCommnet(ListComment reply);
	//댓글 삭제하기
	public int deleteComment(ListComment delComment);
	//리스트 좋아요수 올리기 /내리기
	public int updateLike(Playlist pl);
	
	
}
