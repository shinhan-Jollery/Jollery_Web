package com.shinhan.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.VO.ArtsDTO;

@Repository
public class CartMyBatisDAO {

	@Autowired
	SqlSession sqlSession;
	
	/*
	 * public List<ArtsDTO> selectAll (int member_id) { return
	 * sqlSession.selectList("com.shinhan.cart.selectAll", member_id);
	 * 
	 * }
	 */

	public int delete(int member_id, int art_id) {
		Map<String, Object> params = new HashMap<>();
		params.put("member_id", member_id);
		params.put("art_id", art_id);
		
		return sqlSession.delete("com.shinhan.cart.delete", params);
	
	}

	public List<Map<String, Object>> selectCategory(Integer member_id) {
		return sqlSession.selectList("com.shinhan.cart.selectCategory", member_id);
	}
	
	
	
	
	
}
