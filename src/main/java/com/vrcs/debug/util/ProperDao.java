package com.vrcs.debug.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

/**
 * Created by pi on 15. 2. 3.
 */
@Repository
public class ProperDao {

    private @Value("${upload.fileUploadPath}") String fileUploadPath;

    public String getFileUploadPath() {
        return fileUploadPath;
    }
}
