package com.shinhan.order;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderListDAO {
	@Autowired
	private SqlSession sqlSession;
	
	
	public List<Map<String, Object>> selectOrderList(int memberId){
		return sqlSession.selectList("com.shinhan.order.selectOrderList", memberId);
	}

}
