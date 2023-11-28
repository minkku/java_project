package org.sara.controller;

import org.sara.domain.UserVO;
import org.sara.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/*")
@Log4j
@AllArgsConstructor
public class UserController {
	
	@Autowired
	private UserService us;
	
	@GetMapping("/signup")
	public String signupPg() {
		log.info("signup Page");
		return "book/signup";
	}
	
	@RequestMapping(value="/signup", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
		public String reg(UserVO users) throws Exception {
			log.info("controller ================= " + users);
			us.reg(users);
			return "redirect:/signin";
	}
}
