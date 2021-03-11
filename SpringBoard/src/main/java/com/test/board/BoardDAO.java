package com.test.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO implements IBoardDAO {
	
	@Autowired
	private SqlSessionTemplate template;

	@Override
	public int add(BoardDTO dto) {
		
		return template.insert("board.add", dto);
	}
	
	
	@Override
	public List<BoardDTO> list() {

		return template.selectList("board.list");
	}
	
	
	@Override
	public BoardDTO get(String seq) {
		
		return template.selectOne("board.get", seq);
	}
}





















