package com.shinhan.account;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shinhan.VO.AccountsDTO;
import com.shinhan.VO.MembersDTO;
import com.shinhan.auth.AuthInfoUpdateService;

@RestController
@RequestMapping("/auth/account")
public class AccountRestController {

    @Autowired
    private AccountService accountService;
    
    @Autowired
    private AuthInfoUpdateService authService;

    @GetMapping("/data")
    public ResponseEntity<?> getAccountData(HttpServletRequest request) {
        Integer memberId = (Integer) request.getAttribute("userId");

        if (memberId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(Map.of("success", false, "message", "로그인이 필요합니다."));
        }
        
        try {
        	AccountsDTO account = accountService.findByMemberId(memberId);
            if (account != null) {
                return ResponseEntity.ok(Map.of("success", true, "account", account));
            } else {
            	
                return ResponseEntity.ok(Map.of("success", true)); // 계좌 정보 없을 경우 null 반환
            }
        } catch (Exception e) {
            // 예외 발생 시 로그 출력
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(Map.of("success", false, "message", "서버 오류가 발생했습니다."));
        }
    }
    
    @PostMapping("/register")
    public ResponseEntity<?> registerAccount(@RequestBody AccountsDTO account, HttpServletRequest request){
    	Integer memberId = (Integer) request.getAttribute("userId");

        if (memberId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(Map.of("success", false, "message", "로그인이 필요합니다."));
        }

        account.setMember_id(memberId); // 세션에서 가져온 member_id 설정

        try {
            int result = accountService.insertAccount(account);
            if (result > 0) {
                return ResponseEntity.ok(Map.of("success", true, "message", "계좌 등록 성공"));
            } else {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                        .body(Map.of("success", false, "message", "계좌 등록에 실패했습니다."));
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(Map.of("success", false, "message", "서버 오류가 발생했습니다."));
        }
    }
    
    @PutMapping("/update")
    public ResponseEntity<?> updateAccount(@RequestBody AccountsDTO account, HttpServletRequest request){
    	Integer memberId = (Integer)request.getAttribute("userId");
    	
    	if(memberId == null) {
    		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("success",false,"message","로그인이 필요합니다."));
    	}
    	try {
    		account.setMember_id(memberId);
    		int result = accountService.updateAccount(account);
    		
    		if(result > 0 ) {
    			return ResponseEntity.ok(Map.of("success",true));
    		} else {
    			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("success",false,"message","계좌 수정에 실패했습니다."));
    		}
    	} catch(Exception e) {
    		e.printStackTrace();
    		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("success",false,"message","서버 오류가 발생했습니다."));
    	}
    }
    
    @DeleteMapping("/delete")
    public ResponseEntity<?> deleteAccount(@RequestBody Map<String, String> requestBody, HttpServletRequest request){
    	Integer memberId = (Integer)request.getAttribute("userId");
    	String password = requestBody.get("password");
    	
    	if(memberId == null) {
    		return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("success",false,"message","로그인이 필요합니다."));
    	}
    	
    	MembersDTO isPasswordValid = authService.checkPassword(memberId, password);
    	if(isPasswordValid == null) {
    		return ResponseEntity.status(HttpStatus.FORBIDDEN).body(Map.of("success",false,"message","비밀번호가 일치하지 않습니다."));
    	}
    	
    	try {
    		int result = accountService.deleteAccount(memberId);
    		
    		if (result>0) {
    			return ResponseEntity.ok(Map.of("success",true));
    		} else {
    			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("success",false,"message","계좌 삭제에 실패했습니다."));
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Map.of("success",false,"message","서버 오류가 발생했습니다."));
    	}
    }
}

