package com.cems.application.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cems.application.dao.BoardDao;
import com.cems.application.dao.CEMSdao;
import com.cems.application.dao.StatisticsDao;
import com.cems.application.exception.IDNullException;
import com.cems.application.exception.PWNullException;
import com.cems.application.vo.StatisticsDto;
import com.cems.application.vo.UserDto;

@Controller
@RequestMapping("/CEMS")
@SessionAttributes({ "user", "listContact" }) // model 정보를 세션에 저장
public class CEMSController {
	private CEMSdao dao;
	private StatisticsDao dao1;

	// @Autowired
	// private JWTService jwtService;

	private Logger log = LoggerFactory.getLogger(CEMSController.class);

	@Autowired
	public CEMSController(CEMSdao dao, StatisticsDao dao1) {
		this.dao = dao;
		this.dao1 = dao1;
	}

	@RequestMapping("/home")
	public String home(Model model) {
		UserDto res = (UserDto) model.getAttribute("user");
		List<StatisticsDto> cntlist = new ArrayList<>();
		if (res == null) {
			cntlist =  dao1.totalQuestion("");						
		}else {
			cntlist =  dao1.totalQuestion(res.getUser_id());			
		}
		model.addAttribute("cntlist", cntlist);

		return "index";
	}

	@RequestMapping("/loginpage")
	public String loginpage() {
		return "sign-in";
	}

	@RequestMapping("/signuppage")
	public String signuppage() {
		return "sign-up";
	}

	@RequestMapping("/logoutpage")
	public String logoutpage() {
		return "logout";
	}


	@RequestMapping("/TOPIKI")
	public String topiki() {
		return "studytopiki";
	}

	@RequestMapping("/TOPIKII")
	public String topikii() {
		return "studytopikii";
	}

	@RequestMapping("/faq")
	public String faq() {
		return "faq";
	}

	
	@RequestMapping("/about")
	public String about() {
		return "about";
	}

	@RequestMapping("/login")
	public String login(@ModelAttribute UserDto userDto, RedirectAttributes rttr, Model model) {
		UserDto res = null;
		log.info(userDto.toString());

		try {
			res = dao.login(userDto);
		} catch (IDNullException e) {
			rttr.addFlashAttribute("inputerror", "IDNullPointerExcpetion");
			log.info("IDNullPointerException");
		} catch (PWNullException e) {
			rttr.addFlashAttribute("inputerror", "PWNullPointerException");
			log.info("PWNullPointerException");
		}

		if (res != null) {
			log.info("login 성공");
			log.info(res.toString());
			rttr.addFlashAttribute("success", "로그인 성공 !");
			model.addAttribute("user", res);
			return "redirect:/CEMS/home";
		} else {
			log.info("로그인 실패");
			rttr.addFlashAttribute("error", "아이디(로그인 전용 아이디) 또는 비밀번호를 잘못 입력했습니다./입력하신 내용을 다시 확인해주세요.");
			return "redirect:/CEMS/loginpage";
		}
	}

	@RequestMapping("/logout")
	public String logout(SessionStatus status) {
		if (!status.isComplete()) {
			status.setComplete();
		}
		return "redirect:/CEMS/logoutpage";
	}

	@RequestMapping("/signup")
	public String signup(@ModelAttribute UserDto userDto, RedirectAttributes rttr, Model model) {
		try {
			dao.signup(userDto);
		} catch (Exception e) {
			log.info("==> 회원가입 중 오류 발생");
			log.info(userDto.toString());
			rttr.addFlashAttribute("error", "회원가입을 다시 시도해주세요");
			return "redirect:/CEMS/signuppage";
		}
		log.info("==> 회원가입 성공 ID:" + userDto.getUser_id());
		rttr.addFlashAttribute("success", userDto.getUser_id());
		return "redirect:/CEMS/loginpage";
	}

	@RequestMapping("/find")
	public String find() {
		return "forgot-password";
	}

	@RequestMapping("/find_place")
	public void findp() {

	}

	@PostMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam String id) {
		int cnt = dao.idCheck(id);
		return cnt;
	}
	

	@PostMapping("/pwCheck")
	@ResponseBody
	public int pwCheck(@RequestParam String pw) {
		int cnt = dao.pwCheck(pw);
		return cnt;
	}
	
	@RequestMapping("/nickname_check")
	@ResponseBody
	public int nicknameCheck(@RequestParam String user_nickname) {
		int cnt = dao.nicknameCheck(user_nickname);
		return cnt;
	}
	


	@RequestMapping("/dashboard")
	public String dashboard(Model model) {
		
		UserDto res = (UserDto) model.getAttribute("user");
		
		if(res == null) {
			return "redirect:/CEMS/loginpage";
		}else {
			return "dashboard-main";
		}
	}


	@RequestMapping("/dashboard/{url}")
	public String dashboard(@PathVariable String url, Model model) {
		
		UserDto res = (UserDto) model.getAttribute("user");
		
		List<StatisticsDto> list =  dao1.correctRatio(res.getUser_id());
		
		model.addAttribute("Ratio", list);
		return "dashboard/" + url;
	}

	@RequestMapping("/deleteuser")
	public String deleteuser(RedirectAttributes rttr, Model model) {
		try {
			UserDto res = (UserDto) model.getAttribute("user");
			dao.deleteUser(res.getUser_id());
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/CEMS/dashboard";
		}
		return "redirect:/CEMS/logout";
	}

	@PostMapping("/update/{option}")
	public String editUser(@PathVariable(value = "option") String option, @ModelAttribute UserDto userDto,
			Model model) {
		log.info(option);
		log.info(userDto.toString());
		dao.editUser(option, userDto);
		
		return "redirect:/CEMS/logout";
	}
	
	@PostMapping("/forgotpw")
	public String forgotPw(@ModelAttribute UserDto userDto) {
		
		dao.editUser("updatepw", userDto);
		
		return "redirect:/CEMS/loginpage";
		
	}

}
