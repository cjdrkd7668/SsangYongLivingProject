package com.test.living.group;

import java.util.List;

public interface ICommunityDAO {

	List<CommunityDTO> list(CommunityDTO dto);

	CommunityDTO view(String seq);

	String memberName(String memberSeq);

	List<CommunityDTO> mostViewList(String postSeq);

	List<CommunityDTO> recList(String postSeq);

	List<CommunityDTO> mostCmtList(String postSeq);

	int communityTotalPage(String postSeq);

	void updateCommunityReadcount(String seq);

	int add(CommunityDTO dto);

	void updateCommunityReccount(String seq);

	int edit(CommunityDTO dto);

	int del(String seq);




}
