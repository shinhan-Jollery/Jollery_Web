package com.shinhan.pay;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pcpay")
public class PayController {
	
	@GetMapping("/tosspay.do")
	public String tosspay() {
		return "pay/tosspay";
	}
////	@GetMapping("/success")
////	public String successToss() {
////		
//		System.out.println(2);
//		return "pay/success";
//	}
}
