package org.sara.domain;

import lombok.Data;

@Data
public class Criteria {
	private int page;
	private int amount;
	
	public Criteria() {
		this(1,10);
		
	}
	public Criteria(int page,int amount) {
		this.page=page;
		this.amount=amount;
	}
	public int getPageStart() {
		return (page-1)*amount;
	}
}
