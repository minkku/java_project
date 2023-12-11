package org.sara.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.annotation.MapperScan;
import org.sara.mapper.CartsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CartsMapperTest {
	@Setter(onMethod_ = {@Autowired})
	private CartsMapper cartsMapper;
	
//	@Test
//	public void testList() {
//	   cartsMapper.getList().forEach(carts->{
//	      log.info(carts);
//	   });
//	}
}
