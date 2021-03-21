package com.test.living.group;

import lombok.Data;

/**
 * CouponDTO. 쿠폰 정보를 담은 DTO
 * @author 이찬미
 *
 */
@Data
public class CouponDTO {

	private String seq;
	private String companySeq;
	private String cname;
	private String memberSeq;
	private String discount;
	private String period;
	private String issueDate;
	private String useDate;
	private String endDate;
	private int readFlag;
	private int gap;
}
