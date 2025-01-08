package com.cems.application.mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.cems.application.vo.CommentDto;
import com.cems.application.vo.RecommentDto;

@Mapper
@Repository
public interface CommentRepository {
	List<CommentDto> comment_list(int board_id);

	Map<String, RecommentDto> recomment_list(int board_id);

	int insertComment(CommentDto comdto);

	int insertRecomment(RecommentDto recomdto);
}
