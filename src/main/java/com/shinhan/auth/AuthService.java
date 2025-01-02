package com.shinhan.auth;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.VO.MembersDTO;
import com.shinhan.auth.mail.AuthMailService;


@Service
public class AuthService {
	
	@Autowired
	AuthSignUpDAO authSignUpDAO;
    @Autowired
    AuthMemberDAO authMemberDAO; 
    @Autowired
    AuthMailService authMailService;

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
    
    public MembersDTO getMemberInfo(String member_login_ID) {
    	
    	
        return authMemberDAO.getMemberByLoginId(member_login_ID);
    }
    /**
     * login_ID랑 이름받고 검증 후 인증 mail 발송
     * @param member_login_ID
     * @param member_name
     * @return json
     */
    public Map<String, Object> emailCheckerByLoginId_name(String member_login_ID, String member_name){
    	MembersDTO member = getMemberInfo(member_login_ID);
        if (member.getMember_name().equals(member_name)){
        	return authMailService.sendEmail(member.getMember_email());
        }
    	Map<String, Object> response = new HashMap<>();
    	response.put("message", "아이디와 Email이 일치하지 않습니다.");
    	response.put("status", "error");
    	return response;
    }
    
    /**
     * login_ID랑 이름받고 검증 후 코드 검증
     * @param member_login_ID
     * @param member_name
     * @param code
     * @return json
     */
    public Map<String, Object> verifyByLoginId_name(String member_login_ID, String member_name,String code){
    	MembersDTO member = getMemberInfo(member_login_ID);
        if (member.getMember_name().equals(member_name)){
        	return authMailService.verifyCode(member.getMember_email(), code);
        }
    	Map<String, Object> response = new HashMap<>();
    	response.put("message", "아이디와 Email이 일치하지 않습니다.");
    	response.put("status", "error");
    	return response;
    }

}