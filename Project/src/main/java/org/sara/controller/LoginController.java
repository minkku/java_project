package org.sara.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/")
@Log4j
@AllArgsConstructor
public class LoginController {
	@GetMapping("/login")
	public String loginPage() {
		return "login";
	}
	
	@GetMapping("/join")
	public String joinPage() {
		return "join";
	}
}
