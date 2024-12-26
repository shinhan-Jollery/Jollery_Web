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


    public MembersDTO loginMember(String userid, String userpw) {
        //db가자
    	 MembersDTO user = authSignUpDAO.selectMemberById(userid);
        if (user != null && user.getMember_password() != null && user.getMember_password().equals(userpw)) {
            return user; // 인증 성공
        }
        else {
        user.setMember_name(null);
        //정말 잘못된 접근 그냥 Map에 태우는게 훨씬 나았을듯
        if (user.getMember_password() == null && user.getMember_is_artist()!=null) {
        	return user;
        }
        MembersDTO user1 = new MembersDTO();
        user1.setMember_is_artist("비밀번호가 올바르지 않습니다");
        return user1; // 인증실패
        }
    }
    

}