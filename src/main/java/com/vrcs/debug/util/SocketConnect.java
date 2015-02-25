package com.vrcs.debug.util;

import com.vrcs.debug.util.ProperDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.util.concurrent.TimeUnit;

/**
 * Created by pi on 15. 2. 14.
 */
@Component
public class SocketConnect {

    @Autowired
    private ProperDao properDao;

    public Boolean connection() {

        boolean portAvailable = false;
        
        try {
            final Socket socket = new Socket();
            final int timeOut = (int) TimeUnit.SECONDS.toMillis(2);
            socket.connect(new InetSocketAddress(properDao.getSocketAddress(), properDao.getSocketPort()), timeOut);
            portAvailable = socket.isConnected();
            socket.close();
        } catch (IOException e) {
            e.printStackTrace();
            return portAvailable;
        }
        
        return portAvailable;
    }
}
