package com.shinhan.main;




import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class mainController {
    @GetMapping("main.do")
    public String mypage(HttpSession session, HttpServletRequest request, Model model) {
        try {
            // 로그인 정보를 받기
            int userId = (int) request.getAttribute("userId");
            String memberName = (String) request.getAttribute("Member_name");
            model.addAttribute("userId", userId);
            model.addAttribute("memberName", memberName);

            System.out.println("userID: " + userId);
            System.out.println("username: " + memberName);

        } catch (Exception e) {
            System.out.println("로그인 정보가 없습니다.");
        }

        return "main/main";
    }
}
