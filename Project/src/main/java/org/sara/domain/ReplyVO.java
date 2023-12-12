package org.sara.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private int reply_id;
	private int books_id_id;
	private String content;
	private Date created_at;
	private Date updated_at;
	private int users_id_id;

}
