package com.vrcs.debug.controller;

import com.vrcs.debug.access.AccessDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by pi on 15. 1. 10.
 */
@Controller
@RequestMapping("/access")
public class AccessController {

    @Autowired
    private AccessDao accessDao;

}
