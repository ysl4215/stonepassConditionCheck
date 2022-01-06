package com.swempire.web.condition.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.swempire.web.comm.util.Curl;
import com.swempire.web.comm.util.SendMailUtil;
import com.swempire.web.condition.DAO.CurlDAO;
import com.swempire.web.condition.DAO.EmailDAO;
import com.swempire.web.condition.VO.ConditionVO;
import com.swempire.web.condition.VO.EmailVO;
import com.swempire.web.condition.VO.ServiceTestVO;
import com.swempire.web.condition.controller.RestConditionController;

@Service
public class CurlServiceImpl implements CurlService {

	@Inject
	CurlDAO curldao;
	
	@Inject
	EmailDAO emaildao;
		
	@Inject
	RestConditionController restconditioncontroller;
	SendMailUtil smu = new SendMailUtil();
	ServiceTestVO servicetestvo = new ServiceTestVO();
	Curl curl = new Curl();
	String condition;
	String[] arr;

	public String[] getArr() {
		return arr;
	}

	public void setArr(String[] arr) {
		this.arr = arr;
	}

	@Override
	public void curlShoot() throws Exception {

		Curl curl = new Curl();
		String[] headers = null;

		curl.get("https://login.daegu.ac.kr/stonepass/sp/v1/fido/facets", headers);

	}

	@Override
	public ConditionVO orgaSelect(ConditionVO conditionvo) throws Exception {

		return curldao.orgaSelect(conditionvo);
	}

	@Override
	public List<ConditionVO> orgaListSelect(ConditionVO conditionvo, ServiceTestVO servicetestvo, 
			EmailVO emailvo) throws Exception {
		
		
		int checked = servicetestvo.getChecked();
		int[] bidArray = servicetestvo.getBidArray();
				
		List<ConditionVO> list = curldao.orgaListSelect(conditionvo);
		String[] arr = new String[list.size()];
		List<EmailVO> emailList = emaildao.emailListSelect();
		
if (checked == 1) {					
			conditionvo.setBidArray(bidArray);

			for (int i = 0; i < list.size(); i++) {			
				list.get(i).getOrga_url();
				curl.get(list.get(i).getOrga_url(), null);

				int curlCode = curl.getCurlCode();
				int errorNum = curl.getErrorNum();

				if (curlCode == 200 && errorNum != 0) {

					this.condition = "O";
				} else if (curlCode != 200 || errorNum == 0) {
					// 에러발생한 기관(bid) Select
					emailvo.setBid(list.get(i).getBid());
					emaildao.emailErrorOrganameSelect(emailvo);

					String[] errorOrgaName = { emaildao.emailErrorOrganameSelect(emailvo).getOrga_name() };
					// email수신자 설정
					for (int j = 0; j < emailList.size(); j++) {
						smu.setRecipient(emailList.get(j).getEmail());

						// 연결상태 불량인 기관이름을 title에 추가(SendMailUtil클래스에 title값 저장)
						for (int k = 0; k < errorOrgaName.length; k++) {
							smu.setTitle(errorOrgaName[k]);
							smu.send();
						}
					}
					this.condition = "X";
				}
				arr[i] = condition;
			}
			this.arr = arr;	
		}		
		return curldao.orgaListSelect(conditionvo);
	}

}
