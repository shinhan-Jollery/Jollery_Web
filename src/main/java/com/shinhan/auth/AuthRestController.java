package com.shinhan.auth;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shinhan.VO.MembersDTO;

@RestController
@RequestMapping("/auth")
public class AuthRestController {

    @Autowired
    private AuthService authService;

    @PostMapping(value = "/register", produces = "application/json;charset=UTF-8")
    public ResponseEntity<String> register(@RequestBody Map<String, Object> requestBody) {
        // JSON 데이터를 MembersDTO로 변환
    	System.out.println(requestBody);
    	MembersDTO member = MembersDTO.builder()
    		    .member_login_id((String) requestBody.get("username"))
    		    .member_password((String) requestBody.get("password"))
    		    .member_name((String) requestBody.get("name"))
    		    .member_email(requestBody.get("emailPrefix") + "@" + requestBody.get("emailDomain"))
    		    .member_phone((String) requestBody.get("phone"))
    		    .member_address((String) requestBody.get("address"))
    		    .build();

        // 생년월일 처리 (문자열 -> Date 변환)
        String birthDateStr = (String) requestBody.get("birth");
        if (birthDateStr != null) {
            try {
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date parsedDate = dateFormat.parse(birthDateStr);
                member.setMember_birth(new java.sql.Date(parsedDate.getTime()));
            } catch (ParseException e) {
                return ResponseEntity.badRequest().body("{\"status\":\"fail\", \"message\":\"Invalid birth date format\"}");
            }
        }

        // 회원 유형 처리 (artist 여부)
        Boolean isArtist = (Boolean) requestBody.get("isArtist");
        member.setMember_is_artist(isArtist != null && isArtist ? "Y" : "N");

        // 회원 추가 로직 실행
        boolean isSuccess = authService.addMember(member);

        // 결과 반환
        if (isSuccess) {
            return ResponseEntity.ok("{\"status\":\"success\"}");
        } else {
            return ResponseEntity.badRequest().body("{\"status\":\"fail\"}");
        }
    }
}
