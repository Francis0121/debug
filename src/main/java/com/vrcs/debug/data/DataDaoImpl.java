package com.vrcs.debug.data;

import com.vrcs.debug.util.Pagination;
import com.vrcs.debug.util.ProperDao;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Created by pi on 15. 2. 3.
 */
@Service
public class DataDaoImpl extends SqlSessionDaoSupport implements DataDao{

    private Logger logger = LoggerFactory.getLogger(DataDaoImpl.class);

    @Autowired
    private ProperDao properDao;
    
    public String getFreeFilePath(String ... paths) {
        String path = properDao.getFileUploadPath() + "/";

        for (int i = 0; i < paths.length; ++i) {
            path += paths[i] + "/";
        }

        String randomPath = null;
        while (randomPath == null) {
            UUID randomUUID = UUID.randomUUID();
            File testPath = new File(path + randomUUID);
            if (testPath.exists() == false) {
                randomPath = testPath.getPath();

                testPath = new File(path);
                if (testPath.exists() == false) {
                    testPath.mkdirs();
                }
            }
        }
        return randomPath;
    }

    public String transferFile(CommonsMultipartFile upload, String ... paths) {
        String filePath = getFreeFilePath(paths);

        File dest = new File(filePath);
        try {
            upload.transferTo(dest);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return filePath;
    }
    
    ///////////////////
    // Basic CRUD
    ///////////////////
    
    @Override
    public Integer insert(Data data) {
        return getSqlSession().insert("data.insert");
    }

    @Override
    public Integer update(Data data) {
        return getSqlSession().update("data.update");
    }

    @Override
    public Integer delete(Data data) {
        return getSqlSession().delete("data.delete");
    }

    @Override
    public Data selectOne(Integer pn) {
        return getSqlSession().selectOne("data.one");
    }

    @Override
    public List<Data> selectList(DataFilter dataFilter) {
        Pagination pagination = dataFilter.getPagination();
        Integer count = selectCount(dataFilter);
        pagination.setNumItems(count);
        if(count.equals(0)){
            return new ArrayList<Data>();
        }
        
        return getSqlSession().selectList("data.list", dataFilter);
    }

    private Integer selectCount(DataFilter dataFilter) {
        return getSqlSession().selectOne("data.count", dataFilter);
    }
}
