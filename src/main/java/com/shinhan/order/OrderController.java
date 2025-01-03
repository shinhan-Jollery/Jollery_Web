package com.shinhan.order;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private OrderListService orderListService;
	
	@GetMapping("/orderpage.do")
	public String tosspay() {
		return "order/orderpage";
	}
	

	@GetMapping("/list")
	public String orderList(HttpServletRequest request, Model model) {
		int userId = (int) request.getAttribute("userId");
        String memberName = (String) request.getAttribute("Member_name");
        model.addAttribute("userId", userId);
        model.addAttribute("memberName", memberName);

        List<Map<String, Object>> orderWithArts = orderListService.selectOrderList(userId);
        
        
        for (Map<String, Object> order : orderWithArts) {
            String[] artTitle = ((String) order.get("art_title")).split(",");
            String[] artStatus = ((String) order.get("art_status")).split(",");
            
            order.put("artTitleList", Arrays.asList(artTitle));
            order.put("artStatusList", Arrays.asList(artStatus));
        }
        
        model.addAttribute("orderWithArts", orderWithArts);
        
		return "order/orderlist";
	}
}
