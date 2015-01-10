package com.vrcs.debug;

import com.vrcs.debug.board.Board;
import com.vrcs.debug.board.BoardDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/")
public class HelloController {

	private static Logger logger = LoggerFactory.getLogger(HelloController.class);

	@Autowired
	private BoardDao boardDao;

	@RequestMapping(method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {

		logger.debug("debug???");

		model.addAttribute("message", "Hello world!");
		model.addAttribute("board", boardDao.getBoardOne());

		return "hello";
	}

	@ResponseBody
	@RequestMapping(value = "json", method = RequestMethod.POST)
	public String postJson(@RequestBody Board board){
		logger.debug("Json Test " + board);
		return "success";
	}

}