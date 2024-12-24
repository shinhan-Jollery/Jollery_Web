package com.shinhan.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.VO.MembersDTO;


@Service
public class AuthService {

    @Autowired
    AuthSignUpDAO authSignUpDAO; 

    public boolean addMember(MembersDTO member) {
        int result = authSignUpDAO.insertMember(member); 
        return result > 0; // 성공 여부 반환
    }
}