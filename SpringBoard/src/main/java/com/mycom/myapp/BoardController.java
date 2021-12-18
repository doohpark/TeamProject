package com.mycom.myapp;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	
	
	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public String boardList(Model model) {
		model.addAttribute("list", boardService.getBoardList());
		return "/board/list";
	}
	@RequestMapping(value ="/board/listUser", method=RequestMethod.GET)
	public String boardList2(Model model) {
		model.addAttribute("listUser", boardService.getBoardList());
		return "/board/listUser";
	}
	
	@RequestMapping(value = "/board/add", method = RequestMethod.GET)
	public String addPost() {
		return "/board/addpostform";
	}
	
	@RequestMapping(value = "/board/addok", method = RequestMethod.POST)
	public String addPostOK(BoardVO vo) {
		int i =  boardService.insertBoard(vo);
		if(i==0) System.out.println("�߰� ���� ");
		else System.out.println("�߰� ����!");
		return "redirect:list";
	}
	@RequestMapping(value = "/board/editform/{id}", method = RequestMethod.GET)
	public String editPost(@PathVariable("id") int id, Model model) {
		BoardVO boardVO = boardService.getBoard(id);
		model.addAttribute("boardVO", boardVO);
		return "/board/editform";
	
	}
	
	@RequestMapping(value = "/board/keyword/{keyword}", method = RequestMethod.GET)
	public String keywordList(@PathVariable("keyword") String keyword, Model model) {
		model.addAttribute("list", boardService.getBoardList(keyword));
		return "/board/keyword";
	}
	
	@RequestMapping(value = "/board/editok", method = RequestMethod.POST)
	public String editPostOK(BoardVO vo) {
		int i = boardService.updateBoard(vo);
		if(i==0)
			System.out.println("���� ����");
		else
			System.out.println("���� �Ϸ�!!!");
		return "redirect:list";
	}
	
	
	
	@RequestMapping(value = "/board/deleteok/{id}", method = RequestMethod.GET)
	public String deletePost(@PathVariable("id") int id) {
		int i = boardService.deleteBoard(id);
		if(i==0)
			System.out.println("���� ����");
		else
			System.out.println("���� ����!!!");
		return "redirect:../list";
	}
}
