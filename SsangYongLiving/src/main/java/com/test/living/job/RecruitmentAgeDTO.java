package com.test.living.job;

import lombok.Data;

@Data
public class RecruitmentAgeDTO {

	//알바모집공고 차트 정보 연령대
	private String age;  //나이대
	private String ageCnt; //집계 수
	private String recruitmentSeq; //모집공고번호
}
