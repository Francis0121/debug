package com.vrcs.debug.volume;

/**
 * Created by pi on 15. 2. 3.
 */
public class Volume {
    
    private Integer pn;
    
    private String name;
    
    private String url;
    
    private Integer imagePn;
    
    private Integer videoPn;
    
    private Integer volumePn;

    public Volume() {
    }

    public Integer getPn() {
        return pn;
    }

    public void setPn(Integer pn) {
        this.pn = pn;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getImagePn() {
        return imagePn;
    }

    public void setImagePn(Integer imagePn) {
        this.imagePn = imagePn;
    }

    public Integer getVideoPn() {
        return videoPn;
    }

    public void setVideoPn(Integer videoPn) {
        this.videoPn = videoPn;
    }

    public Integer getVolumePn() {
        return volumePn;
    }

    public void setVolumePn(Integer volumePn) {
        this.volumePn = volumePn;
    }


    @Override
    public String toString() {
        return "Volume{" +
                "pn=" + pn +
                ", name='" + name + '\'' +
                ", url='" + url + '\'' +
                ", imagePn=" + imagePn +
                ", videoPn=" + videoPn +
                ", volumePn=" + volumePn +
                '}';
    }
}
