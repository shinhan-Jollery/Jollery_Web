package com.shinhan.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinhan.VO.AccountsDTO;

@Service
public class AccountService {

    @Autowired
    private AccountDAO accountDAO;

    public AccountsDTO findByMemberId(Integer memberId) {
    	return accountDAO.findByMemberId(memberId);
    }
    
    public int insertAccount(AccountsDTO account) {
    	return accountDAO.insertAccount(account);
    }
    
    public int updateAccount(AccountsDTO account) {
    	return accountDAO.updateAccount(account);
    }
    
    public int deleteAccount(Integer memberId) {
    	return accountDAO.deleteAccount(memberId);
    }
}
