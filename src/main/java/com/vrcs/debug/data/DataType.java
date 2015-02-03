package com.vrcs.debug.data;

/**
 * Created by pi on 15. 2. 3.
 */
public enum DataType {
    
    VOLUME(1), IMAGE(2);
    
    int value;

    DataType(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }
    
}
