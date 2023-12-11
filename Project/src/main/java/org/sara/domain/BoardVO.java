package org.sara.domain;

import java.util.Date;
import lombok.Data;

@Data
public class BoardVO {

	private int board_id; // 게시판번호
	private Integer users_id_id; // users id
	private String title; // 게시글제목
	private String content; // 게시물
	private Date create_at; // 작성일
	private Date update_at; // 수정날짜

}

/*
 * board_id` int PRIMARY KEY AUTO_INCREMENT, `users_id_id` int, `title`
 * varchar(100), `content` varchar(2000), `create_at` datetime, `update_at`
 * datetime
 */
