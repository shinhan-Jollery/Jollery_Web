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
    @Autowired
    AuthInfoUpdateService authInfoUpdateService;

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
    public MembersDTO getMemberPWByEmail(String member_email) {
    	return authMemberDAO.getMemberPWByEmail(member_email);
    }
    /**
     * UUID랑 password로 해당되는 ID 비밀번호 변경
     * @param memberpassword
     * @param uuid
     * @return
     */
    public Map<String, Object> changePassword(String memberpassword, String uuid) {
        // UUID를 검증하여 이메일과 인증 코드를 확인
        Map<String, Object> verificationResult = authMailService.verifyUUID(uuid);

        // 검증 결과에서 회원 정보 추출
        MembersDTO member = (MembersDTO) verificationResult.get("member");

        if (member != null) {
            // 비밀번호 변경
            member.setMember_password(memberpassword);
            authInfoUpdateService.updateMemberInfo(member);

            // 성공 응답 생성
            Map<String, Object> response = new HashMap<>();
            response.put("message", "새 비밀번호가 설정되었습니다.");
            response.put("status", "success");
            return response;
        } else {
            // 검증 실패 시 기존 결과 반환
            return verificationResult;
        }
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
    	Map<String, Object> response = new HashMap<>();
        if (member.getMember_name().equals(member_name)){
        	response=authMailService.verifyCode(member.getMember_email(), code);
        	response.put("message", "등록된 메일 주소로 초기화 링크를 발송했습니다!");
        	authMailService.sendPWChangeEmail(member.getMember_email());
        	return response;
        }
    	response.put("message", "아이디와 Email이 일치하지 않습니다.");
    	response.put("status", "error");
    	return response;
    }

}