package com.test.living.job;

import java.util.List;

public interface IRecruitmentDAO {

	List<RecruitmentDTO> recruitmentlist();

	RecruitmentDTO recruitmentget(String recruitmentSeq); //모집공고문 매개번호

	RecruitmentChartDTO chartget(String recruitmentSeq); //모집공고문 차트정보 가져오는 메서드

}
