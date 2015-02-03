package com.vrcs.debug.volume;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

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

    private CommonsMultipartFile image;
    
    private CommonsMultipartFile video;
    
    private CommonsMultipartFile volume;
    
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
    
    public CommonsMultipartFile getImage() {
        return image;
    }

    public void setImage(CommonsMultipartFile image) {
        this.image = image;
    }

    public CommonsMultipartFile getVideo() {
        return video;
    }

    public void setVideo(CommonsMultipartFile video) {
        this.video = video;
    }

    public CommonsMultipartFile getVolume() {
        return volume;
    }

    public void setVolume(CommonsMultipartFile volume) {
        this.volume = volume;
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
                ", image=" + image +
                ", video=" + video +
                ", volume=" + volume +
                '}';
    }
}
