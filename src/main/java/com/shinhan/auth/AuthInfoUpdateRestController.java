package com.shinhan.auth;

import java.util.HashMap;
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

import com.shinhan.VO.MembersDTO;

@RestController
@RequestMapping("/api/auth")
public class AuthInfoUpdateRestController {
    @Autowired
    private AuthInfoUpdateService authInfoUpdateService;

    // 회원 정보 업데이트 처리
    @PutMapping("/infoUpdate")
    public ResponseEntity<Map<String, Object>> updateMemberInfo(@RequestBody MembersDTO member, HttpServletRequest request) {
        Integer memberId = (Integer) request.getAttribute("userId");
        if (memberId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("success", false, "message", "로그인이 필요합니다."));
        }

        member.setMember_id(memberId); // 로그인된 사용자 ID를 추가
        boolean isUpdated = authInfoUpdateService.updateMemberInfo(member); // 서비스 호출

        if (isUpdated) {
            return ResponseEntity.ok(Map.of("success", true, "message", "회원 정보가 수정되었습니다."));
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("success", false, "message", "회원 정보 수정에 실패했습니다."));
        }
    }


    @PostMapping("/pwCheck")
    public ResponseEntity<Map<String, Object>> checkPassword(@RequestBody Map<String, String> request, HttpServletRequest httpRequest) {
        Integer memberId = (Integer) httpRequest.getAttribute("userId");
        System.out.println("Received memberId: " + memberId);
        if (memberId == null) {
            System.out.println("Error: userId is null");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("success", false, "message", "로그인이 필요합니다."));
        }

        String password = request.get("password");
        System.out.println("Received password: " + password);
        if (password == null || password.isBlank()) {
            return ResponseEntity.badRequest().body(Map.of("success", false, "message", "비밀번호를 입력해주세요."));
        }

        MembersDTO dto = authInfoUpdateService.checkPassword(memberId, password);

        System.out.println("Password validation result: " + dto);

        if (dto != null) {
            return ResponseEntity.ok(Map.of("success", true));
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("success", false, "message", "비밀번호가 올바르지 않습니다."));
        }
    }


    // 회원 삭제
    @DeleteMapping("/delete")
    public ResponseEntity<Map<String, Object>> deleteMember(HttpServletRequest request) {
        Integer memberId = (Integer) request.getAttribute("userId");
        if (memberId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("success", false, "message", "로그인이 필요합니다."));
        }

        boolean isDeleted = authInfoUpdateService.deleteMember(memberId);

        if (isDeleted) {
            return ResponseEntity.ok(Map.of("success", true, "message", "회원이 삭제되었습니다."));
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("success", false, "message", "회원 삭제에 실패했습니다."));
        }
    }
    
    @GetMapping("/profile")
    public ResponseEntity<Map<String, Object>> getProfile(HttpServletRequest request) {
        Integer memberId = (Integer) request.getAttribute("userId");

        if (memberId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("success", false, "message", "로그인이 필요합니다."));
        }

        // 사용자 정보 조회
        MembersDTO member = authInfoUpdateService.getMemberInfo(memberId);

        if (member != null) {
            Map<String, Object> response = new HashMap<>();
            response.put("success", true);
            response.put("data", member); // 사용자 정보
            return ResponseEntity.ok(response);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(Map.of("success", false, "message", "회원 정보를 찾을 수 없습니다."));
        }
    }
    
  

}