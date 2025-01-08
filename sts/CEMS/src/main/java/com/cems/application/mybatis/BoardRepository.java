package com.cems.application.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.cems.application.vo.BoardDto;
import com.cems.application.vo.LeaderDto;
import com.cems.application.vo.MockboardDto;

@Mapper
@Repository
public interface BoardRepository {
	List<BoardDto> getAllBoard();
	BoardDto getBoard();
	int insertBoard();
	int deleteBoard();
	int updateBoard();
	List<MockboardDto> getAllMockboard();
	MockboardDto getMockboard(int mockboard_id);
	List<LeaderDto> getleaderBoard();
}
