package org.sara.controller;

import org.sara.service.CartsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/carts")
@AllArgsConstructor
public class CartsController {
	private CartsService service;
	
	@GetMapping("/")
	public void carts(@RequestParam("users_id") int users_id, Model model) {
		log.info("cart");
		model.addAttribute("carts", service.getCartsList(1));
	}
}
