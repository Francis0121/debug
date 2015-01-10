package com.vrcs.debug.access;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

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
}
