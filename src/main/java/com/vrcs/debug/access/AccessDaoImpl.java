package com.vrcs.debug.access;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by pi on 15. 1. 10.
 */
@Repository
public class AccessDaoImpl extends SqlSessionDaoSupport implements AccessDao{

    @Override
    public void insertUuid(Uuid uuid) {
        getSqlSession().insert("access.insertUuid", uuid);
    }

    @Override
    public void insertStatistics(Statistics statistics) {
        getSqlSession().insert("access.insertStatistics", statistics);
    }

    /**
     * Database로 부터 select 조건 가져옴
     * @return
     * name,
     * platform,
     * versionNumber
     */
    @Override
    public Map<String, Object> selectStatisticsGroup() {
        Map<String, Object> model = new HashMap<String, Object>();
        
        List<StatisticsFilter> groups = getSqlSession().selectList("access.selectStatisticGroup");
        
        List<String> names = new ArrayList<String>();
        
        Map<String, List<String>> platformMap = new HashMap<String, List<String>>();

        Map<String, Map<String, List<Integer>>> versionNumberMap = new HashMap<String, Map<String, List<Integer>>>();
        
        for(StatisticsFilter group : groups){
            String name = group.getName();
            String platform =  group.getPlatform();
            Integer versionNumber = group.getVersionNumber();
            
            if(!names.contains(name)){
                names.add(name);
                
                List<String> platforms = new ArrayList<String>();
                platforms.add(platform);
                platformMap.put(name, platforms);

                Map<String, List<Integer>> versionNumberSubMap = new HashMap<String, List<Integer>>();
                List<Integer> versionNumbers = new ArrayList<Integer>();
                versionNumbers.add(versionNumber);
                versionNumberSubMap.put(platform, versionNumbers);
                versionNumberMap.put(name, versionNumberSubMap);
            }else{
                
                List<String> platforms = platformMap.get(name);
                
                if(!platforms.contains(platform)){
                    platforms.add(platform);
                    platformMap.put(name, platforms);


                    Map<String, List<Integer>> versionNumberSubMap = versionNumberMap.get(name);
                    List<Integer> versionNumbers = new ArrayList<Integer>();
                    versionNumbers.add(versionNumber);
                    versionNumberSubMap.put(platform, versionNumbers);
                    versionNumberMap.put(name, versionNumberSubMap);
                }else{

                    Map<String, List<Integer>> versionNumberSubMap = versionNumberMap.get(name);
                    List<Integer> versionNumbers = versionNumberSubMap.get(platform);
                    
                    if(!versionNumbers.contains(versionNumber)){
                        versionNumbers.add(versionNumber);
                        versionNumberSubMap.put(platform, versionNumbers);
                        versionNumberMap.put(name, versionNumberSubMap);
                    }
                }
                
            }
            
        }
        
        model.put("names", names);
        model.put("platformMap", platformMap);
        model.put("versionNumberMap", versionNumberMap);
        model.put("statisticsFilter", groups.size() > 0 ? groups.get(0) : new StatisticsFilter());
        
        return model;
    }


}
