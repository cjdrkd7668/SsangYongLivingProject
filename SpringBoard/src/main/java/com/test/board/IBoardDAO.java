package com.test.board;

import java.util.List;

public interface IBoardDAO {

	int add(BoardDTO dto);

	List<BoardDTO> list();

	BoardDTO get(String seq);

}
