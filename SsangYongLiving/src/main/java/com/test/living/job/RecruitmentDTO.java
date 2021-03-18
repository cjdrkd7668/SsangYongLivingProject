package com.test.living.job;

import lombok.Data;

@Data
public class RecruitmentDTO {
	
	
	private String recruitmentSeq; //join view에서 사용
	private String seq; //tbl 조회에서 사용
	
	private String employerSeq;
	private String startDay;
	private String endDay;
	private String workingDay;
	private String wage;
	private String workArea;
	private String mainDuty;
	private String dutyHours;
	private String storeName;
	private String tel;
	private String address;
	private String mainPoint;
	private String businessURL;
	

}
