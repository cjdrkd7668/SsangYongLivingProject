package com.test.living.group;

import lombok.Data;

/**
 * NoticeDTO. 공지 정보를 담은 DTO
 * @author 이찬미
 *
 */
@Data
public class NoticeDTO {

	private String seq;
	private String memberSeq;
	private String postSeq;
	private String psubject;
	private String detail;
	private String noticeDate;
	private int readFlag;
	private int gap;
}
