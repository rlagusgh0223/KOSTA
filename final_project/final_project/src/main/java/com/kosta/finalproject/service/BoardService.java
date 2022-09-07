package com.kosta.finalproject.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.finalproject.dto.Board;
import com.kosta.finalproject.dto.PageBean;
import com.kosta.finalproject.exception.AddException;
import com.kosta.finalproject.exception.FindException;
import com.kosta.finalproject.exception.ModifyException;
import com.kosta.finalproject.repository.BoardRepository;
@Service
public class BoardService {
	private static final int CNT_PER_PAGE = 10;
	@Autowired
	private BoardRepository repository;
	
//	public PageBean<Board> boardList(int currentPage) throws FindException{
//		int endRow = currentPage * CNT_PER_PAGE;
//		int startRow = endRow - CNT_PER_PAGE + 1;
//		List<Board> list = repository.findByPage(startRow, endRow);
//		long totalCnt = repository.count();
//		int cntPerPageGroup = 2;  // 2로 해도 한페이지에 10개의 데이터라 20개인데 5로하면 너무 많을것 같아서 2로 함
//		PageBean<Board> pb1 = new PageBean<>(list, totalCnt, currentPage, cntPerPageGroup, CNT_PER_PAGE);
//		return pb1;
//	}
	
	public PageBean<Board> searchBoard(String word, int currentPage) throws FindException{
		return null;
	}
	
	public Board viewBoard(Long boardNo) throws FindException{
		Optional<Board> optB = repository.findById(boardNo);
		if(optB.isPresent()) {
			Board b = optB.get();
			b.setBoardViewcount(b.getBoardViewcount()+1);
			repository.save(b);
		} else {
			throw new FindException("게시글이 없습니다");
		}
		
		Optional<Board> optB1 = repository.findById(boardNo);
		if(optB1.isPresent()) {
			Board b1 = optB1.get();
			return b1;
		} else {
			throw new FindException("게시글이 없습니다");
		}
	}
		
	public void writeBoard(Board board) throws AddException{
		board.setBoardParentNo(0L);
		repository.save(board);
	}
		
	public void replyBoard(Board board) throws AddException{
		if(board.getBoardParentNo() == 0L) {
			throw new AddException("답글쓰기의 부모글번호가 없습니다");
		}
		repository.save(board);
	}
		
	public void modifyBoard(Board board) throws ModifyException{
		Optional<Board> optB = repository.findById(board.getBoardNo());
		if(!optB.isPresent()) {
			throw new ModifyException("글이 없습니다");
		} else {
			Board b = optB.get();
			b.setBoardContent(board.getBoardContent());
			repository.save(b);
		}
	}
	public void removeBoard(Long boardNo) {
		repository.deleteById(boardNo);
	}
}
