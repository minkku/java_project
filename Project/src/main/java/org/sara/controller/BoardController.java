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
import org.springframework.web.bind.annotation.ModelAttribute;
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
	 * = "1") int page) { session.setAttribute("users_id", 1); //나중에 없어질거 int
	 * pageSize = 10; // 페이지당 아이템 수 List<BoardVO>boards = service.getAllBoards(page,
	 * pageSize); int totalPages = (int) Math.ceil((double) service.countBoards() /
	 * pageSize); log.info("list...-"); model.addAttribute("users_id",
	 * session.getAttribute("users_id")); model.addAttribute("list", boards);
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
	    log.info("boards ----->" + boards);
	    model.addAttribute("users_id", session.getAttribute("users_id"));
	    model.addAttribute("list", boards);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", totalPages);

	    return "board/list";
	}

	
	@PostMapping("/list")
	public String searchType(HttpSession session, Model model, @RequestParam(defaultValue = "1") int page,
	                         @RequestParam("searchType") String searchType,
	                         @RequestParam("keyword") String keyword) {
		model.addAttribute("users_id", session.getAttribute("users_id"));
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
	public String registerB(Model model, HttpSession session) {
	    int users_id = (int) session.getAttribute("users_id");
	    log.info("users_id ------ register controller ---->" + users_id);
	    if (users_id != 0) {
	        log.info("register controller 로그인 되어있음");
	        model.addAttribute("email", service.getUsersEmail(users_id));
	        return "board/register";
	    } else {
	    	log.info("register controller 로그아웃 되어있음");
	        // 사용자 ID가 null인 경우에 대한 처리
	        // 예를 들어 로그인 페이지로 리다이렉트하거나 다른 방식으로 처리
	        return "redirect:/signin";
	    }
	}

		
	@PostMapping("/register")
	public String register(BoardVO board, @RequestParam("title") String title, HttpSession session,
						   @RequestParam("action") String action,
						   @RequestParam("content") String content, RedirectAttributes rttr){
		int users_id = (int) session.getAttribute("users_id");
		board.setUsers_id(users_id);
		log.info("register.. : " + board);
		if (action.equals("목록")) {
			return "redirect:/board/list";
		} else if (action.equals("등록")) {
			service.register(board);
		}
		rttr.addFlashAttribute("result", board.getBoard_id());
		return "redirect:/board/list";		
	}
		
		
	@GetMapping("/get")
    public void get(HttpSession session,@RequestParam("board_id") int board_id, Model model ) {
       log.info("/get");
       model.addAttribute("users_id", session.getAttribute("users_id"));
       log.info("users_id ---------->" + session.getAttribute("users_id"));
       log.info(board_id + "-----------board_id값");
       log.info("get(board_id)값 -=-----" + service.get(board_id));
       model.addAttribute("board", service.get(board_id));
       
    }
	@GetMapping("/notice")
	   public String getAllNotice(Model model,
			   @RequestParam(defaultValue = "1") int page) {
				int pageSize = 10; // 페이지당 아이템 수
				List<NoticeVO>boards = service.getNoticeBoards(page, pageSize);
				int totalPages = (int) Math.ceil((double) service.countNoticeBoards() / pageSize);
				log.info("notice-");
				model.addAttribute("list", boards);
				model.addAttribute("currentPage", page);
				model.addAttribute("totalPages", totalPages);

				return "board/notice";
	    }
	@GetMapping("/getNotice")
	public String getNotice(Model model, HttpSession session, @RequestParam("notice_id") int notice_id) {
		model.addAttribute("notice_id", notice_id);
		model.addAttribute("notice", service.getNoticeInfo(notice_id));
		return "board/getNotice";
	}
	@GetMapping("/modify")
    public String getModify(HttpSession session,@RequestParam("board_id") int board_id, Model model ) {
       log.info("modify");
       model.addAttribute("users_id", session.getAttribute("users_id"));
       log.info("users_id ---------->" + session.getAttribute("users_id"));
       log.info(board_id + "-----------board_id값");
       log.info("get(board_id)값 -=-----" + service.get(board_id));
       model.addAttribute("board", service.get(board_id));
       return "board/modify";
    }
	
	@PostMapping("/modify")
	public String modify(@ModelAttribute BoardVO board, RedirectAttributes rttr, Model model, HttpSession session) {
	    log.info("Modify method called");
	    log.info("Board data received: " + board);

	    model.addAttribute("users_id", session.getAttribute("users_id"));

	    if (service.modify(board)) {
	        rttr.addFlashAttribute("result", "success");
	    }
	    return "board/list";
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
    public String myListBoards(HttpSession session, Model model, @RequestParam(defaultValue = "1") int page) {
    	int users_id = (int) session.getAttribute("users_id");
    	int pageSize = 10; // 페이지당 아이템 수
        int totalPages = (int) Math.ceil((double) service.countmyListBoards() / pageSize);
       
        List<BoardVO> boards = service.myListBoards(users_id, page, pageSize);
        log.info("mylist-");
        model.addAttribute("users_id", users_id);
        model.addAttribute("mylist", boards);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        return "board/mylist";
         
 	    }
}

