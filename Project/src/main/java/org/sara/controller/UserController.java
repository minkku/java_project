package org.sara.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/")
@Log4j
@AllArgsConstructor
public class UserController {
	@GetMapping("/signup")
	public String signupForm() {
		return "signup";
	}
	
	@PostMapping("/signup")
	public String signup() {
		return "redirect:/login";
	}
}
