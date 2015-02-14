package com.vrcs.debug.controller;

import com.vrcs.debug.volume.Volume;
import com.vrcs.debug.volume.VolumeDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by pi on 15. 2. 3.
 */
@Controller
@PreAuthorize("hasRole('ROLE_ADMIN')")
@RequestMapping("/admin")
public class AdminController {
    
    private Logger logger = LoggerFactory.getLogger(AdminController.class);

    @Autowired
    private VolumeDao volumeDao;
    
    @RequestMapping(value = "/volume", method = RequestMethod.GET)
    public String volumePage(@ModelAttribute Volume volume){
        return "admin/volume";
    }

    @RequestMapping(value = "/volume", method = RequestMethod.POST)
    public String volumePost(@ModelAttribute Volume volume){
        logger.debug(volume.toString());
        
        volumeDao.insertDataAndFile(volume);
        
        return "redirect:/admin/volume";
    }

    
}
