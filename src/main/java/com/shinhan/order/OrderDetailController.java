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
    // Ư�� �ֹ� �� �������� �̵�
    @GetMapping("/{orderId}") //{orderId}
    public String getOrderDetails(@PathVariable("orderId") int orderId, Model model) {
        OrdersDTO orderDetails = orderService.selectByIdService(orderId); // �ֹ� �� ������ ��������
        model.addAttribute("orderDetails", orderDetails); // JSP�� ������ ����
        return "orderDetails"; // orderDetails.jsp�� �̵�
    }
    */
	
	
	@GetMapping("/orderId")
	 public String getOrderDetails () {
		return "order/orderDetail";
	}
	
	
	
}
