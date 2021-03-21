package com.test.living.group;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * NoticeDAO. 공지 DB에 접근하는 DAO
 * @author 이찬미
 *
 */
@Repository
public class NoticeDAO implements INoticeDAO {

	@Autowired
	private SqlSessionTemplate template;

	//읽지 않은 공구 알림 개수 반환
	@Override
	public int notReadCount(String memberSeq) {

		return template.selectOne("group.notReadCountPost", memberSeq);
	}

	//읽지 않은 공구 정보 가져오기
	@Override
	public List<NoticeDTO> list(String memberSeq) {
		
		return template.selectList("group.noticePost", memberSeq);
	}


}
