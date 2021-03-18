package com.test.living.group;

import lombok.Data;

/**
 * QnaDTO. Qna 글 정보를 담은 DTO
 * @author 이찬미
 *
 */
@Data
public class QnaDTO {

	private String seq;
	private String postSeq;
	private String companySeq;
	private String memberSeq;
	private String name;
	private String subject;
	private String regDate;
	private String gap;
	private String updateDate;
	private String readCount;
	private String fileName;
	private String openFlag;

	private int nowPage;
	private int totalPage;
}
