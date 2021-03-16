package com.test.living.group;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * GroupBuyingPostDAO. 공동구매 글 DB에 접근하는 DAO
 * @author 이찬미
 *
 */
@Repository
public class GroupBuyingPostDAO implements IGroupBuyingPostDAO {
	
	@Autowired
	private SqlSessionTemplate template;

	@Override
	public GroupBuyingPostDTO view(String seq) {
	
		return template.selectOne("group.groupBuyingPost", seq);
	}

}
