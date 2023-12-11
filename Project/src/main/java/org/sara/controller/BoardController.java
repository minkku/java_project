package org.sara.controller;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.sara.domain.BoardVO;
import org.sara.domain.NoticeVO;
import org.sara.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor

public class BoardController {

	private BoardService service;
	
	/*
	 * @GetMapping("/board") public String board(Authentication authentication,
	 * Model model) { if (authentication != null &&
	 * authentication.isAuthenticated()) { // 로그인한 사용자에 대한 처리 return "board"; } else
	 * { // 로그인하지 않은 사용자에 대한 처리 return "redirect:/login"; } }
	 * 
	 * @GetMapping("/login") public String login() { return "login"; }
	 */

	
	
	/*
	 * @GetMapping("/list")
	 * 
	 * public String getAllBoards(@RequestParam(name = "keyWord", required = false)
	 * String keyword, HttpSession session, Model model, @RequestParam(defaultValue
	 * = "1") int page) { session.setAttribute("users_id_id", 1); //나중에 없어질거 int
	 * pageSize = 10; // 페이지당 아이템 수 List<BoardVO>boards = service.getAllBoards(page,
	 * pageSize); int totalPages = (int) Math.ceil((double) service.countBoards() /
	 * pageSize); log.info("list...-"); model.addAttribute("users_id_id",
	 * session.getAttribute("users_id_id")); model.addAttribute("list", boards);
	 * 
	 * model.addAttribute("currentPage", page); model.addAttribute("totalPages",
	 * totalPages);
	 * 
	 * if (keyword.length() < 0 || keyword == null) { model.addAttribute("list",
	 * boards); } else { model.addAttribute("list",
	 * session.getAttribute("searchList")); //.추가한것 }
	 * 
	 * 
	 * return "board/list"; }
	 * 
	 * 
	 * 
	 * @PostMapping("/list")
	 * 
	 * public String searchType (HttpSession session, Model model,
	 * 
	 * @RequestParam("searchType")String searchType,
	 * 
	 * @RequestParam("keyWord") String keyword) {
	 * 
	 * if(searchType.equals("title")) { session.setAttribute("searchList",
	 * service.searchTypeTitle(keyword)); } else if (searchType.equals("content")) {
	 * session.setAttribute("searchList", service.searchTypeContent(keyword)); }
	 * 
	 * return "redirect:/board/list?keyword=" + keyword; }
	 */
	
	
	
	
	@GetMapping("/list")
	public String getAllBoards(@RequestParam(name = "encodedKeyword", required = false) String encodedKeyword,
	                           HttpSession session, Model model, 
	                           @RequestParam(defaultValue = "1") int page) {
	    session.setAttribute("users_id_id", 1);
	    int pageSize = 10;
	    List<BoardVO> boards;
	    
	    List<BoardVO> boardss; 
        List<BoardVO> boardsss;		

	    
	    if (encodedKeyword == null || encodedKeyword.length() == 0) {
	        boards = service.getAllBoards(page, pageSize);
	    } else {
	        boards = (List<BoardVO>) session.getAttribute("searchList");
	        log.info("가나다"+boards);
	    }

	    int totalPages = (int) Math.ceil((double) service.countBoards() / pageSize);

	    model.addAttribute("users_id_id", session.getAttribute("users_id_id"));
	    model.addAttribute("list", boards);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", totalPages);

	    return "board/list";
	}

	
	@PostMapping("/list")
	public String searchType(HttpSession session, Model model, @RequestParam(defaultValue = "1") int page,
	                         @RequestParam("searchType") String searchType,
	                         @RequestParam("keyword") String keyword) {
		
		String encodedKeyword = URLEncoder.encode(keyword, StandardCharsets.UTF_8);
		
		int pageSize = 10; // 페이지당 아이템 수
        
		int totalPages= (int) Math.ceil((double) service.countTitle() / pageSize);
        int totalPage= (int) Math.ceil((double) service.countContent() / pageSize);
       
        
        List<BoardVO> boardss = service.searchTypeTitle(encodedKeyword, page, pageSize);
        List<BoardVO> boardsss = service.searchTypeContent(encodedKeyword, page, pageSize);
		        
        log.info("enc...." +boardss);
        
        if (searchType.equals("title")) {
	        session.setAttribute("searchList", service.searchTypeTitle(encodedKeyword, page, pageSize));
	        log.info(service.searchTypeTitle(encodedKeyword, page, pageSize));
	    } else if (searchType.equals("content")) {
	        session.setAttribute("searchList", service.searchTypeContent(encodedKeyword, page, pageSize));
	        log.info(service.searchTypeContent(encodedKeyword, page, pageSize));
	    }

	    return "redirect:/board/list?encodedKeyword=" + encodedKeyword;
	}
	
	
	
	
		
	@GetMapping("/register")
	public void register(Model model, @RequestParam(name = "users_id_id", required = false) int users_id_id) {
		log.info("registerffffffff");
		model.addAttribute("email", service.getUsersEmail(users_id_id));
	}

		
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("register.. : " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getBoard_id());
		return "redirect:/board/list";		
	}
		
		
	@GetMapping({"/get","/modify"})
    public void get(HttpSession session,@RequestParam("board_id") int board_id, Model model ) {
       log.info("/get or modify");
       model.addAttribute("users_id_id", session.getAttribute("users_id_id"));
       model.addAttribute("board", service.get(board_id));
       
    }
	@GetMapping("/notice")
	   public String getAllNotice(Model model, @RequestParam(defaultValue = "1") int page) {
	        int pageSize = 10; // 페이지당 아이템 수
	        List<NoticeVO>boards = service.getNoticeBoards(page, pageSize);
	        int totalPages = (int) Math.ceil((double) service.countNoticeBoards() / pageSize);
	        log.info("notice-");
	        model.addAttribute("list", boards);
	        model.addAttribute("currentPage", page);
	        model.addAttribute("totalPages", totalPages);

	        return "board/notice";
	    }
	
    @PostMapping("/modify")
    public String modify(BoardVO board,RedirectAttributes rttr) {
       log.info("modify:"+board);
       
       if(service.modify(board)) {
          rttr.addFlashAttribute("result","success");
       }
       return "redirect:/board/list";
    }
	
	
    @PostMapping("/remove")
	public String remove(@RequestParam("board_id") int board_id, RedirectAttributes rttr) {
		log.info("remove...." + board_id);
		if(service.remove(board_id)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}
    
    @GetMapping("/mylist")
    public String myListBoards(HttpSession session, Model model, @RequestParam(name="users_id_id", required = false) int users_id_id,
    						   @RequestParam(defaultValue = "1") int page) {
//    	session.setAttribute("users_id_id", 1);//임의로 넣어둠
    	int pageSize = 10; // 페이지당 아이템 수
        int totalPages = (int) Math.ceil((double) service.countmyListBoards() / pageSize);
       
        List<BoardVO> boards = service.myListBoards(users_id_id, page, pageSize);
        log.info("mylist-");
        model.addAttribute("users_id_id", session.getAttribute("users_id_id"));
        model.addAttribute("mylist", boards);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        return "board/mylist";
         
 	    }
 
 



}

