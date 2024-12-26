package com.shinhan.account;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/auth")
public class AccountController {
	@GetMapping("/account")
	public String getAccount(HttpSession session, Model model) {
		return "account/account";
	}
}
