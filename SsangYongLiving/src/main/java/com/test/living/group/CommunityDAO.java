package com.test.living.group;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * CommunityDAO. 커뮤니티 글 DB에 접근하는 DAO
 * @author 이찬미
 *
 */
@Repository
public class CommunityDAO implements ICommunityDAO {
	
	@Autowired
	private SqlSessionTemplate template;

	//커뮤니티 글 목록
	@Override
	public List<CommunityDTO> list(CommunityDTO dto) {
		
		return template.selectList("group.communityList", dto);
	}

	//커뮤니티 글 상세 보기
	@Override
	public CommunityDTO view(String seq) {
		
		return template.selectOne("group.communityView", seq);
	}

	//회원 이름
	@Override
	public String memberName(String memberSeq) {
		
		return template.selectOne("group.memberName", memberSeq);
	}

	//많이 본 글 목록
	@Override
	public List<CommunityDTO> mostViewList(String postSeq) {
		
		return template.selectList("group.mostViewList", postSeq);
	}

	//추천 글 목록
	@Override
	public List<CommunityDTO> recList(String postSeq) {

		return template.selectList("group.recList", postSeq);
	}

	//댓글 많은 글 목록
	@Override
	public List<CommunityDTO> mostCmtList(String postSeq) {
		
		return template.selectList("group.mostCmtList", postSeq);
	}

	//커뮤니티 총 페이지 수
	@Override
	public int communityTotalPage(String postSeq) {
		
		return template.selectOne("group.communityTotalPage", postSeq);
	}

	//조회 수 증가
	@Override
	public void updateCommunityReadcount(String seq) {
		
		template.update("group.updateCommunityReadcount", seq);
	}

	//추천 수 증가
	@Override
	public void updateCommunityReccount(String seq) {
		
		template.update("group.updateCommunityReccount", seq);
	}

	//커뮤니티 글쓰기
	@Override
	public int add(CommunityDTO dto) {
		
		return template.insert("group.addCommunity", dto);
	}




}
