package org.sara.controller;

import java.util.List;

import org.sara.domain.BoardVO;
import org.sara.domain.BookVO;
import org.sara.service.BookService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String searchList(Model model,@RequestParam(value = "searchType",required = false, defaultValue = "name") String searchType,
			   @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int page) {
		int pageSize = 10; // 페이지당 아이템 수
		int totalPages = (int) Math.ceil((double) service.countKey(searchType,keyword) / pageSize);
		log.info("www");
		
	 List<BookVO> list = service.searchList(searchType, keyword,page,pageSize);
	 //list = service.listPage(page.getDisplayPost(), page.getPostNum());
	 model.addAttribute("list", list);
	 model.addAttribute("currentPage", page);
	model.addAttribute("totalPages", totalPages);
	 return "book/searchbook";
	}
	
	
	
	@GetMapping("/about")
	public void about() {

	}

	/*
	 * @GetMapping({ "/list", "/modify" }) public void get(@RequestParam(value =
	 * "users_id", required = false) Integer users_id,@RequestParam("books_id") int
	 * books_id, Model model,HttpSession session) { log.info("/get or modify"); if
	 * (users_id != null) { // If users_id is present in the request, set it in the
	 * session session.setAttribute("users_id", users_id); }
	 * 
	 * model.addAttribute("book", service.get(books_id));
	 * 
	 * }
	 */
	@GetMapping({ "/bookdetail", "/modify" })
	public void get(@RequestParam(value = "users_id", required = false) Integer users_id,@RequestParam("books_id") int books_id, Model model) {
		log.info("/get or modify");
		model.addAttribute("book", service.get(books_id));
		
	}

	@GetMapping("/board")
	public void board() {

	}

	@GetMapping("/bestseller")
	public void bestseller(Model model) {

	}

	@GetMapping("/allList")
	public String getAllBooks(Model model, @RequestParam(defaultValue = "1") int page) {
		int pageSize = 10; // 페이지당 아이템 수
		List<BookVO> books = service.getAllBooks(page, pageSize);
		int totalPages = (int) Math.ceil((double) service.countBooks() / pageSize);
		log.info("www");
		model.addAttribute("list", books);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		log.info(service.countBooks());

		return "book/AllList";
	}

	@GetMapping("/edulist")
	public String getEduBooks(Model model, @RequestParam(defaultValue = "1") int page) {
		int pageSize = 10; // 페이지당 아이템 수
		List<BookVO> books = service.getEduBooks(page, pageSize);
		int totalPages = (int) Math.ceil((double) service.countEduBooks() / pageSize);
		log.info("www");
		model.addAttribute("list", books);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "book/educationlist";
	}

	@GetMapping("/colist")
	public String getCoBooks(Model model, @RequestParam(defaultValue = "1") int page) {
		int pageSize = 10; // 페이지당 아이템 수
		List<BookVO> books = service.getCoBooks(page, pageSize);
		int totalPages = (int) Math.ceil((double) service.countCoBooks() / pageSize);
		log.info("www");
		model.addAttribute("list", books);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "book/comiclist";
	}

	@GetMapping("/ficlist")
	public String getFicBooks(Model model, @RequestParam(defaultValue = "1") int page) {
		int pageSize = 10; // 페이지당 아이템 수
		List<BookVO> books = service.getFicBooks(page, pageSize);
		int totalPages = (int) Math.ceil((double) service.countFicBooks() / pageSize);
		log.info("www");
		model.addAttribute("list", books);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "book/fictionlist";
	}

	@GetMapping("/mypage")
	public String my() {
		return "book/mypage";
	}

	

}
