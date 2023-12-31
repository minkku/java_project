package org.sara.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.sara.domain.BookVO;
import org.sara.service.BookService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String searchList(Model model,
			@RequestParam(value = "searchType", required = false, defaultValue = "name") String searchType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int page) {
		int pageSize = 10; // �럹�씠吏��떦 �븘�씠�뀥 �닔
		int totalPages = (int) Math.ceil((double) service.countKey(searchType, keyword) / pageSize);
		log.info("www");

		List<BookVO> list = service.searchList(searchType, keyword, page, pageSize);
		// list = service.listPage(page.getDisplayPost(), page.getPostNum());
		model.addAttribute("list", list);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		return "book/searchbook";
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
	public void get(@RequestParam(value = "users_id", required = false) Integer users_id,
			@RequestParam("books_id") int books_id, Model model) {
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
		int pageSize = 12;
		List<BookVO> books = service.getAllBooks(page, pageSize);
		int totalPages = (int) Math.ceil((double) service.countBooks() / pageSize);
		model.addAttribute("books", books);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		log.info(service.countBooks());
		log.info(books);
		return "book/AllList";
	}

	   @RequestMapping(value = "/select", method = RequestMethod.GET, produces = "application/json")
	   @ResponseBody
	   public Map<String, Object> getBooksByCategory(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "all") String category) {
	       Map<String, Object> result = new HashMap<>();
	          List<BookVO> books;
	          int pageSize = 8;

	          if (category.equals("all")) {
	              books = service.getAllBooks(page, pageSize);
	          } else if (category.equals("fic")) {
	              books = service.getFicBooks(page, pageSize);
	          } else if (category.equals("comic")) {
	              books = service.getCoBooks(page, pageSize);
	          } else if (category.equals("edu")) {
	              books = service.getEduBooks(page, pageSize);
	          } else if (category.equals("young")) {
	              books = service.getYoungBooks(page, pageSize);
	          } else {
	              // Handle unknown category or return an empty list
	              books = Collections.emptyList();
	          }

	          // 로깅
	          log.info("Returning books: " + books);

	          // 현재 페이지와 총 페이지 수를 결과에 추가
	          result.put("books", books);
	          result.put("currentPage", page);
	          result.put("totalPages", calculateTotalPages(category, pageSize)); // 이 메서드는 총 페이지 수를 계산하는데 필요한 로직을 추가하여야 합니다.

	          return result;
	      }
	   
	   private int calculateTotalPages(String category, int pageSize) {
	       // 각 카테고리에 따라 전체 도서 수를 가져옴
	       int totalBooks;
	       if (category.equals("all")) {
	           totalBooks = service.countBooks();
	       } else if (category.equals("fic")) {
	           totalBooks = service.countFicBooks();
	       } else if (category.equals("comic")) {
	           totalBooks = service.countCoBooks();
	       } else if (category.equals("edu")) {
	           totalBooks = service.countEduBooks();
	       } else if (category.equals("young")) {
	           totalBooks = service.countYoungBooks();
	       } else {
	           // Handle unknown category or return 0
	           return 0;
	       }

	       // 총 페이지 수 계산
	       return (int) Math.ceil((double) totalBooks / pageSize);
	   }

	@GetMapping("/edulist")
	public String getEduBooks(Model model, @RequestParam(defaultValue = "1") int page) {
		int pageSize = 10; // �럹�씠吏��떦 �븘�씠�뀥 �닔
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
		int pageSize = 10; // �럹�씠吏��떦 �븘�씠�뀥 �닔
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
		int pageSize = 10; // �럹�씠吏��떦 �븘�씠�뀥 �닔
		List<BookVO> books = service.getFicBooks(page, pageSize);
		int totalPages = (int) Math.ceil((double) service.countFicBooks() / pageSize);
		log.info("www");
		model.addAttribute("list", books);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "book/fictionlist";
	}
	@GetMapping("/younglist")
	public String getYoungBooks(Model model, @RequestParam(defaultValue = "1") int page) {
		int pageSize = 10; // �럹�씠吏��떦 �븘�씠�뀥 �닔
		List<BookVO> books = service.getYoungBooks(page, pageSize);
		int totalPages = (int) Math.ceil((double) service.countYoungBooks() / pageSize);
		log.info("www");
		model.addAttribute("list", books);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "book/younglist";
	}
	@PostMapping("/add")
	public String AddToCarts(HttpSession session, @RequestParam int hiddenQuantity, @RequestParam int books_id) {
		int users_id = (int) session.getAttribute("users_id");
		service.insertItem(users_id, books_id, hiddenQuantity);
	
		return "redirect:/book/bookdetail?books_id=" + books_id;
				
		
	}


}
