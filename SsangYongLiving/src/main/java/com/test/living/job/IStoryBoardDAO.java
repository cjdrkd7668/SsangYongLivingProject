package com.test.living.job;

import java.util.List;

public interface IStoryBoardDAO {


	
	int storyadd(StoryBoardDTO dto);

	List<StoryBoardDTO> storylist();

	StoryBoardDTO storyget(String seq);

	int storydel(String seq);

	int storyedit(StoryBoardDTO dto);

	
}
