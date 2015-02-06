package com.vrcs.debug.access;

/**
 * Created by pi on 15. 1. 10.
 */
public class Uuid {

    private Integer pn;

    private String uuid;

    private Integer volumePn;
    
    public Uuid() {
    }

    public Uuid(String uuid, Integer volumePn) {
        this.uuid = uuid;
        this.volumePn = volumePn;
    }

    public Integer getVolumePn() {
        return volumePn;
    }

    public void setVolumePn(Integer volumePn) {
        this.volumePn = volumePn;
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
                ", volumePn=" + volumePn +
                '}';
    }
}
