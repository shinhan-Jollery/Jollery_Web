package com.shinhan.pay;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pcpay")
public class PayController {
	
	@GetMapping("/tosspay.do")
	public String tosspay() {
		System.out.println(1);
		return "pay/tosspay";
	}

}
