package com.test.living.group;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * QnaDAO. Qna 글 DB에 접근하는 DAO
 * @author 이찬미
 *
 */
@Repository
public class QnaDAO implements IQnaDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	//Qna 글 목록
	@Override
	public List<QnaDTO> list(QnaDTO qdto) {
		
		return template.selectList("group.qnaList", qdto);
	}

	//Qna 총 페이지 수
	@Override
	public int communityTotalPage(String seq) {
		
		return template.selectOne("group.qnaTotalPage", seq);
	}

}
