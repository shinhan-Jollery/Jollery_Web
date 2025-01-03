package com.shinhan.sale;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.VO.ArtsDTO;

@Repository
public class SaleListDAO {
	@Autowired
	SqlSession sqlSession;
	
	public List<ArtsDTO> selectArtsByStatus(Integer memberId, String status) {
        Map<String, Object> params = new HashMap<>();
        params.put("memberId", memberId);
        params.put("status", status);

        return sqlSession.selectList("com.shinhan.sale.selectArtsByStatus", params);
    }
}
