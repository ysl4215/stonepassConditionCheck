package com.swempire.web.condition.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.swempire.web.condition.VO.ConditionVO;
import com.swempire.web.condition.service.CurlService;

@RestController
public class RestConditionController {

	@Inject
	private CurlService curlService;

	@RequestMapping(value = "/conditionCurl", method = RequestMethod.POST)
	public String curl(@RequestParam("arr") String arr, @RequestParam("bid") String bid, ConditionVO conditionvo)
			throws Exception {

		
		int intbid = Integer.parseInt(bid);

		int a = Integer.parseInt(arr);

		if (a == 1) {
			conditionvo.setBid(intbid);
			
			curlService.orgaSelect(conditionvo);
			  

			 
			//curlService.curlShoot();

		} else {
			return null;
		}

		return "o";

	}

}
