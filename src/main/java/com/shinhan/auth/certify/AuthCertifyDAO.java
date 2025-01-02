package com.shinhan.auth.certify;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.VO.MembersDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class AuthCertifyDAO {

	@Autowired
	SqlSession sqlSession;

	String namespace = "com.shinhan.auth.";

	public int update(MembersDTO member) {
		int result = sqlSession.update(namespace + "update", member);
		log.info(result + "°Ç ÀÔ·ÂµÊ");
		return result;
	}

}
