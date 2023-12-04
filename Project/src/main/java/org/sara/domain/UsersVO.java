package org.sara.domain;

import lombok.Data;

@Data
public class UsersVO {
	int users_id;
	String user_name;
	String pw;
	String adress; // 수정해야함
	String gender;
	String email;
	String mobile;
	int point;
}
