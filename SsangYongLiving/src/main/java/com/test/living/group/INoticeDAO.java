package com.test.living.group;

import java.util.List;

public interface INoticeDAO {

	int notReadCount(String memberSeq);

	List<NoticeDTO> list(String memberSeq);


}
