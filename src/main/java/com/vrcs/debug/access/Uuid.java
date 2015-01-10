package com.vrcs.debug.access;

/**
 * Created by pi on 15. 1. 10.
 */
public class Uuid {

    private Integer pn;

    private String uuid;

    public Uuid() {
    }

    public Uuid(String uuid) {
        this.uuid = uuid;
    }

    public Integer getPn() {
        return pn;
    }

    public void setPn(Integer pn) {
        this.pn = pn;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    @Override
    public String toString() {
        return "Uuid{" +
                "pn=" + pn +
                ", uuid='" + uuid + '\'' +
                '}';
    }
}
