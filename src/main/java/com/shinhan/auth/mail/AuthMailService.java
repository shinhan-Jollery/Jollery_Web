package com.shinhan.auth.mail;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.VO.AuthCodeDTO;
import com.shinhan.VO.MembersDTO;
import com.shinhan.auth.AuthService;


@Service
public class AuthMailService {
	@Autowired
	AuthCodeService authCodeService;
	@Autowired
	AuthService authService;
	/**
	 * 이메일 인증 코드를 만들어서 메일로 전송
	 * @param email
	 * @return 메세지와 성공 여부
	 */
	public Map<String, Object> sendEmail(String email) {
		Map<String, Object> response = new HashMap<>();
		AuthCodeDTO authcode = new AuthCodeDTO();
		try {
			// 인증 코드 생성
			String verificationCode = VerificationService.generateVerificationCode(email);
			// 만료 시간 설정
			LocalDateTime now = LocalDateTime.now();
			authcode.setAuth_expired(now.plusMinutes(15));
			authcode.setAuth_code(verificationCode);
			authcode.setAuth_method(email);
			// 이메일 발송
			MailDispatcher.sendMail(
				    email,
				    "Jollery 이메일 인증",
				    "<html>" +
				        "<body>" +
				            "<p>안녕하세요 jollery입니다,</p>" +
				            "<p>아래 인증 코드를 입력하여 이메일 인증을 완료하세요:</p>" +
				            "<h2 style=\"color: #2E86C1;\">" + verificationCode + "</h2>" +
				            "<p>감사합니다.</p>" +
				        "</body>" +
				    "</html>"
				);
			authCodeService.insertAuthCode(authcode);
		} catch (MessagingException e) {
			e.printStackTrace();

		}
		response.put("message", "인증 코드를 발송했습니다.");
		response.put("status", "success");
		System.out.println("sendEmail"+response);
		return response;
	}
	/**
	 * 로그인 ID를 회원에게 메일로 전송
	 * @param email
	 * @return 메세지와 성공 여부
	 */
	public Map<String, Object> sendEmailwithloginID(String email,MembersDTO member) {
		Map<String, Object> response = new HashMap<>();
		try {
			String login_ID = member.getMember_login_id();
			MailDispatcher.sendMail(
				    email,
				    "Jollery 이메일 인증",
				    "<html>" +
				        "<body>" +
				            "<p>안녕하세요 jollery입니다,</p>" +
				            "<p>회원 님의 ID는 다음과 같습니다 : "+login_ID+" 항상 이용해 주셔서 감사합니다.</p>" +
				            "<p>감사합니다.</p>" +
				        "</body>" +
				    "</html>"
				);
		} catch (MessagingException e) {
			e.printStackTrace();

		}
		response.put("message", "메일로 ID를 발송했습니다.");
		response.put("status", "success");
		System.out.println("sendEmail"+response);
		return response;
	}
	/**
	 * 비밀번호 초기화 링크를 만들어서 메일로 전송
	 * @param email
	 * @return 메세지와 성공 여부
	 */
	public Map<String, Object> sendPWChangeEmail(String email) {
		Map<String, Object> response = new HashMap<>();
		AuthCodeDTO authcode = new AuthCodeDTO();
		try {
			// 인증 코드 생성
			UUID randomUUID = UUID.randomUUID();
			LocalDateTime now = LocalDateTime.now();
			authcode.setAuth_expired(now.plusMinutes(15));
			authcode.setAuth_code(email);
			authcode.setAuth_method(randomUUID.toString());
		    String resetLink = "http://192.168.0.120:9090/jollery/auth/resetpassword?uuid=" + randomUUID.toString();
			//하이퍼링크 넣기
	        String emailContent = "<p>안녕하세요 jollery입니다,</p>"
	                + "<p>비밀번호를 초기화하려면 아래 링크를 클릭하세요:</p>"
	                + "<a href=\"" + resetLink + "\">비밀번호 초기화 링크</a>";
		    // 이메일 발송
			MailDispatcher.sendMail(email, "Jollery 패스워드 초기화 링크",emailContent);
			authCodeService.insertAuthCode(authcode);
		} catch (MessagingException e) {
			e.printStackTrace();

		}
		response.put("message", "인증 코드를 발송했습니다.");
		response.put("status", "success");
		System.out.println("sendEmail"+response);
		return response;
	}
	/**
	 * UUID를 받아서 해체하고 email 찾아주기
	 * @param uuid
	 * @return map안에 email
	 */
	public Map<String, Object> verifyUUID(String uuid) {
		Map<String, Object> response = new HashMap<>();
		//틀리면 response 맞으면 email 넣고 리턴
		AuthCodeDTO authcode = authCodeService.selectByAuth_Method(uuid);
		if (authcode!=null) {
			MembersDTO member = authService.getMemberPWByEmail(authcode.getAuth_code());
			response.put("member", member);

		} else {
			response.put("message", "유효하지 않은 링크입니다.");
			response.put("status", "error");
		}
		
		return response;
	}
	/**
	 * 인증코드 받아서 DB와 비교해서 유효한지 확인
	 * @param email
	 * @param code
	 * @return
	 */
	public Map<String, Object> verifyCode(String email, String code) {
		Map<String, Object> response = new HashMap<>();
		AuthCodeDTO authcode = authCodeService.selectByAuth_Method(email);
		System.out.println(authcode);
		if (VerificationService.verifyCode(authcode, code)) {
			response.put("message", "인증 성공!");
			response.put("status", "success");
			
		} else {
			response.put("message", "인증 코드가 유효하지 않습니다.");
			response.put("status", "error");
		}
		return response;
	}
	/**
	 * email이랑 코드 이름 받으면 각각 확인해서 login id 보내주기
	 * @param memberName
	 * @param email
	 * @param code
	 * @return 각각 status
	 */
	public Map<String, Object> verifyAndSendId(String memberName, String email, String code) {
        Map<String, Object> response = new HashMap<>();

        //  이메일과 인증 코드 검증
        Map<String, Object> verificationResult = verifyCode(email, code);
        if (!verificationResult.get("status").equals("success")) {
            response.put("message", "인증번호가 일치하지 않습니다.");
            response.put("status", "error");
            return response;
        }

        //이메일로 회원 정보 조회
        MembersDTO member = authService.getMemberPWByEmail(email);
        if (member == null) {
            response.put("message", "해당 이메일로 등록된 회원이 없습니다.");
            response.put("status", "error");
            return response;
        }

        //이름 검증
        if (!member.getMember_name().equals(memberName)) {
            response.put("message", "이메일과 이름이 일치하지 않습니다.");
            response.put("status", "error");
            return response;
        }

        // 이메일로 ID 전송
        sendEmailwithloginID(email, member);
        response.put("message", "아이디가 이메일로 전송되었습니다.");
        response.put("status", "success");
        return response;
    }
}