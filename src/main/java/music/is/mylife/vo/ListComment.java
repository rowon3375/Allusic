package music.is.mylife.vo;



import lombok.Data;

@Data
public class ListComment {
	private int list_comment_id;
	private String user_id;
	private int playlist_id;
	//유저가 작성한 코멘트
	private String user_comment;
	//코멘트 작성 일시
	private String comment_date;
	
}
