package com.swempire.web.condition.DAO;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.swempire.web.condition.VO.ConditionVO;

@Repository
public class CurlDAOImpl implements CurlDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void curlShoot() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ConditionVO orgaSelect(ConditionVO conditionvo) throws Exception {
			
		return sqlSession.selectOne("com.swempire.web.condition.conditionMapper.orgaSelect", conditionvo);
	}

	@Override
	public List<ConditionVO> orgaListSelect(ConditionVO conditionvo) throws Exception {
		HashMap<String, Object> map =new HashMap<String, Object>();
		
		map.put("bidArray", conditionvo.getBidArray());
		
		return sqlSession.selectList("com.swempire.web.condition.conditionMapper.orgaListSelect", map);
	}

}
