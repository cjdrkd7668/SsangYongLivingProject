package com.test.living.group;

import java.util.List;
import java.util.Map;

public interface IQnaDAO {

	List<QnaDTO> list(QnaDTO qdto);

	int communityTotalPage(String seq);

}
