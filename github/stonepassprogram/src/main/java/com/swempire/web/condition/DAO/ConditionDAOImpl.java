package com.swempire.web.condition.DAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.swempire.web.condition.VO.ConditionVO;


@Repository
public class ConditionDAOImpl implements ConditionDAO {
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<ConditionVO> getBoardList() throws Exception {
		
		return sqlSession.selectList("com.swempire.web.condition.conditionMapper.getBoardList");

	}

	@Override
	public int insertBoard(ConditionVO conditionvo) throws Exception {
		
		return sqlSession.insert("com.swempire.web.condition.conditionMapper.insertBoard", conditionvo);
		
		
	}



}
