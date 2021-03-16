package com.test.living.group;

import java.util.List;

public interface ICommunityDAO {

	List<CommunityDTO> list(CommunityDTO dto);

	CommunityDTO view(String seq);

	String memberName(String attribute);


}
