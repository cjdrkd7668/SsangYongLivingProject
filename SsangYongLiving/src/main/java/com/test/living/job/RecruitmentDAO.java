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

	@Override
	public RecruitmentDTO recruitmentget(String recruitmentSeq) {
		
		return template.selectOne("jobrecruitment.recruitmentget", recruitmentSeq);
	}

	@Override
	public RecruitmentChartDTO chartget(String recruitmentSeq) {
		
		return template.selectOne("jobrecruitment.chartget", recruitmentSeq);
	}

	@Override
	public List<RecruitmentAgeDTO> agelist(String recruitmentSeq) {
		
		return template.selectList("jobrecruitment.agelist", recruitmentSeq);
	}

	@Override
	public List<RecruitmentCareerDTO> careerlist(String recruitmentSeq) {
		
		return template.selectList("jobrecruitment.careerlist", recruitmentSeq);
	}


	
	
	
	
}
