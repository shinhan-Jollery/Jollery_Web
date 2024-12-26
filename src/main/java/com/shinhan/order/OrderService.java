package com.shinhan.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.VO.OrdersDTO;

@Service
public class OrderService {

	@Autowired
	OrderDAOMybatis orderDAO;
	
	public OrdersDTO selectByIdService(int order_id) {
		// TODO Auto-generated method stub
		return orderDAO.selectById(order_id);
	}

}
