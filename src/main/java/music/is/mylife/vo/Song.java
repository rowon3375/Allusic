package music.is.mylife.vo;

import lombok.Data;

@Data
public class Song {
	private int song_id;
	private int singer_id;
	private String song_name;
	private String genre;
	//조회수
	private int hit;
	//가사
	private String lyrics;
	private String album_name;
	private String album_img;
	private String album_date;
	//작곡, 작사가
	private String writer;
	private String composer;
	
	private String country;
	private String singer_name;
	private double avg;
	
}
