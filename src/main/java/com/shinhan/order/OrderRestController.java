package com.shinhan.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shinhan.VO.OrdersDTO;

//Spring4���� : @RestController => @Controller + @ResponseBody
@RestController
@RequestMapping("/rest")
public class OrderRestController {

	@Autowired
	OrderService orderService;
	
	
	//��� �ֹ����� ��ȸ
	
	//Ư�� �ֹ� �󼼳��� ��ȸ
	@GetMapping(value = "/order.do/{orderId}", produces = "application/json")
	public OrdersDTO f3(@PathVariable("orderId") int order_id) {
		return orderService.selectByIdService(order_id);
	}
}