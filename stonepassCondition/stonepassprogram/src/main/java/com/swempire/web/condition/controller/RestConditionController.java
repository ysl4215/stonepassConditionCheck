package com.swempire.web.condition.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.swempire.web.comm.util.Curl;
import com.swempire.web.comm.util.SendMailUtil;
import com.swempire.web.condition.VO.ConditionVO;
import com.swempire.web.condition.VO.EmailPaginationVO;
import com.swempire.web.condition.VO.EmailVO;
import com.swempire.web.condition.VO.ServiceTestVO;
import com.swempire.web.condition.service.CurlService;
import com.swempire.web.condition.service.EmailService;

@RestController
public class RestConditionController {

	@Inject
	private CurlService curlService;

	@Inject
	private EmailService emailservice;

	String condition;
	Curl curl = new Curl();
	SendMailUtil smu = new SendMailUtil();

	@RequestMapping(value = "/conditionCurlArray", method = RequestMethod.POST)
	public String[] curlArray(@RequestParam(required = false, defaultValue = "null", value = "bidArray") int[] bidArray,
			@RequestParam(required = false, defaultValue = "null", value = "values") String values,
			ConditionVO conditionvo, Model model, EmailVO emailvo, ServiceTestVO servicetestvo,
			EmailPaginationVO pagination
			) throws Exception {

		int checked = Integer.parseInt(values);
		servicetestvo.setChecked(checked);
		servicetestvo.setBidArray(bidArray);

		List<ConditionVO> list = curlService.orgaListSelect(conditionvo, servicetestvo, emailvo,pagination);

		String[] arr = new String[list.size()];

		List<EmailVO> emailList = emailservice.emailListSelect(pagination);

		return curlService.getArr();
	}

	@RequestMapping(value = "/conditionCurl", method = RequestMethod.POST)
	public String curl(@RequestParam("values") String values, @RequestParam("bid") String bid, ConditionVO conditionvo,
			Model model) throws Exception {

		int intbid = Integer.parseInt(bid);

		int checked = Integer.parseInt(values);

		if (checked == 1) {
			conditionvo.setBid(intbid);

			curlService.orgaSelect(conditionvo);

			String strUrl = curlService.orgaSelect(conditionvo).getOrga_url();

			curl.get(strUrl, null);

			int curlCode = curl.getCurlCode();
			int errorNum = curl.getErrorNum();

			if (curlCode == 200 && errorNum != 0) {
				String condition = "O";
				model.addAttribute("condition", condition);

				return condition;
			} else if (curlCode != 200 || errorNum == 0) {
				String condition = "X";
				model.addAttribute("condition", condition);

				return condition;
			}
		} else if (checked == 0) {
			return "";
		}
		return "";
	}

//	@RequestMapping(value = "/conditionCurlArray", method = RequestMethod.POST)
//	public String[] curlArray(@RequestParam(required = false, defaultValue = "null", value = "bidArray") int[] bidArray,
//			@RequestParam(required = false, defaultValue = "null", value = "values") String values,
//			ConditionVO conditionvo, Model model, EmailVO emailvo,ServiceTestVO servicetestvo) throws Exception {
//
//		int checked = Integer.parseInt(values);
//		servicetestvo.setChecked(checked);
//		servicetestvo.setBidArray(bidArray);
//
//		List<ConditionVO> list = curlService.orgaListSelect(conditionvo, servicetestvo, emailvo);
//
//		String[] arr = new String[list.size()];
//
//		List<EmailVO> emailList = emailservice.emailListSelect();
//
//		if (checked == 1) {
//					
//			conditionvo.setBidArray(bidArray);
//
//			for (int i = 0; i < list.size(); i++) {
//			
//				list.get(i).getOrga_url();
//				curl.get(list.get(i).getOrga_url(), null);
//
//				int curlCode = curl.getCurlCode();
//				int errorNum = curl.getErrorNum();
//
//				if (curlCode == 200 && errorNum != 0) {
//
//					this.condition = "O";
//				} else if (curlCode != 200 || errorNum == 0) {
//					System.out.println(list.get(i).getBid());
//
//					// 에러발생한 기관(bid) Select
//					emailvo.setBid(list.get(i).getBid());
//					emailservice.emailErrorOrganameSelect(emailvo);
//
//					String[] errorOrgaName = { emailservice.emailErrorOrganameSelect(emailvo).getOrga_name() };
//					// email수신자 설정
//					for (int j = 0; j < emailList.size(); j++) {
//						smu.setRecipient(emailList.get(j).getEmail());
//
//						// 연결상태 불량인 기관이름을 title에 추가(SendMailUtil클래스에 title값 저장)
//						for (int k = 0; k < errorOrgaName.length; k++) {
//							smu.setTitle(errorOrgaName[k]);
//							smu.send();
//						}
//					}
//					this.condition = "X";
//				}
//
//				arr[i] = condition;
//
//			}
//
//			return curlService.getArr();
//		}
//
//		return arr;
//
//	}
}
