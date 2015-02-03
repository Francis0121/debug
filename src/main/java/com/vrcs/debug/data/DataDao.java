package com.vrcs.debug.data;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.util.List;

/**
 * Created by pi on 15. 2. 3.
 */
public interface DataDao {

    ///////////////////
    // Basic CRUD
    ///////////////////
    
    Integer insert(Data data);
    
    Integer update(Data data);
    
    Integer delete(Data data);
    
    Data selectOne(Integer pn);
    
    List<Data> selectList(DataFilter dataFilter);

    ///////////////////
    // Implement
    ///////////////////
    
    String transferFile(CommonsMultipartFile upload, String ... paths);
    
    String getFreeFilePath(String ... paths);
}
