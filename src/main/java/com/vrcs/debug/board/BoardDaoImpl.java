package com.vrcs.debug.board;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

/**
 * Created by pi on 15. 1. 9.
 */
@Repository
public class BoardDaoImpl extends SqlSessionDaoSupport implements BoardDao {

    @Override
    public Board getBoardOne() {
        return getSqlSession().selectOne("getBoardOne");
    }

}
