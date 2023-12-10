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
import org.springframework.web.bind.annotation.RequestParam;
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
	
	// sign up part
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
	
	// sign in part
	@GetMapping("/signin")
	public String signinPg() {
		log.info("signin pg ====");
		return "sign/signin";
	}
	
	@PostMapping(value = "/signin")
	public String loginWithSession(HttpServletRequest request, @RequestParam("email") String email, @RequestParam("pw") String pw, HttpSession session) throws Exception {
	    UserVO uVo = new UserVO();
	    uVo.setEmail(email);
	    uVo.setPw(pw);
	    int result = us.loginck(email, pw);
	    UserVO signinUser = us.login(uVo);
	    
	    log.info(uVo.getEmail());
	    log.info(uVo.getPw());
	    
	    session.setAttribute("result", result);
	    
	    if (us.loginck(email, pw) == 0) return "redirect:/signin";
	    
	    session.setAttribute("signin", signinUser);
	    
	    return "redirect:/";
	}
	
	//session expire
	@RequestMapping(value = "/logout", method = {RequestMethod.GET, RequestMethod.POST})
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//update user page
	@GetMapping("/updateUser")
	public String getUpdateUser(Model model, HttpSession session) {
		UserVO loginedUser = (UserVO) session.getAttribute("signin");
		if(loginedUser != null) {
			model.addAttribute("user", loginedUser);
			return "sign/updateUser";
		} else {
			return "redirect:/signin";
		}
	}
	
	@PostMapping("/updateUser")
	public String userUpdate(@RequestParam("pw") String pw, 
							@RequestParam("address") String address, 
							@RequestParam("mobile") String mobile,
							HttpSession session,
							Model model) {
		UserVO loginedUser = (UserVO) session.getAttribute("signin");
		
		if(loginedUser != null) {
			try {
				// include update info
				UserVO updatedUser = new UserVO();
				updatedUser.setEmail(loginedUser.getEmail());
				updatedUser.setPw(pw);
				updatedUser.setAddress(address);
				updatedUser.setMobile(mobile);
				
				// update user info through userService
				us.updateUser(updatedUser);
				
				// update logined user current session 
				session.setAttribute("signin", updatedUser);
				
				model.addAttribute("updateSuccess", true);
			} catch (Exception e) {
				model.addAttribute("udateSuccess", false);
			}
		}
		return "redirect:/";
	}
}