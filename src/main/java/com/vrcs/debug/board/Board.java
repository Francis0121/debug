package com.vrcs.debug.board;

/**
 * Created by pi on 15. 1. 9.
 */
public class Board {

    private Integer pn;

    private String content;

    public Integer getPn() {
        return pn;
    }

    public String getContent() {
        return content;
    }

    public void setPn(Integer pn) {
        this.pn = pn;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Board{" +
                "pn=" + pn +
                ", content='" + content + '\'' +
                '}';
    }
}

