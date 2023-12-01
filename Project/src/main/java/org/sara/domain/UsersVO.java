package org.sara.domain;

import lombok.Data;

@Data
public class UsersVO {
	int users_id;
	String name;
	String pw;
	String address; // 수정해야함
	String gender;
	String email;
	String mobile;
	int point;
}
