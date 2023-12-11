
package org.sara.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.sara.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller

@Log4j

@AllArgsConstructor
public class LoginController {

	@Autowired
	private UserService service;

	@GetMapping("/login")
	public String loginPage() {
		return "book/login";
	}

	@PostMapping("/login")
	public String login(@RequestParam Integer users_id, @RequestParam String pw, HttpServletRequest req) {
		HttpSession session = req.getSession();
		log.info(users_id);
		log.info(pw);
		if (service.authenticateUser(users_id, pw)) {
			log.info("good");
			session.setAttribute("loginUser", service.getUserByUsers_id(users_id));
			log.info("success");
			return "redirect:/sara";
		} else {
			return "redirect:/login";
		}
	}

	@GetMapping("/logout")
	public String logoutMainGET(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();

		session.invalidate();

		return "redirect:/sara";

	}
}
