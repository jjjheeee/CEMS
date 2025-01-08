package com.cems.application.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cems.application.dao.QuestionDao;
import com.cems.application.vo.MockboardDto;
import com.cems.application.vo.QuestionDto;
import com.cems.application.vo.ResultDto;
import com.cems.application.vo.UserDto;
@Controller
@RequestMapping("/CEMS")
@SessionAttributes({ "user", "listContact" })
public class QuestionController {
	// "( )에 들어갈 가장 알맞은 것을 고르십시오."
	// "저는 ( )에 갑니다. 공부를 합니다."
	// "1.약국 2.학교 3.여행사 4.편의점"
	// "2.학교"
	private QuestionDao quesdao;
	private Logger log = LoggerFactory.getLogger(QuestionController.class);

	@Autowired
	public QuestionController(QuestionDao quesdao) {
		this.quesdao = quesdao;
	}

	@RequestMapping("/연습문제")
	public String showQuestion(Model model) {
		UserDto res = (UserDto) model.getAttribute("user");
		List<QuestionDto> question;
		question = quesdao.getQuestion(res.getUser_id());
		model.addAttribute("user", res);
		model.addAttribute("Question", question);

		return "연습문제";
	}
	
	@RequestMapping("/듣기")
	public String listening(Model model) {
		UserDto res = (UserDto) model.getAttribute("user");
		List<QuestionDto> questionlist = quesdao.getListeningQuestion(res.getUser_id());
		model.addAttribute("user", res);
		model.addAttribute("Question", questionlist);
		return "연습문제";
	}


	@RequestMapping("/모의고사")
	public String getAllMockboard(Model model) {
		List<MockboardDto> mocklist = quesdao.getAllMockboard();
		model.addAttribute("mockboard", mocklist);

		return "모의고사";
	}

	@RequestMapping("/모의고사_do_{mockboard_id}")
	public String mockTest(Model model, @PathVariable int mockboard_id) {

		MockboardDto mockdto = quesdao.getMockboard(mockboard_id);
		UserDto res = (UserDto) model.getAttribute("user");
		List<QuestionDto> question;
		question = quesdao.getQuestion("user"); // 함수 따로만들어야 함.

		model.addAttribute("mockboard", mockdto);
		model.addAttribute("user", res);
		model.addAttribute("Question", question);
		return "모의고사문제";
	}

	@RequestMapping("/제출")
	public String insertResult(Model model, @ModelAttribute ResultDto resultlist) {
		List<ResultDto> result_list = resultlist.getResultList();
		log.info("controller"+result_list.toString());

		String user_id = result_list.get(0).getUser_id();

		int cnt = quesdao.insertResult(result_list);
		log.info(""+cnt);

		Map<String, String> result = quesdao.showResult(user_id, cnt);

		log.info(result.toString());
		model.addAttribute("result", result);

		return "결과";
	}

	// ============ 듣기 ===============

	
	// ============ ** topik2 쓰기 ===============
	@RequestMapping("/Topik2_쓰기")
	public String writeQuestion(Model model) {
		UserDto res = (UserDto) model.getAttribute("user");
		List<QuestionDto> question;
		question = quesdao.getQuestion(res.getUser_id());
		log.info(question.toString());
		model.addAttribute("user", res);
		model.addAttribute("Question", question);
		return "Topik2_쓰기연습";
	}

}
