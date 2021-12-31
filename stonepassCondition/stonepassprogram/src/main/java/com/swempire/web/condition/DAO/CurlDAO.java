package com.swempire.web.condition.DAO;

import java.util.List;

import com.swempire.web.condition.VO.ConditionVO;

public interface CurlDAO {

	public void curlShoot() throws Exception;

	public ConditionVO orgaSelect(ConditionVO conditionvo) throws Exception;
	
	public List<ConditionVO> orgaListSelect(ConditionVO conditionvo) throws Exception;

}
