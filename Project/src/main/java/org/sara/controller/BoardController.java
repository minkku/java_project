package org.sara.controller;

import java.util.List;

import org.sara.domain.BoardVO;
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
	 * @GetMapping("/login") public String login() { return "login"; } }
	 */

	@GetMapping("/list")
	public String getAllBoards(Model model, @RequestParam(defaultValue = "1") int page) {
		int pageSize = 10; // 페이지당 아이템 수
		List<BoardVO> boards = service.getAllBoards(page, pageSize);
		int totalPages = (int) Math.ceil((double) service.countBoards() / pageSize);
		log.info("www----");
		model.addAttribute("list", boards);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "board/list";
	}

	@GetMapping("/register")
	public void register() {
		log.info("registerffffffff");
	}

	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("register : " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getBoard_id());
		return "redirect:/board/list";
	}

	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("board_id") int board_id, Model model) {
		log.info("/get or modify");
		model.addAttribute("board", service.get(board_id));
	}

	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr) {
		log.info("modify:" + board);

		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("board_id") int board_id, RedirectAttributes rttr) {
		log.info("remove...." + board_id);
		if (service.remove(board_id)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}
}
