package com.swempire.web.condition.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.swempire.web.condition.Curl;
import com.swempire.web.condition.DAO.CurlDAO;


@Service
public class CurlServiceImpl implements CurlService{

	@Inject
	CurlDAO curldao;
	
	@Override
	public void curlShoot() throws Exception {
		
		
		System.out.println("shoot");
		Curl curl = new Curl();
		
		String[] headers = null;
		
		curl.get("https://login.daegu.ac.kr/stonepass/sp/v1/fido/facets", headers);
		
		
	}

}
