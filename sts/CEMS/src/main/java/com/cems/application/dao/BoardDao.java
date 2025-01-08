package com.cems.application.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.cems.application.vo.BoardDto;
import com.cems.application.vo.CommentDto;
import com.cems.application.vo.LeaderDto;
import com.cems.application.vo.MockboardDto;
import com.cems.application.vo.RecommentDto;

@Component
@Repository
public class BoardDao {
	@Autowired
	private SqlSessionTemplate mybatis;

	private Logger log = LoggerFactory.getLogger(BoardDao.class);

	public int insert_Board(BoardDto boardDto) {
		return mybatis.insert("com.cems.application.mybatis.BoardRepository.insertBoard", boardDto);
	}

	public int delete_Board(int board_id) {
		return mybatis.update("com.cems.application.mybatis.BoardRepository.deleteBoard", board_id);
	}

	public int update_Board(BoardDto boardDto) {
		return mybatis.update("com.cems.application.mybatis.BoardRepository.updateBoard", boardDto);
	}

	public int update_View(int board_id) {
		return mybatis.update("com.cems.application.mybatis.BoardRepository.updateView", board_id);
	}

	public int update_Mark_On(int board_id) {
		return mybatis.update("com.cems.application.mybatis.BoardRepository.updateMark_on", board_id);
	}

	public int update_Mark_Off(int board_id) {
		return mybatis.update("com.cems.application.mybatis.BoardRepository.updateMark_off", board_id);
	}

	public int update_Mark(int board_id) {
		return mybatis.update("com.cems.application.mybatis.BoardRepository.updateMark", board_id);
	}

	public List<BoardDto> get_Admin_Board() {
		return mybatis.selectList("com.cems.application.mybatis.BoardRepository.getAdminBoard");
	}

	public List<BoardDto> get_User_Board() {
		
		List<BoardDto> boardlist = new ArrayList<>();
		
		boardlist = mybatis.selectList("com.cems.application.mybatis.BoardRepository.getUserBoard");
		
		for(BoardDto boarddto : boardlist) {
			if( boarddto.getUser_ban().equals("0") || boarddto.getUser_ban().equals("Q") || boarddto.getUser_ban().equals("C") ){
				continue;
			}else {
				boarddto.setTitle("이 게시물은 운영자에 의해 차단된 게시물 입니다.");
			}
		}
		return boardlist;
	}

	public List<BoardDto> get_Mark_Board() {
		return mybatis.selectList("com.cems.application.mybatis.BoardRepository.getMarkBoard");
	}

	public BoardDto get_Board(int board_id) {
		BoardDto boarddto = mybatis.selectOne("com.cems.application.mybatis.BoardRepository.getBoard", board_id);
		
		if( boarddto.getUser_ban().equals("0") || boarddto.getUser_ban().equals("Q") || boarddto.getUser_ban().equals("C") ){
		}else {
			boarddto.setTitle("이 게시물은 운영자에 의해 차단된 게시물 입니다.");
			boarddto.setContent("이 게시물은 운영자에 의해 차단된 게시물 입니다.");
		}
		
		return boarddto;
	}

	

	// Comment DAO

	public List<CommentDto> comment_list(int board_id) {
		
		List<CommentDto> commentlist = new ArrayList<>();
		
		commentlist = mybatis.selectList("com.cems.application.mybatis.CommentRepository.comment_list", board_id);
		
		for(CommentDto commentdto : commentlist) {
			if( commentdto.getUser_ban().equals("0") || commentdto.getUser_ban().equals("Q") || commentdto.getUser_ban().equals("B")){
				continue;
			}else {
				commentdto.setContent("이 댓글은 운영자에 의해 차단 된 댓글 입니다.");
			}
		}
		
		return commentlist;
	}

	public List<RecommentDto> recomment_list(int board_id) {
		
		List<RecommentDto> recommentlist = new ArrayList<>();
		
		recommentlist = mybatis.selectList("com.cems.application.mybatis.CommentRepository.recomment_list", board_id);
		
		for(RecommentDto recommentdto : recommentlist) {
			if( recommentdto.getUser_ban().equals("0") || recommentdto.getUser_ban().equals("Q") || recommentdto.getUser_ban().equals("B")){
				continue;
			}else {
				recommentdto.setContent("이 댓글은 운영자에 의해 차단 된 댓글 입니다.");
			}
		}
		
		return recommentlist;
	}

	public int insert_Comment(CommentDto comdto) {
		return mybatis.insert("com.cems.application.mybatis.CommentRepository.insertComment", comdto);
	}

	public int insert_Recomment(RecommentDto recomdto) {
		return mybatis.insert("com.cems.application.mybatis.CommentRepository.insertRecomment", recomdto);
	}
	
	
	public int delete_Comment(int comment_id) {
		return mybatis.update("com.cems.application.mybatis.CommentRepository.deleteComment", comment_id);
	}
	
	public int delete_Recomment(int recomment_id) {
		return mybatis.update("com.cems.application.mybatis.CommentRepository.deleteRecomment", recomment_id);
	}
	
	
	
	// Leader Dao
	public List<LeaderDto> getleaderBoard(String user_id){
		List<LeaderDto> leaderlist = mybatis.selectList("com.cems.application.mybatis.BoardRepository.getleaderBoard", user_id);
		return leaderlist;
	}
	
	
	

}
