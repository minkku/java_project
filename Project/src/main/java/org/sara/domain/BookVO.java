package org.sara.domain;

import lombok.Data;

@Data
public class BookVO {
	private int books_id;
	private String name;
	private String author;
	private String content;
	private String img;
	private int categories_id_id;
	private int price;
}
