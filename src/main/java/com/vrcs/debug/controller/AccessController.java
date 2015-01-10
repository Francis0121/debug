package com.vrcs.debug.controller;

import com.vrcs.debug.access.AccessDao;
import com.vrcs.debug.access.Statistics;
import com.vrcs.debug.access.Uuid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.UUID;

/**
 * Created by pi on 15. 1. 10.
 */
@Controller
@RequestMapping("/access")
public class AccessController {

    @Autowired
    private AccessDao accessDao;

    @ResponseBody
    @RequestMapping(value = "/emit", method = RequestMethod.GET)
    public Uuid emit(){
        Uuid uuid = new Uuid(UUID.randomUUID().toString());
        accessDao.insertUuid(uuid);
        return uuid;
    }

    @ResponseBody
    @RequestMapping(value = "/statistics", method = RequestMethod.GET)
    public Integer statistics(@RequestBody Statistics statistics){
        accessDao.insertStatistics(statistics);
        return statistics.getPn();
    }
}
