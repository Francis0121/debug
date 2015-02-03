package com.vrcs.debug.data;

/**
 * Created by pi on 15. 2. 3.
 */
public class Data {
    
    private Integer pn;
    
    private Integer type;
    
    private String originalName;
    
    private String savePath;
    
    private String contentType;
    
    private String inputDate;

    public Data() {
    }

    public Integer getPn() {
        return pn;
    }

    public void setPn(Integer pn) {
        this.pn = pn;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getOriginalName() {
        return originalName;
    }

    public void setOriginalName(String originalName) {
        this.originalName = originalName;
    }

    public String getSavePath() {
        return savePath;
    }

    public void setSavePath(String savePath) {
        this.savePath = savePath;
    }

    public String getContentType() {
        return contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    public String getInputDate() {
        return inputDate;
    }

    public void setInputDate(String inputDate) {
        this.inputDate = inputDate;
    }

    @Override
    public String toString() {
        return "Data{" +
                "pn=" + pn +
                ", type=" + type +
                ", originalName='" + originalName + '\'' +
                ", savePath='" + savePath + '\'' +
                ", contentType='" + contentType + '\'' +
                ", inputDate='" + inputDate + '\'' +
                '}';
    }
}
