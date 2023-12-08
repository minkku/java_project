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
	
	// 종료시 session expire
	@RequestMapping(value = "/logout", method = {RequestMethod.GET, RequestMethod.POST})
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}


//@PostMapping(value = "/signin")
//public String userSignin(HttpServletRequest req, @ModelAttribute UserVO uVo) throws Exception {
//    HttpSession session = req.getSession();
//    log.info("get session");
//    UserVO vo = us.login(uVo);
//    log.info("working?");
//
//    if (vo != null) {
//        // Check if the entered password matches the one stored in the database
//        if (uVo.getPassword().equals(vo.getPassword())) {
//            String loginCheckResult = us.loginCheck(email,pw);
//
//            session.setAttribute("getLoginInfo", 202);
//            session.setAttribute("uVo", vo);
//            log.info(vo);
//
//            if ("email".equals(loginCheckResult) || "pw".equals(loginCheckResult)) {
//                // Redirect to the main page only if both email and password are valid
//                return "redirect:/";
//            } else {
//                // Redirect to the login page in case of invalid email or password
//                session.setAttribute("fail", "Failed to get user info");
//                return "redirect:/signin";
//            }
//        }
//    } else {
//        // Redirect to the login page in case of invalid user
//        session.setAttribute("fail", "Invalid user");
//        return "redirect:/signin";
//    }
//    return "redirect:/";
//}