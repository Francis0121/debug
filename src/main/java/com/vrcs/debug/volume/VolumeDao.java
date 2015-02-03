package com.vrcs.debug.volume;

import java.util.List;

/**
 * Created by pi on 15. 2. 3.
 */
public interface VolumeDao {
    
    Integer insert(Volume volume);
    
    Integer update(Volume volume);
    
    Integer delete(Volume volume);
    
    Volume selectOne(Integer pn);
    
    List<Volume> selectList(VolumeFilter volumeFilter);

    void insertDataAndFile(Volume volume);
}
