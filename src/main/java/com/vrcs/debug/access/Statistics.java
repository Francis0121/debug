package com.vrcs.debug.access;

/**
 * Created by pi on 15. 1. 10.
 */
public class Statistics {

    private Integer pn;

    private Uuid uuid;

    private String name;

    private String platform;

    private String version;

    private Integer versionNumber;

    private Boolean isMobile;

    private Integer frameCount;

    private String accessDate;

    public Statistics() {
    }

    public Integer getPn() {
        return pn;
    }

    public void setPn(Integer pn) {
        this.pn = pn;
    }

    public Uuid getUuid() {
        return uuid;
    }

    public void setUuid(Uuid uuid) {
        this.uuid = uuid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPlatform() {
        return platform;
    }

    public void setPlatform(String platform) {
        this.platform = platform;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public Integer getVersionNumber() {
        return versionNumber;
    }

    public void setVersionNumber(Integer versionNumber) {
        this.versionNumber = versionNumber;
    }

    public Boolean getIsMobile() {
        return isMobile;
    }

    public void setIsMobile(Boolean isMobile) {
        this.isMobile = isMobile;
    }

    public Integer getFrameCount() {
        return frameCount;
    }

    public void setFrameCount(Integer frameCount) {
        this.frameCount = frameCount;
    }

    public String getAccessDate() {
        return accessDate;
    }

    public void setAccessDate(String accessDate) {
        this.accessDate = accessDate;
    }

    @Override
    public String toString() {
        return "Statistics{" +
                "pn=" + pn +
                ", uuid=" + uuid +
                ", name='" + name + '\'' +
                ", platform='" + platform + '\'' +
                ", version='" + version + '\'' +
                ", versionNumber=" + versionNumber +
                ", isMobile=" + isMobile +
                ", frameCount=" + frameCount +
                ", accessDate='" + accessDate + '\'' +
                '}';
    }
}
