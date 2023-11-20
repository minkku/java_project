package org.sara.controller;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.sara.domain.CartsVO;
import org.sara.mapper.CartsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
						"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class CartsMapperTest {
	@Setter(onMethod_ = {@Autowired})
	public CartsMapper mapper;
	
	@Test
	public void getCartList() {
		List<CartsVO> list = mapper.getCartList(1);
		for(CartsVO cart : list) {
			log.info(cart);
			log.info("init cart : " + cart);
		}
	}
}
