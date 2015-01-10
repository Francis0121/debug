package com.vrcs.debug.access;

/**
 * Created by pi on 15. 1. 10.
 */
public interface AccessDao {

    public void insertUuid(Uuid uuid);

    public void insertStatistics(Statistics statistics);
}
