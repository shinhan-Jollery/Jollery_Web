package com.shinhan.auth;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
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
    public ResponseEntity<Map<String, Object>> updateMemberInfo(@RequestBody MembersDTO member, HttpSession session) {
        Integer memberId = (Integer) session.getAttribute("loggedInUser");
        if (memberId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("success", false, "message", "로그인이 필요합니다."));
        }

        member.setMember_id(memberId);
        boolean isUpdated = authInfoUpdateService.updateMemberInfo(member);

        if (isUpdated) {
            return ResponseEntity.ok(Map.of("success", true, "message", "회원 정보가 수정되었습니다."));
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("success", false, "message", "회원 정보 수정에 실패했습니다."));
        }
    }

    // 비밀번호 확인
    @PostMapping("/pwCheck")
    public ResponseEntity<Map<String, Object>> checkPassword(@RequestBody Map<String, String> request, HttpSession session) {
        Integer memberId = (Integer) session.getAttribute("loggedInUser");
        if (memberId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("success", false, "message", "로그인이 필요합니다."));
        }

        String password = request.get("password");
        boolean isValid = authInfoUpdateService.checkPassword(memberId, password);

        if (isValid) {
            return ResponseEntity.ok(Map.of("success", true));
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("success", false, "message", "비밀번호가 올바르지 않습니다."));
        }
    }

    // 회원 삭제
    @DeleteMapping("/delete")
    public ResponseEntity<Map<String, Object>> deleteMember(HttpSession session) {
        Integer memberId = (Integer) session.getAttribute("loggedInUser");
        if (memberId == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("success", false, "message", "로그인이 필요합니다."));
        }

        boolean isDeleted = authInfoUpdateService.deleteMember(memberId);

        if (isDeleted) {
            session.invalidate();
            return ResponseEntity.ok(Map.of("success", true, "message", "회원이 삭제되었습니다."));
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("success", false, "message", "회원 삭제에 실패했습니다."));
        }
    }
}
