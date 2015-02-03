package com.vrcs.debug.data;

import com.vrcs.debug.util.Pagination;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by pi on 15. 2. 3.
 */
@Service
public class DataDaoImpl extends SqlSessionDaoSupport implements DataDao{

    private Logger logger = LoggerFactory.getLogger(DataDaoImpl.class);

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
