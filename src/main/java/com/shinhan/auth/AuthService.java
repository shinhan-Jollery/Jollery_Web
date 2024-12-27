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
        return result > 0; 
    }


    public MembersDTO loginMember(String userid, String userpw) {
       
    	 MembersDTO user = authSignUpDAO.selectMemberById(userid);
        if (user != null && user.getMember_password() != null && user.getMember_password().equals(userpw)) {
            return user; 
        }
        else {
        user.setMember_name(null);
       if (user.getMember_password() == null && user.getMember_is_artist()!=null) {
        	return user;
        }
        MembersDTO user1 = new MembersDTO();
        user1.setMember_is_artist("비밀번호가 올바르지 않습니다.");
        return user1; 
        }
    }
    

}