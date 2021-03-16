package com.test.living.group;

import lombok.Data;

/**
 * CommunityCommentDTO. 커뮤니티 댓글 정보를 담은 DTO
 * @author 이찬미
 *
 */
@Data
public class CommunityCommentDTO {

	private String seq;
	private String pseq;
	private String communitySeq;
	private String memberSeq;
	private String memberName;
	private String detail;
	private String level;
	private String regDate;
	private String gap;
	private String updateDate;
	private String delFlag;

}
