package org.sara.domain;

import lombok.Data;

@Data
public class CartsListDTO {
	int carts_id;
	int books_id;
	String img;
	String name;
	String content;
	int quantity;
	int price;
}