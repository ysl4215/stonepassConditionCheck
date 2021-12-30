package com.swempire.web.condition.service;

import java.util.List;

import com.swempire.web.condition.VO.EmailVO;

public interface EmailService {
	
	public List<EmailVO> listSelectEmail() throws Exception;
	public int emailInsert(EmailVO emailvo) throws Exception;
	public void emailDelete(EmailVO emailvo) throws Exception;
	
}
