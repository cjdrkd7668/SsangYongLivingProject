package com.test.living.job;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StoryBoardDAO implements IStoryBoardDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public int storyadd(StoryBoardDTO dto) {
		return template.insert("jobboard.storyadd", dto);
	}
	
}
