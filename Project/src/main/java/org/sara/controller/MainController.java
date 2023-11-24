package org.sara.controller;

import org.sara.service.BookService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/book/*")
public class MainController {
	@Autowired
	private BookService service;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	@GetMapping("/about")
	public String about() {
		return "book/about";
	}
	@GetMapping("/board") 
	public String board() {
		return "book/board";
	}
	@GetMapping("/bestseller")
	public String bestseller(Model model) {
		return "book/bestseller";
	}
	@GetMapping("/list")
	public String getlist(Model model )  {
		log.info("/listall");
		model.addAttribute("list",service.getList());
		return "book/list2";
	}
	@GetMapping("/mypage")
	public String my() {
		return "book/Mypage";
	}
	@GetMapping("/login")
	public String login() {
		return "book/login";
	}
	
	@GetMapping("/bookdetail")
	public String get(@RequestParam("books_id") int books_id,Model model )  {
		log.info("/bookdetail");
		System.out.println(books_id);
		model.addAttribute("book",service.get(books_id));
		return "book/bookdetail";
	}
}
