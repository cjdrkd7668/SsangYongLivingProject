package com.test.living.group;

import java.util.List;

public interface ICouponDAO {

	int notReadCount(String memberSeq);

	List<CouponDTO> list(String memberSeq);

}
