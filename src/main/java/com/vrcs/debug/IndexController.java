package com.vrcs.debug;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class IndexController {

	private static Logger logger = LoggerFactory.getLogger(IndexController.class);

	@RequestMapping(method = RequestMethod.GET)
	public String indexPage(Model model){

		return "index";
	}
	
	@RequestMapping(value = "getStarted", method = RequestMethod.GET)
	public String getStartedPage(Model model){
		return "getStarted";
	}
	
	@RequestMapping(value = "document", method = RequestMethod.GET)
	public String documentPage(Model model){
		return "document";
	}

}