package org.sara.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.sara.domain.UserVO;
import org.sara.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/*")
@Log4j
@AllArgsConstructor
public class UserController {
	
	@Autowired
	private UserService us;
	
	// 회원가입 구현 부분
	@GetMapping("/signup")
	public String signupPg(Model model) {
		log.info("Get == signup Mapping");
		model.addAttribute("user", new UserVO());
		return "sign/signup";
	}
	
	@PostMapping("/signup")
	public String signup(@ModelAttribute UserVO user, RedirectAttributes redirectA) {
		try {
			log.info(user);
			us.reg(user);
			return "redirect: /signin";
		} catch (Exception e) {
			redirectA.addFlashAttribute("error", "Registration failed");
			return "redirect: /signup";
		}
	}
	
	// 로그인 구현 부분
	@GetMapping("/signin")
	public String signinPg() {
		log.info("signin pg ====");
		return "sign/signin";
	}
	
	@PostMapping(value = "/signin")
	public String userSignin(HttpServletRequest req, @ModelAttribute UserVO uVo) throws Exception {
	    HttpSession session = req.getSession();
	    log.info("get session");
	    UserVO vo = us.login(uVo);
	    log.info("working?");

	    if (vo != null) {
	        session.setAttribute("getLoginInfo", 202);
	        session.setAttribute("uVo", vo);
	        log.info(vo);
	        // 로그인 성공 시 main 페이지로 리다이렉트
	        return "redirect:/";
	    } else {
	        session.setAttribute("fail", "Failed to get user info");
	        // 로그인 실패 시 다른 처리를 수행하거나, 로그인 페이지로 다시 이동하도록 설정
	        return "redirect:/signin";
	    }
	}
	
	@RequestMapping(value = "/logout", method = {RequestMethod.GET, RequestMethod.POST})
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}