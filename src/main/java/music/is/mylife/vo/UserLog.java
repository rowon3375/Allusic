package music.is.mylife.vo;



import lombok.Data;

@Data
public class UserLog {
	private String user_id;
	private int song_id;
	//곡에 매긴 별점(user_song_log)
	private double star;
	//해당 곡에 가장 최근 별점을 매긴 일시(user_song_log)
	private String star_date;
	//해당 국가/태그/.. 의 총 누적 별점 (user_song_log 이외)
	private double all_star;
	//해당 국가/태그/.. 의 총 누적 횟수
	private int grade_count;
	
	private int singer_id;
	private String genre;
	private String country;
	
	
	private int tag_id;
	
	private double star_avg;
	
	
	
}
