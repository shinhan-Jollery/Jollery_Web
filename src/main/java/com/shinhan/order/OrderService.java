package com.shinhan.order;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService {

	@Autowired
	OrderDAOMybatis orderDAO;
	
	public List<Map<String, Object>> selectByIdService(int order_id) {
		// TODO Auto-generated method stub
		return orderDAO.selectById(order_id);
	}

}
