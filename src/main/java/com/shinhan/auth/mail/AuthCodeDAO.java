package com.shinhan.auth.mail;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shinhan.VO.AuthCodeDTO;
@Repository
public class AuthCodeDAO {
    @Autowired
    private SqlSession sqlSession;

    
    public int insertAuthCode(AuthCodeDTO authCode) {
        return sqlSession.insert("com.shinhan.authcode.insertAuth_code", authCode);
    }
    public AuthCodeDTO selectByAuth_Method(String method) {
        try {
            // db 가자
        	AuthCodeDTO authCode = sqlSession.selectOne("com.shinhan.authcode.selectByAuth_Method", method);
            return authCode;
        } catch (Exception e) {
            System.err.println("사용자 조회 중 오류 발생: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
}
