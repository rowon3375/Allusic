package music.is.mylife.vo;

import lombok.Data;

@Data
public class Tag {
	private int song_tag_detail_id;
	private int tag_id;
	private String tag_name;
	private int song_id;
	private int recommend;

}
