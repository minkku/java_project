package org.sara.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.sara.service.CartsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/*")
@AllArgsConstructor
public class CartsController {
	private CartsService service;
	
	@GetMapping("/carts")
	public String carts(@RequestParam("users_id") int users_id, Model model, HttpSession session) {
		log.info("get - carts");
		session.setAttribute("users_id", users_id);
		model.addAttribute("carts", service.getCartsList(users_id));
		
		return "carts";
	}
	
	@PostMapping("/carts")
	public String carts(@RequestParam(name = "action") String action,
                        @RequestParam(name = "carts_id", required = false) List<Integer> carts_id,
                        Model model, HttpSession session) {
		log.info("post - carts");
		int users_id = (int) session.getAttribute("users_id");
		log.info("users_id의 값 => " + users_id);
	    if ("장바구니에서 제거".equals(action)) {
	    	service.deleteCarts(users_id, carts_id);
	    } else if ("구매하기".equals(action)) {
	    	
	    }
	    return "redirect:/carts?users_id=" + users_id;
	}
}
