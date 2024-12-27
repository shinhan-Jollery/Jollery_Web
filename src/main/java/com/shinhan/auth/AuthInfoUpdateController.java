package com.shinhan.auth;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shinhan.VO.MembersDTO;

@Controller
@RequestMapping("/auth")
public class AuthInfoUpdateController {
    @Autowired
    private AuthInfoUpdateService authInfoUpdateService;

    // 회원 정보 수정 페이지
    @GetMapping("/infoUpdate")
    public String showInfoUpdatePage(HttpSession session, Model model) {
        Integer memberId = (Integer) session.getAttribute("memberId");
        if (memberId == null) {
            return "auth/infoUpdate";
        }

        MembersDTO member = authInfoUpdateService.getMemberInfo(memberId);
        model.addAttribute("member", member);
        return "auth/infoUpdate";
    }
}
