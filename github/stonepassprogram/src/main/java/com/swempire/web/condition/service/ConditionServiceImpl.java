package com.swempire.web.condition.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.swempire.web.condition.DAO.ConditionDAO;
import com.swempire.web.condition.VO.ConditionVO;

@Service
public class ConditionServiceImpl implements ConditionService{
	
	
	@Inject
	private ConditionDAO conditionDAO;

	public List<ConditionVO> getBoardList() throws Exception {

		return conditionDAO.getBoardList();

	}

	@Override
	public int insertBoard(ConditionVO conditionvo) throws Exception {
		
		return conditionDAO.insertBoard(conditionvo);
		
	}

}
