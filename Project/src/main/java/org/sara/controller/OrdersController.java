package org.sara.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.sara.domain.CartsListVO;
import org.sara.service.OrdersService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
        session.setAttribute("users_id", users_id);
        log.info(service.ranOrdersNum());
		return "orders/payment";
	}
	
	@PostMapping("/payment")
	public String postPayment(@RequestParam("new_name") String new_name, @RequestParam("user_name") String user_name,
							  @RequestParam("new_adress") String new_adress, @RequestParam("user_adress") String user_adress,
							  @RequestParam("new_mobile") String new_mobile, @RequestParam("user_mobile") String user_mobile,
							  @RequestParam("comment") String comment, @RequestParam("books_id") List<Integer> books_id,
							  @RequestParam("quantity") List<Integer> quantity, @RequestParam("user_info") String user_info,
							  @RequestParam("carts_id") List<Integer> carts_id, HttpSession session, Model model) {
		int users_id = (int) session.getAttribute("users_id");
		String OrdersNum = service.ranOrdersNum();
		session.setAttribute("orders_num", OrdersNum);
		if (user_info.equals("new_data")) {
			service.insertOrders(users_id, new_name, new_adress, new_mobile, comment, OrdersNum, 1);
		} else {
			service.insertOrders(users_id, user_name, user_adress, user_mobile, comment, OrdersNum, 1);
		}
		service.insertOrdersDetail(OrdersNum, books_id, quantity);
		service.deleteCarts(users_id, carts_id);
		
		return "redirect:/orders/complete?users_id=" + users_id;
	}
	
	@GetMapping("/complete")
	public String getComplete(@RequestParam("users_id") int users_id, Model model, HttpSession session) {
		log.info("get - orders/complete-------------------------------");
//		int users_id = (int) session.getAttribute("users_id");
		String orders_num = (String) session.getAttribute("orders_num");
		model.addAttribute("orders_num", orders_num);
		model.addAttribute("users", service.getUsersInfo(users_id));
		model.addAttribute("orders", service.getOrdersInfo(users_id, orders_num));
		model.addAttribute("buyBook", service.getBuyBook(orders_num));
		if (service.getBuyBooksCount(orders_num) > 1) {
			model.addAttribute("buyBookCount", service.getBuyBooksCount(orders_num) - 1);
		} else {
			model.addAttribute("buyBookCount", service.getBuyBooksCount(orders_num));
		}
		return "orders/complete";
	}
	
	@GetMapping("/listInfo")
	public String getListInfo(@RequestParam("users_id") int users_id, Model model, HttpSession session) {
		log.info("get - orders/cancel-------------------------------");
		String orders_num = (String) session.getAttribute("orders_num");
//		int users_id = (int) session.getAttribute("users_id");
		model.addAttribute("orders_num", orders_num);
		model.addAttribute("users", service.getUsersInfo(users_id));
		model.addAttribute("orders", service.getOrdersInfo(users_id, orders_num));
		model.addAttribute("buyBook", service.getBuyBook(orders_num));
		if (service.getBuyBooksCount(orders_num) > 1) {
			model.addAttribute("buyBookCount", service.getBuyBooksCount(orders_num) - 1);
		} else {
			model.addAttribute("buyBookCount", service.getBuyBooksCount(orders_num));
		}
		return "orders/listInfo";
	}
	
	@PostMapping("/listInfo")
	public String postListInfo(@RequestParam("users_id") int users_id, Model model, HttpSession session) {
		
		return "redirect:/orders/complete?users_id=" + users_id;
	}
	
	@GetMapping("/list")
	public String getList(@RequestParam("users_id") int users_id, Model model, HttpSession session) {
		log.info("get - orders/list-------------------------------");
//		int users_id = (int) session.getAttribute("users_id");
		model.addAttribute("ordersList", service.getOrderList(users_id));
		return "orders/list";
	}
}
