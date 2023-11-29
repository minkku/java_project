package org.sara.controller;

import org.sara.domain.UserVO;
import org.sara.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String signupPg(Model model) {
		log.info("signup Page");
		model.addAttribute("user", new UserVO());
		return "book/signup";
	}
	
	@PostMapping("/signup")
	public String signup(@ModelAttribute("user") UserVO user, RedirectAttributes redirectA) {
		try {
			us.reg(user);
			return "redirect:/signin";
		} catch (Exception e) {
			redirectA.addFlashAttribute("error", "Registration failed");
			return "redirect:/signup";
		}
	}
}