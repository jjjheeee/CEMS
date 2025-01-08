package com.cems.application.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cems.application.dao.BoardDao;
import com.cems.application.vo.BoardDto;
import com.cems.application.vo.CommentDto;
import com.cems.application.vo.LeaderDto;
import com.cems.application.vo.MockboardDto;
import com.cems.application.vo.RecommentDto;
import com.cems.application.vo.UserDto;

@Controller
@RequestMapping("/CEMS")
@SessionAttributes({ "user", "listContact" })
public class BoardController {

	private BoardDao boarddao;
	private Logger log = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	public BoardController(BoardDao boradDao) {
		this.boarddao = boradDao;
	}

	public String gongziEncoder() {
		String re_url = null;
		try {
			re_url = URLEncoder.encode("공지사항", "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return re_url;
	}

	public String boardEncoder() {
		String re_url = null;
		try {
			re_url = URLEncoder.encode("게시판", "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return re_url;
	}

	@RequestMapping("/공지사항")
	public String getAdminBoard(Model model) {
		List<BoardDto> boardlist;
		boardlist = boarddao.get_Admin_Board();
		model.addAttribute("boardlist", boardlist);
		return "공지사항";
	}

	@RequestMapping("/게시판")
	public String getUserBoard(Model model) {
		List<BoardDto> user_boardlist;
		user_boardlist = boarddao.get_User_Board();
		model.addAttribute("user_boardlist", user_boardlist);

		List<BoardDto> mark_boardlist;
		mark_boardlist = boarddao.get_Mark_Board();
		model.addAttribute("mark_boardlist", mark_boardlist);
		return "게시판";
	}

	@RequestMapping("/board_write{page}")
	public String writeBoard(@PathVariable int page, HttpSession session, RedirectAttributes rttr, Model model) {

		UserDto res = (UserDto) session.getAttribute("user");
		
		model.addAttribute("user", res);

		if (page == 1) {
			if (res == null || res.getAdmin() == 0) {
				rttr.addFlashAttribute("error", "글쓰기 권한이 없습니다");
				return "redirect:/CEMS/" + gongziEncoder();
			} else {
				return "공지_write";
			}
		} else {
			if (res == null) {
				rttr.addFlashAttribute("error", "회원만 이용 가능합니다.");
				return "redirect:/CEMS/loginpage";
			} else {
				return "공지_write";
			}
		}
	}
	
	@ResponseBody
	@RequestMapping("/board_insert")
	public int insertBoard(@ModelAttribute BoardDto boardDto, Model model, HttpSession session) {
	
		int cnt = 0;
		
		UserDto res = (UserDto) session.getAttribute("user");
		
		if(res == null) {
			return cnt;
		}else {
			if(res.getAdmin() == 1) {
				boardDto.setWriter(res.getUser_nickname());
				boardDto.setAdmin("1");
				cnt = boarddao.insert_Board(boardDto);
				return cnt;
			}else {
				boardDto.setWriter(res.getUser_nickname());
				boardDto.setAdmin("0");
				cnt = boarddao.insert_Board(boardDto);
				return cnt;
			}
		}
	}

	@ResponseBody
	@RequestMapping("/board_delete{board_id}")
	public int deleteBoard(@PathVariable int board_id, Model model, HttpSession session, RedirectAttributes rttr) {

		UserDto res = (UserDto) session.getAttribute("user");
		BoardDto board = boarddao.get_Board(board_id);
		int cnt = 0;
		if (res.getAdmin() == 1) {
			cnt = boarddao.delete_Board(board_id);
			return cnt;
		} else if (res.getUser_nickname().equals(board.getWriter())) {
			cnt = boarddao.delete_Board(board_id);
			return cnt;
		} else {
			return cnt;
		}
	}

	@RequestMapping("/board_update{board_id}")
	public String update_Board(@PathVariable int board_id, Model model, HttpSession session, RedirectAttributes rttr) {

		UserDto res = (UserDto) session.getAttribute("user");
		BoardDto detail = null;
		detail = boarddao.get_Board(board_id);
		if (res.getUser_nickname().equals(detail.getWriter())) {
			BoardDto modify = new BoardDto();
			modify.setTitle(detail.getTitle());
			modify.setContent(detail.getContent());
			modify.setBoard_id(detail.getBoard_id());
			model.addAttribute("modify", modify);
			return "공지_update";
		} else {
			rttr.addFlashAttribute("error", "본인 게시물만 수정 가능합니다.");
			return "redirect:/CEMS/board_" + board_id;
		}
	}
	
	@ResponseBody
	@RequestMapping("/update{board_id}")
	public int updateBoard(@ModelAttribute BoardDto boardDto, Model model, HttpSession session,
			RedirectAttributes rttr) {
		int cnt = 0;

		UserDto res = (UserDto) session.getAttribute("user");

		if (res == null) {
			return cnt;
		} else {
			cnt = boarddao.update_Board(boardDto);
			return cnt;
		}
	}


	@RequestMapping("/updatemark_{board_id}")
	public String updateMark(@PathVariable int board_id, Model model, HttpSession session, RedirectAttributes rttr) {
		UserDto res = (UserDto) session.getAttribute("user");

		if (res == null || res.getAdmin() == 0) {
			rttr.addFlashAttribute("error", "권한이 없습니다");
			return "redirect:/CEMS/" + gongziEncoder();
		} else {
			boarddao.update_Mark(board_id);
			return "redirect:/CEMS/" + gongziEncoder();
		}
	}

	@RequestMapping("/board_{board_id}")
	public String getBoard(@PathVariable int board_id, Model model, HttpSession session, RedirectAttributes rttr) {
		UserDto res = (UserDto)session.getAttribute("user");
		
		
		if(res == null) {
			rttr.addFlashAttribute("error", "잘못된 접근입니다.");
			return "redirect:/CEMS/loginpage";
		}else {
			BoardDto board = null;
			List<CommentDto> comment = boarddao.comment_list(board_id);

			boarddao.update_View(board_id);
			board = boarddao.get_Board(board_id);
			List<RecommentDto> recomment = boarddao.recomment_list(board_id);
			HashMap<String, Object> detail = new HashMap<String, Object>();
			detail.put("comments", comment);
			detail.put("recomments", recomment);
			detail.put("board", board);
			model.addAttribute("detail", detail);
			return "공지_detail";
		}
	}
	

	@ResponseBody
	@RequestMapping("/insert_Comment")
	public int insertComment(@ModelAttribute CommentDto comdto, Model model, HttpSession session) {
		UserDto res = (UserDto) session.getAttribute("user");
		log.info(comdto.toString());
		comdto.setWriter(res.getUser_nickname());
		int cnt = boarddao.insert_Comment(comdto);

		return cnt;
	}

	@ResponseBody
	@RequestMapping("/insert_Recomment")
	public int insertRecomment(@ModelAttribute RecommentDto recomdto, Model model, HttpSession session) {
		UserDto res = (UserDto) session.getAttribute("user");
		recomdto.setWriter(res.getUser_nickname());
		int cnt = boarddao.insert_Recomment(recomdto);

		return cnt;
	}
	
	
	@ResponseBody
	@RequestMapping("/delete_Comment{comment_id}")
	public int deleteComment(@PathVariable int comment_id, Model model) {
		int cnt = 0;
		cnt = boarddao.delete_Comment(comment_id);
		return cnt;
		
	}
	
	@ResponseBody
	@RequestMapping("/delete_Recomment{recomment_id}")
	public int deleteRecomment(@PathVariable int recomment_id, Model model) {
		int cnt = 0;
		cnt = boarddao.delete_Recomment(recomment_id);
		return cnt;
		
	}
	
	@RequestMapping("/랭킹")
	public String ranking(Model model) {
		UserDto res = (UserDto) model.getAttribute("user");
		
		List<LeaderDto> leaderlist = boarddao.getleaderBoard(res.getUser_id());
		log.info(leaderlist.toString());
		model.addAttribute("leaderlist", leaderlist);
		
		return "랭킹";
	}
	
	
	
}
