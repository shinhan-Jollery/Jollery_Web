package com.shinhan.auth.mail;


import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import com.shinhan.VO.AuthCodeDTO;

public class VerificationService {

    private static final Random random = new Random();

    /**
     *  인증 코드 생성
     * @param email
     * @return 인증코드
     */
    public static String generateVerificationCode(String email) {
        String code = String.format("%06d", random.nextInt(1000000)); // 6자리 인증 코드
        return code;
    }
    
    /**
     * 인증 코드 검증
     * @param email
     * @param code
     * @return
     */
    public static boolean verifyCode(AuthCodeDTO authcode, String code) {
    	boolean result = authcode.getAuth_code().equals(code)?true:false;
        return result;
    }
}
