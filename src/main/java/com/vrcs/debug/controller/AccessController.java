package com.vrcs.debug.controller;

import com.vrcs.debug.access.AccessDao;
import com.vrcs.debug.access.Statistics;
import com.vrcs.debug.access.Uuid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

/**
 * Created by pi on 15. 1. 10.
 */
@Controller
@RequestMapping("/access")
public class AccessController {

    private static Logger logger = LoggerFactory.getLogger(AccessController.class);

    @Autowired
    private AccessDao accessDao;

    @ResponseBody
    @RequestMapping(value = "/emit/pn/{pn}", method = RequestMethod.GET)
    public Uuid emit(@PathVariable Integer pn){
        Uuid uuid = new Uuid(UUID.randomUUID().toString(), pn);
        accessDao.insertUuid(uuid);
        logger.debug(uuid.toString());
        return uuid;
    }

    @ResponseBody
    @RequestMapping(value = "/statistics", method = RequestMethod.POST)
    public Integer statistics(@RequestBody Statistics statistics){
        accessDao.insertStatistics(statistics);
        return statistics.getPn();
    }
}
