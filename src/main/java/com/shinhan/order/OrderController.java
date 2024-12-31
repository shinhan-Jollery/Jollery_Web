package com.shinhan.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shinhan.VO.OrdersDTO;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@GetMapping("/orderpage.do")
	public String tosspay() {
		return "order/orderpage";
	}
	
	
}
