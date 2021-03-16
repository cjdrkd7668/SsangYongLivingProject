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
	public String memberName(String seq) {
		
		return template.selectOne("group.memberName", seq);
	}



}
