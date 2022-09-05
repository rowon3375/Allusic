package music.is.mylife.vo;



import lombok.Data;

@Data
public class Playlist {
	private int playlist_id;
	private String user_id;
	private String list_name;
	//리스트 설명
	private String list_explain;
	//리스트 좋아요 수
	private int list_like;
	//리스트 갱신 일시
	private String list_date;
	
	private int list_detail_id;
	private int song_id;
	
	//리스트 페이지 변수 추가
    private String album_img;
    private String song_name;
    private String genre;
    private String country;
    private String singer_name;
    private int singer_id;
	
}
