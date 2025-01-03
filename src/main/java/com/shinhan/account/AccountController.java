package com.shinhan.account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/auth")
public class AccountController {
	
	
	
	@GetMapping("/account")
	public String getAccount(HttpServletRequest request, Model model) {
		
		int userId = (int) request.getAttribute("userId");
        String memberName = (String) request.getAttribute("Member_name");
        model.addAttribute("userId", userId);
        model.addAttribute("memberName", memberName);
		return "account/account";
	}
	
}
