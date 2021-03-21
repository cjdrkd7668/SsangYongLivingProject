package com.test.living.group;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * CouponDAO. 쿠폰 DB에 접근하는 DAO
 * @author 이찬미
 *
 */
@Repository
public class CouponDAO implements ICouponDAO {

	@Autowired
	private SqlSessionTemplate template;

	//읽지 않은 쿠폰 개수 반환
	@Override
	public int notReadCount(String memberSeq) {
		
		return template.selectOne("group.notReadCountCoupon", memberSeq);
	}

	//읽지 않은 쿠폰 정보 가져오기
	@Override
	public List<CouponDTO> list(String memberSeq) {
		
		return template.selectList("group.noticeCoupon", memberSeq);
	}
}
