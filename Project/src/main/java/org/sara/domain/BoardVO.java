package org.sara.domain;
import java.util.Date;
import lombok.Data;

@Data
public class BoardVO {
	private int board_id;     //게시판번호
	private int users_id;  //users id
	private String user_name;
	private String title;     //게시글제목
	private String content;   //게시물
	private Date created_at;   //작성일	
	private Date updated_at;   //수정날짜
}