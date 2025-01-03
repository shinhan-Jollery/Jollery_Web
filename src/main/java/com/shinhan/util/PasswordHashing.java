package com.shinhan.util;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordHashing {
	//테스트 케이스의 어려움이 있으므로 추후에 적용!
    // 비밀번호 해싱
    public static String hashPassword(String plainPassword) {
        return BCrypt.hashpw(plainPassword, BCrypt.gensalt());
    }

    // 비밀번호 검증
    public static boolean checkPassword(String plainPassword, String hashedPassword) {
        return BCrypt.checkpw(plainPassword, hashedPassword);
    }
}