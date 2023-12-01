package org.sara.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.sara.domain.CartsListVO;
import org.sara.service.OrdersService;
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
@RequestMapping("/orders")
@AllArgsConstructor
public class OrdersController {
	private OrdersService service;
	
	@GetMapping("/payment")
	public String getPayment(@RequestParam("users_id") int users_id, Model model, HttpSession session) {
		log.info("get - orders/payment-------------------------------");
        model.addAttribute("selectCarts", session.getAttribute("selectCarts"));
        model.addAttribute("users", service.getUsersInfo(users_id));
		return "payment";
	}
	
	@PostMapping("/payment")
	public String postPayment(HttpSession session, Model model) {
		
		return "";
	}
}
