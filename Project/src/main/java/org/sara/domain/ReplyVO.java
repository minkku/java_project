package org.sara.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private int reply_id;
	private int books_id_id;
	private String content;
	private Date create_at;
	private Date update_at;
	private Integer users_id_id;

}
