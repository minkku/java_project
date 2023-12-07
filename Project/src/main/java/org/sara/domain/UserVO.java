package org.sara.domain;

import lombok.Data;

@Data
public class UserVO {
	private int id;
	private String user_name;
	private String pw;
	private String address;
	private String gender;
	private String email;
	private String mobile;
	private int point;
}


