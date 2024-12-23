package com.shinhan.test;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.VO.ExhibitionsDTO;

@Repository
public class ExhibitionDao {
	
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "com.shinhan.test.";

    public void insertExhibition(ExhibitionsDTO exhibition) {
    	sqlSession.insert(namespace + "insertExhibition", exhibition);
    }
    
    public void sellectAllExhibition() {
    	sqlSession.selectList(namespace + "selectAllExhibition");
	}

}

