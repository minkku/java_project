package org.sara.domain;

import lombok.Data;

@Data
public class UserVO {
	Integer users_id;
	String name;
	String pw;
	String address;
	String gender;
	String email;
	String mobile;
	double point;
}
