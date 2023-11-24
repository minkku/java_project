/*
 * package org.sara.controller;
 * 
 * import org.sara.domain.UserVO; import org.sara.service.UserService; import
 * org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestMethod; import
 * org.springframework.web.bind.annotation.RequestParam;
 * 
 * import lombok.AllArgsConstructor; import lombok.extern.log4j.Log4j;
 * 
 * @Controller
 * 
 * @Log4j
 * 
 * @AllArgsConstructor
 * 
 * @RequestMapping("/login/*") public class LoginController {
 * 
 * @Autowired private UserService service;
 * 
 * @RequestMapping(value="/login", method = {RequestMethod.GET}) public String
 * getuser(@RequestParam("users_id") UserVO uVo,Model model) {
 * log.info("postlogin"); model.addAttribute("user",service.loginCheck(uVo));
 * return "book/main"; } }
 */