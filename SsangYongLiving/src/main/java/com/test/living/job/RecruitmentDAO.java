package com.test.living.job;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecruitmentDAO implements IRecruitmentDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public List<RecruitmentDTO> recruitmentlist() {
		
		return template.selectList("jobrecruitment.recruitmentlist");
	}
	
	
}
