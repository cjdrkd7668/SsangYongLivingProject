package com.test.living.group;

import lombok.Data;

/**
 * GroupBuyingPostDTO. 공동구매 정보를 담은 DTO
 * @author 이찬미
 *
 */
@Data
public class GroupBuyingPostDTO {
	
	private String seq;
	private String companySeq;
	private String companyName;
	private String companyAddress;
	private String companyCount;
	private String companyLastTime;
	private String subject;
	private String name;
	private String detail;
	private String url;
	private String price;
	private String rate;
	private String minCount;
	private String salesCount;
	private String totalCount;
	private String startDate;
	private String endDate;
	private String timeRemaining;
	private String state;
	private String delFlag;
	
	private int nowPage;

}
