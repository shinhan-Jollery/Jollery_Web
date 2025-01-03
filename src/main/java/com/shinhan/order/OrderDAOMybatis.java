package com.shinhan.order;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository 
public class OrderDAOMybatis implements OrderDAOInterface {

	@Autowired
	SqlSession sqlSession;
	
	String namespaceOrder = "com.shinhan.order.";
	String namespaceOrderItem = "com.shinhan.orderItem.";
	
	public List<Map<String, Object>> selectById(int order_id) {
		List<Map<String, Object>> orderItem = sqlSession.selectList(namespaceOrderItem + "selectByOrderId", order_id);
		System.out.println("--------------------------------");
		System.out.println("mybatisÀÌ¿ë:" + orderItem);
		return orderItem;
	}

}
