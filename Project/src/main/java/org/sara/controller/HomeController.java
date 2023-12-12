package org.sara.controller;

import org.sara.service.BookService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/*")
public class HomeController {
	private BookService service;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@GetMapping("/sara")
	public String home(Model model) {
		logger.info("main");

		model.addAttribute("bestlist", service.getBestList());
		model.addAttribute("commendlist", service.getCommendList());
		return "/main";
	}

}
