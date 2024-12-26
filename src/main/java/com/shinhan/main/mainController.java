package com.shinhan.main;

import org.springframework.stereotype.Controller;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class mainController {
	@GetMapping("main.do")
	public String mypage(HttpSession session) {
		String username= (String) session.getAttribute("loggedInUser");
		System.out.println(username);
		return "main/main";
	}
}
