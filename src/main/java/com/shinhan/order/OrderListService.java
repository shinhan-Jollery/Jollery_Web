package com.shinhan.order;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderListService {
	@Autowired
	private OrderListDAO orderListDAO;
	
	public List<Map<String, Object>> selectOrderList(int memberId){
		return orderListDAO.selectOrderList(memberId);
	}

}
