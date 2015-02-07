package com.vrcs.debug.access;

import java.util.List;
import java.util.Map;

/**
 * Created by pi on 15. 1. 10.
 */
public interface AccessDao {

    void insertUuid(Uuid uuid);

    void insertStatistics(Statistics statistics);
    
    Map<String, Object> selectStatisticsGroup();

    List<Statistics> selectFpsChartData(StatisticsFilter statisticsFilter);
}
