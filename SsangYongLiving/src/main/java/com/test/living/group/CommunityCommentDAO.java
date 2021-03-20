package com.test.living.group;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * CommunityCommentDAO. 커뮤니티 댓글 DB에 접근하는 DAO
 * @author 이찬미
 *
 */
@Repository
public class CommunityCommentDAO implements ICommunityCommentDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	//커뮤니티 특정 글 목록
	@Override
	public List<CommunityCommentDTO> view(String seq) {
		
		return template.selectList("group.communityCommentList", seq);
	}

	//커뮤니티 댓글 작성
	@Override
	public int add(CommunityCommentDTO dto) {
		
		return template.insert("group.communityCommentAdd", dto);
	}
	

	//커뮤니티 대댓글(댓글의 댓글들) 작성
	@Override
	public int replyAdd(CommunityCommentDTO dto) {

		return template.insert("group.communityReplyAdd", dto);
	}
	
	//커뮤니티 댓글 수정
	@Override
	public int edit(CommunityCommentDTO dto) {

		return template.update("group.communityCommentEdit", dto);
	}

	//커뮤니티 댓글 삭제
	@Override
	public int del(CommunityCommentDTO dto) {

		return template.update("group.communityCommentDel", dto);
	}



}
