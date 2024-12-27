package com.shinhan.auth;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shinhan.VO.MembersDTO;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@RestController
@RequestMapping("/auth")
public class AuthRestController {

	 @Autowired
	    private AuthService authService;

	    // JWT 비밀키
	    private static final String SECRET_KEY = "nahyunjungyeonmomosanajihyomimidahyuncheyoungtwuyu";

	    @PostMapping(value = "/login", produces = "application/json;charset=UTF-8")
	    public ResponseEntity<String> login(@RequestBody Map<String, Object> requestBody, HttpServletResponse response) {
	        String username = (String) requestBody.get("username");
	        String password = (String) requestBody.get("password");

	        // 로그인
	        MembersDTO user = authService.loginMember(username, password);

	        if (user.getMember_name() != null) {
	            // JWT 생성
	            String token = Jwts.builder()
	                    .setSubject(user.getMember_name()) 
	                    .claim("userId", user.getMember_id())
	                    .claim("isArtist", user.getMember_is_artist())
	                    .claim("Member_name", user.getMember_name()) 
	                    .setIssuedAt(new Date()) // 발급 시간
	                    .setExpiration(new Date(System.currentTimeMillis() + 1000 *3600)) 
	                    .signWith(SignatureAlgorithm.HS256, SECRET_KEY) 
	                    .compact();

	            // JWT를 쿠키에 저장
	            javax.servlet.http.Cookie jwtCookie = new javax.servlet.http.Cookie("jwtToken", token);
	            jwtCookie.setPath("/");
	            jwtCookie.setMaxAge(3600); 
	            response.addCookie(jwtCookie);

	            // 서블릿 구버전 이슈 
	            String cookieHeader = String.format("%s=%s; Path=%s; Max-Age=%d; HttpOnly",
	                    jwtCookie.getName(), jwtCookie.getValue(), jwtCookie.getPath(), jwtCookie.getMaxAge());
	            response.addHeader("Set-Cookie", cookieHeader);

	            return ResponseEntity.ok("{\"status\":\"success\", \"message\":\"로그인 성공\"}");
	        } else {
	            // 인증 실패
	            return ResponseEntity.badRequest().body("{\"status\":\"fail\", \"message\":\"" + user.getMember_is_artist() + "\"}");
	        }
	    }
	
    

    @PostMapping(value = "/register", produces = "application/json;charset=UTF-8")
    public ResponseEntity<String> register(@RequestBody Map<String, Object> requestBody) {
        // JSON DTO로 변환
    	System.out.println(requestBody);
    	MembersDTO member = MembersDTO.builder()
    		    .member_login_id((String) requestBody.get("username"))
    		    .member_password((String) requestBody.get("password"))
    		    .member_name((String) requestBody.get("name"))
    		    .member_email(requestBody.get("emailPrefix") + "@" + requestBody.get("emailDomain"))
    		    .member_phone((String) requestBody.get("phone"))
    		    .member_address((String) requestBody.get("address"))
    		    .build();

        // 생년월일 처리  front에 없음
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

        // 판매자 여부 조회인데 여기서 필요 없기때문에 null 방지용
        Boolean isArtist = (Boolean) requestBody.get("isArtist");
        member.setMember_is_artist(isArtist != null && isArtist ? "1" : "0");

        //db에 전달 제약조건은 전부 front에서 처리
        boolean isSuccess = authService.addMember(member);

        // 실행결과 반환
        if (isSuccess) {
            return ResponseEntity.ok("{\"status\":\"success\"}");
        } else {
            return ResponseEntity.badRequest().body("{\"status\":\"fail\"}");
        }
    }
}
