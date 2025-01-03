package com.shinhan.order;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.shinhan.VO.OrdersDTO;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class OrderDetailController {
	@Autowired
	OrderService orderService;

	/*
    // 특정 주문 상세 페이지로 이동
    @GetMapping("/{orderId}") //@PathVariable 사용 -> restcontroller
    public String getOrderDetails(@PathVariable("orderId") int orderId, Model model) {
        OrdersDTO orderDetails = orderService.selectByIdService(orderId); // 주문 상세 데이터 가져오기
        model.addAttribute("orderDetails", orderDetails); // JSP로 데이터 전달
        return "orderDetails"; // orderDetails.jsp로 이동
    }
    */
	
	
	/* 주문상세내역 */
	@GetMapping("/orderitem")
	 public String getOrderDetails ( HttpServletRequest request, @RequestParam int orderId, Model model) {
		System.out.println("--------------------");
		System.out.println("orderId:" + orderId);
	   
		Integer member_id = (Integer)request.getAttribute("userId");
		String memberName = (String) request.getAttribute("Member_name");
		model.addAttribute("member_id", member_id);
		model.addAttribute("memberName", memberName);		
		List<Map<String, Object>> orderlist = orderService.selectByIdService(orderId);
		model.addAttribute("orderDetails", orderlist);
		return "order/orderDetail";
	}
		
	
	
}
