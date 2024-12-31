package com.shinhan.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shinhan.VO.OrdersDTO;


@Controller
public class OrderDetailController {
	@Autowired
	OrderService orderService;

	/*
    // 특정 주문 상세 페이지로 이동
    @GetMapping("/{orderId}") //{orderId}
    public String getOrderDetails(@PathVariable("orderId") int orderId, Model model) {
        OrdersDTO orderDetails = orderService.selectByIdService(orderId); // 주문 상세 데이터 가져오기
        model.addAttribute("orderDetails", orderDetails); // JSP로 데이터 전달
        return "orderDetails"; // orderDetails.jsp로 이동
    }
    */
	
	
	@GetMapping("/orderId")
	 public String getOrderDetails () {
		return "order/orderDetail";
	}
	
	
	
}
