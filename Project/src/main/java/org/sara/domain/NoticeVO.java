package org.sara.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	
	private int board_id;     //게시판번호
	private String title;     //게시글제목
	private String content;   //게시물
	private Date create_at;   //작성일	
	private Date update_at;	 //수정날짜
}
