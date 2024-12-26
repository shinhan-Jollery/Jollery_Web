package com.shinhan.order;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.VO.OrdersDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository("orderMybatis")
public class OrderDAOMybatis implements OrderDAOInterface {

	@Autowired
	SqlSession sqlSession;
	
	String namespace = "com.shinhan.order.";
	
	public OrdersDTO selectById(int order_id) {
		OrdersDTO order = sqlSession.selectOne(namespace + "selectById", order_id);
		System.out.println("--------------------------------");
		log.info("mybatisÀÌ¿ë:" + order);
		return order;
	}

}
