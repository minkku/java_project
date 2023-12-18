package org.sara.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.sara.domain.CartsListVO;
import org.sara.domain.UserVO;
import org.sara.service.CartsService;
import org.sara.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/*")
@AllArgsConstructor
public class CartsController {
	private CartsService service;
	private UserService userService;
	
	@GetMapping("/carts")
	public String getCarts(Model model, HttpSession session) {
		log.info("get - carts-------------------------------");
		int users_id = (int) session.getAttribute("users_id");
		log.info("users_id /carts controller---------------" + users_id);
		model.addAttribute("carts", service.getCartsList(users_id));
		return "orders/carts";
	}
	
	@PostMapping("/carts")
	public String postCarts(@RequestParam(name = "action") String action,
                            @RequestParam(name = "carts_id", required = false) List<Integer> carts_id,
                        Model model, HttpSession session) {
		log.info("post - carts---------------------------------");
		
		int users_id = (int) session.getAttribute("users_id");
		log.info("controller(POST)------------------------users_id---------> " + users_id);
		
		try {
			for (Integer id : carts_id) {
				log.info("carts_id---------------" + id);
			}
		} catch (Exception e) {
			log.info("controller error------------------->" + e.getMessage());
		}
		
	    if ("장바구니에서 제거".equals(action)) {
	    	service.deleteCarts(users_id, carts_id);
	    } else if ("구매하기".equals(action)) {
	    	session.setAttribute("selectCarts", service.getSelectCartsList(users_id, carts_id));
	    	try {
	    		log.info(session.getAttribute("selectCarts-----�����ϱ�"));
	    	} catch (Exception e) {
	    		log.info("selectCarts�� session�� ������ ����" + e.getMessage());
	    	}
	    	return "redirect:/orders/payment";
	    }
	    
	    return "redirect:/carts";
	}
	
	@ResponseBody
	@PostMapping(value = "/updateQuantity", produces = "application/json; charset=utf-8")
	public ResponseEntity<Map<String, Object>> updateQuantity(@RequestParam("users_id") int users_id,
	                                                          @RequestParam("carts_id") int carts_id,
	                                                          @RequestParam("books_id") int books_id,
	                                                          @RequestParam("quantity") int quantity,
	                                                          HttpSession session, Model model) {
	    try {
	        service.updateCarts(users_id, carts_id, books_id, quantity);

	        List<CartsListVO> updatedCarts = service.getCartsList(users_id);
	        model.addAttribute("carts", updatedCarts);

	        Map<String, Object> result = new HashMap<>();
	        result.put("result", "success");
	        result.put("prices", updatedCarts.stream().map(CartsListVO::getPrice).collect(Collectors.toList()));

	        return new ResponseEntity<>(result, HttpStatus.OK);
	    } catch (Exception e) {
	        Map<String, Object> result = new HashMap<>();
	        result.put("result", "error");
	        result.put("message", e.getMessage());

	        return new ResponseEntity<>(result, HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}
}
