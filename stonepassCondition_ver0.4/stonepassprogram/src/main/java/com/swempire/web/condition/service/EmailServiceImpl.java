package com.swempire.web.condition.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.swempire.web.condition.DAO.EmailDAO;
import com.swempire.web.condition.VO.EmailVO;

@Service
public class EmailServiceImpl implements EmailService{
	
	@Inject
	EmailDAO emaildao;

	@Override
	public int emailInsert(EmailVO emailvo) throws Exception {
		
		return emaildao.emailInsert(emailvo);
	}

	@Override
	public List<EmailVO> listSelectEmail() throws Exception {
		
		return emaildao.listSelectEmail();
	}

	@Override
	public void emailDelete(EmailVO emailvo) throws Exception {
		emaildao.emailDelete(emailvo);
		
	}

}
