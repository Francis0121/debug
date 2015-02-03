package com.vrcs.debug.volume;

import com.vrcs.debug.data.Data;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 * Created by pi on 15. 2. 3.
 */
public class Volume {
    
    private Integer pn;
    
    private String name;
    
    private String url;

    private Data imageData;
    
    private Data volumeData;
    
    private Data videoData;
    
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

    public Data getImageData() {
        return imageData;
    }

    public void setImageData(Data imageData) {
        this.imageData = imageData;
    }

    public Data getVolumeData() {
        return volumeData;
    }

    public void setVolumeData(Data volumeData) {
        this.volumeData = volumeData;
    }

    public Data getVideoData() {
        return videoData;
    }

    public void setVideoData(Data videoData) {
        this.videoData = videoData;
    }


    @Override
    public String toString() {
        return "Volume{" +
                "pn=" + pn +
                ", name='" + name + '\'' +
                ", url='" + url + '\'' +
                ", imageData=" + imageData +
                ", volumeData=" + volumeData +
                ", videoData=" + videoData +
                ", image=" + image +
                ", video=" + video +
                ", volume=" + volume +
                '}';
    }
}
