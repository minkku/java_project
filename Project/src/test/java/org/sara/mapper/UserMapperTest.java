package org.sara.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sara.domain.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class UserMapperTest {
	@Setter(onMethod_ = @Autowired)
	private UserMapper m;
	
	@Test
	public void signupTest() throws Exception {
		UserVO user = new UserVO();
		user.setName("testName");
		user.setEmail("testEmail@m.com");
		user.setPw("test1234");
		user.setAddress("testestest");
		user.setMobile("12341234");
		user.setGender("³²");
		user.setPoint(10000);
		
		m.reg(user);
		log.info("111111111111111111111" + user);
        log.info("User registration successful");
	}
}
