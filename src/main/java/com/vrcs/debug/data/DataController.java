package com.vrcs.debug.data;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 * Created by pi on 15. 2. 3.
 */
@Controller
@RequestMapping("/data")
public class DataController {
    
    private static Logger logger = LoggerFactory.getLogger(DataController.class);

    @Autowired
    private DataDao dataDao;
    
    @RequestMapping(value = "/image/{imagePn}", method = RequestMethod.GET)
    public void image(@PathVariable(value = "imagePn") Integer imagePn, HttpServletResponse response) {
        try {
            Data data = dataDao.selectOne(imagePn);
            File snapshotFile = new File (data.getSavePath());
            InputStream is = new FileInputStream(snapshotFile);
            
            response.setHeader("Content-Disposition", "attachment; filename="+data.getOriginalName());
            FileCopyUtils.copy(is, response.getOutputStream());
            response.flushBuffer();
        } catch (IOException e) {
            logger.error(e.getMessage());
            throw new RuntimeException(e);
        }
    }

    @RequestMapping(value = "/volume/{volumePn}", method = RequestMethod.GET)
    public void volumeData(@PathVariable(value = "volumePn") Integer volumePn, HttpServletResponse response) {
        try {
            Data data = dataDao.selectOne(volumePn);
            File snapshotFile = new File (data.getSavePath());
            InputStream is = new FileInputStream(snapshotFile);

            response.setHeader("Content-Disposition", "attachment; filename="+data.getOriginalName());
            FileCopyUtils.copy(is, response.getOutputStream());
            response.flushBuffer();
        } catch (IOException e) {
            logger.error(e.getMessage());
            throw new RuntimeException(e);
        }
    }
}
