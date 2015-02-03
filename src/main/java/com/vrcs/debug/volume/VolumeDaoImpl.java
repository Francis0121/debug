package com.vrcs.debug.volume;

import com.vrcs.debug.data.Data;
import com.vrcs.debug.data.DataDao;
import com.vrcs.debug.data.DataType;
import com.vrcs.debug.util.Pagination;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by pi on 15. 2. 3.
 */
@Repository
public class VolumeDaoImpl extends SqlSessionDaoSupport implements VolumeDao{
    
    private static Logger logger = LoggerFactory.getLogger(VolumeDaoImpl.class);

    @Autowired
    private DataDao dataDao;
    
    /////////////////////
    //  Basic CRUD
    /////////////////////

    @Override
    public Integer insert(Volume volume) {
        return getSqlSession().insert("volume.insert", volume);
    }

    @Override
    public Integer update(Volume volume) {
        return getSqlSession().update("volume.update", volume);
    }

    @Override
    public Integer delete(Volume volume) {
        return getSqlSession().delete("volume.delete", volume);
    }

    @Override
    public Volume selectOne(Integer pn) {
        return getSqlSession().selectOne("volume.one", pn);
    }

    @Override
    public List<Volume> selectList(VolumeFilter volumeFilter) {
        Pagination pagination = volumeFilter.getPagination();
        Integer count = selectCount(volumeFilter);
        pagination.setNumItems(count);
        if(count.equals(0)){
            return new ArrayList<Volume>();
        }
        
        return getSqlSession().selectList("volume.list", volumeFilter);
    }

    private Integer selectCount(VolumeFilter volumeFilter) {
        return getSqlSession().selectOne("volume.count", volumeFilter);
    }

    /////////////////////
    //  Implement
    /////////////////////

    @Override
    public void insertDataAndFile(Volume volume) {

        if(volume.getImage() != null){
            CommonsMultipartFile file = volume.getImage();
            String savePath = dataDao.transferFile(file, "image");
            Data data = new Data(DataType.IMAGE.getValue(), file.getOriginalFilename(), savePath, file.getContentType());
            dataDao.insert(data);
            volume.setImageData(data);
        }

        if(volume.getVideo() != null){
            CommonsMultipartFile file = volume.getVideo();
            String savePath = dataDao.transferFile(file, "video");
            Data data = new Data(DataType.VIDEO.getValue(), file.getOriginalFilename(), savePath, file.getContentType());
            dataDao.insert(data);
            volume.setVideoData(data);
        }

        if(volume.getVolume() != null){
            CommonsMultipartFile file = volume.getVolume();
            String savePath = dataDao.transferFile(file, "volume");
            Data data = new Data(DataType.VOLUME.getValue(), file.getOriginalFilename(), savePath, file.getContentType());
            dataDao.insert(data);
            volume.setVolumeData(data);
        }
        
        logger.debug(volume.toString());
        
        insert(volume);
    }

    @Override
    public List<Volume> selectListInfo() {

        List<Volume> volumes = getSqlSession().selectList("volume.listInfo");
        
        return volumes;
    }
}
