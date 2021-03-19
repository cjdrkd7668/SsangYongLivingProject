package com.test.living.group;

import lombok.Data;

/**
 * CommunityDTO. 커뮤니티 글 정보를 담은 DTO
 * @author 이찬미
 *
 */
@Data
public class CommunityDTO {

	private String seq;
	private String postSeq;
	private String companyName;
	private String memberName;
	private String memberSeq;
	private String postSubject;
	private String subject;
	private String detail;
	private String regDate;
	private int gap;
	private String updateDate;
	private String recCount;
	private String readCount;
	private String commentCount;
	private String delFlag;
	private int nowPage; //현재 페이지
}
