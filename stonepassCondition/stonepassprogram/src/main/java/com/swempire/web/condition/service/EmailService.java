package com.swempire.web.condition.service;

import java.util.List;

import com.swempire.web.condition.VO.EmailPaginationVO;
import com.swempire.web.condition.VO.EmailVO;

public interface EmailService {
	
	public List<EmailVO> emailListSelect(EmailPaginationVO pagination) throws Exception;
	public List<EmailVO> emailListLimitSelect(EmailPaginationVO pagination) throws Exception;
	public int emailListCnt() throws Exception;
	public int emailInsert(EmailVO emailvo) throws Exception;
	public void emailDelete(EmailVO emailvo) throws Exception;
	public EmailVO emailErrorOrganameSelect(EmailVO emailvo) throws Exception;
	
}
