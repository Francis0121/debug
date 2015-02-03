package com.vrcs.debug.admin;

import com.vrcs.debug.data.Data;
import com.vrcs.debug.data.DataDao;
import com.vrcs.debug.data.DataFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by pi on 15. 2. 3.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    
    private Logger logger = LoggerFactory.getLogger(AdminController.class);
    
    @Autowired
    private DataDao dataDao;

    @RequestMapping(value = "/data/list", method = RequestMethod.GET)
    public String dataList(Model model, @ModelAttribute DataFilter dataFilter){
        model.addAttribute("list", dataDao.selectList(dataFilter));
        return "admin/dataList";
    }
    
    @RequestMapping(value = "/data/pn/{pn}", method = RequestMethod.GET)
    public String dataOne(Model model, @PathVariable Integer pn){
        model.addAttribute("data", dataDao.selectOne(pn));
        return "admin/dataOne";
    }
    
    
    @RequestMapping(value = "/data", method = RequestMethod.GET)
    public String dataPage(@ModelAttribute Data data){
        logger.debug("Data page get");
        return "admin/data";
    }
    
    @RequestMapping(value = "/data", method = RequestMethod.POST)
    public String dataInsert(@ModelAttribute Data data){
        dataDao.insert(data);
        return "admin/data";
    }
    
    @RequestMapping(value = "/data", method = RequestMethod.PUT)
    public String dataUpdate(@ModelAttribute Data data){
        dataDao.update(data);
        return "admin/data";
    }
    
    @RequestMapping(value = "/data", method = RequestMethod.DELETE)
    public String dataDelete(@ModelAttribute Data data){
        dataDao.delete(data);
        return "admin/data";
    }
    
}
