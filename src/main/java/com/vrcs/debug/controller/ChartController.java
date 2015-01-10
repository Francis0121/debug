package com.vrcs.debug.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by pi on 15. 1. 10.
 */
@Controller
@RequestMapping("/chart")
public class ChartController {

    private static Logger logger = LoggerFactory.getLogger(ChartController.class);

    @RequestMapping(method = RequestMethod.GET)
    public String getChart(Model model){
        model.addAttribute("isChart", true);
        return "chart";
    }

}
