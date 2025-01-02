package com.shinhan.auth.certify;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.VO.MembersDTO;

@Service
public class AuthCertifyService {
	
	@Autowired
	AuthCertifyDAO certifyDAO;
	
	public int updateService (MembersDTO member) {
		return certifyDAO.update(member);
	}
	
}
