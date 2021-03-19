package com.test.living.group;

import java.util.List;

public interface ICommunityCommentDAO {

	List<CommunityCommentDTO> view(String seq);

	int add(CommunityCommentDTO dto);

	int replyAdd(CommunityCommentDTO dto);

	int edit(CommunityCommentDTO dto);

	int del(CommunityCommentDTO dto);

}
