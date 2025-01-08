package com.cems.application.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cems.application.dao.AdminDao;
import com.cems.application.vo.BoardDto;
import com.cems.application.vo.UserDto;

@Controller
@RequestMapping("/CEMS")
@SessionAttributes({ "user", "listContact" })
public class AdminController {
	private AdminDao admindao;
	private Logger log = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	public AdminController(AdminDao admindao) {
		this.admindao = admindao;
	}
	
	@RequestMapping("/admin")
	public String admin_dashboard(RedirectAttributes rttr, Model model) {
		UserDto res = (UserDto) model.getAttribute("user");
		List<UserDto> userlist = new ArrayList<>(); 
		userlist = admindao.adminUserpage();
		
		model.addAttribute("userlist", userlist);
		
		log.info(userlist.toString());

		if (res == null || res.getAdmin() == 0) {
			rttr.addFlashAttribute("error", "접근 권한이 없습니다");
			return "redirect:/CEMS/home";
		} else {
			return "admin-dashboard";
		}
	}
	
	@RequestMapping("/admin/{url}")
	public String adminMapping(@PathVariable("url") String option, Model model) {
		List<UserDto> userlist = new ArrayList<>(); 
		userlist = admindao.adminUserpage();
		model.addAttribute("userlist", userlist);

		List<BoardDto> boardList = new ArrayList<>();
		boardList = admindao.adminUserboard();
		model.addAttribute("boardlist", boardList);
		

		return option;
	}
	
	@RequestMapping("/adminDash")
	@ResponseBody
	public Map<String, Object> userCnt() {
		Map<String, Object> adminDashMap = new HashMap<>();
		adminDashMap = admindao.adminDash();
		log.info("============="+adminDashMap.toString());
		return adminDashMap;
	}
	
	@ResponseBody
	@RequestMapping("/userBan")
	public int updateBan(@ModelAttribute UserDto userdto, Model model) {
		int cnt = 0;
		
		log.info(userdto.toString());
		
		cnt = admindao.updateBan(userdto);
		
		return cnt;
	}
}
