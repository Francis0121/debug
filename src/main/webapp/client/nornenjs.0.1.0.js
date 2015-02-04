var ENUMS = {
    STREAM_TYPE: {
        START: 1,
        FINISH: 2,
        EVENT: 3
    },
    
    RENDERING_TYPE : {
        VOLUME : 1,
        MIP : 2,
        MRI : 3
    },

    MRI_TYPE : {
        X : 1,
        Y : 2,
        Z : 3
    }
};

var STATIC = {
    MRI_DEFAULT_OPTION : {
        rotationX : 0,
        rotationY : 0,
        positionZ : 3.0
    }
};

/**
 *  Need Socket.io client link, Binary.js link
 */
var Nornenjs = function(host, socketIoPort, streamPort, selector){
    
    this.host = host; // host
    this.socketIoPort = socketIoPort; // socket.io port
    this.streamPort = streamPort; // streming port
    
    this.selector = selector == undefined ? 'view_canvas' : selector;
    
    // ~ socket
    this.socket = null;
    this.socketOption = { reconnection : false };
    this.isConnect = false;
    
    // ~ stream
    this.client = null;
    this.buffer = null;
    this.sendOption = {
        streamType : ENUMS.STREAM_TYPE.START,
        renderingType : ENUMS.RENDERING_TYPE.VOLUME,
        volumePn : 1,
        brightness : 1.0,
        positionZ : 3.0,
        transferOffset : 0.0,
        rotationX : 0,
        rotationY : 0,
        transferScaleX : 0.0,
        transferScaleY : 0.0,
        transferScaleZ : 0.0,
        mriType : ENUMS.MRI_TYPE.X,
        isMobile : isMobile.any() ? 1 : 0
    };
    this.sendOptionSize = null;
    
    // ~ event
    this.mouse = {
        isOn : false,
        beforeX : null,
        beforeY : null
    };
    
    this.touch = { 
        isOn : false, 
        beforeX : null,
        beforeY : null,
    };
    
};

/**
 * Connect socket.io and Binaryjs
 */
Nornenjs.prototype.connect = function(){
    // ~ set socket.io
    var socketUrl = 'http://' + this.host + ':' + this.socketIoPort;
    this.socket = io.connect(socketUrl, this.socketOption);

    // ~ set canvas
    var canvas = document.getElementById(this.selector),
        width = canvas.clientWidth;
    
    canvas.width = width;
    canvas.height = width;
    
    // TODO draw loading
    
    // ~ set stream
    var streamUrl = 'ws://' + this.host + ':' + this.streamPort;
    this.client = new BinaryClient(streamUrl);

    // ~ run
    this.socketIo();
    
    this.streamOn();
    
    this.addEvent();
};

/**
 * Connected confirm user : User access deny
 */
Nornenjs.prototype.socketIo = function(){
    var $this = this;
    
    this.socket.emit('join');

    this.socket.on('message', function(data){
        if(!data.success){
            return;
        }
        $this.sendOption.streamType = ENUMS.STREAM_TYPE.START;
        $this.isConnect = true;
        $this.send();
    });

    this.socket.on('disconnected', function(data){
        $this.socket.emit('join');
    });
};

/**
 * Connect binaryjs
 */
Nornenjs.prototype.streamOn = function(){
    var $this = this;
    
    this.client.on('stream', function(stream, meta){

        var parts = [];

        stream.on('data', function(data){
            parts.push(data);
        });

        stream.on('end', function(){
            var url = (window.URL || window.webkitURL).createObjectURL(new Blob(parts));
            var canvas = document.getElementById($this.selector);
            var ctx = canvas.getContext('2d');

            var img = new Image(512, 512);
            img.onload = function(){
                ctx.drawImage(img, 0, 0, 512, 512, 0, 0, canvas.clientWidth, canvas.clientWidth);
            };
            img.src = url;
        });
    });
};

/**
 * Make buffer and send;
 */
Nornenjs.prototype.send = function(){
    
    this.buffer = new ArrayBuffer(52);
    var floatArray = new Float32Array(this.buffer);

    floatArray[0] = this.sendOption.streamType;
    floatArray[1] = this.sendOption.volumePn;
    floatArray[2] = this.sendOption.renderingType;
    floatArray[3] = this.sendOption.brightness;
    floatArray[4] = this.sendOption.positionZ;
    floatArray[5] = this.sendOption.transferOffset;
    floatArray[6] = this.sendOption.rotationX;
    floatArray[7] = this.sendOption.rotationY;
    floatArray[8] = this.sendOption.transferScaleX;
    floatArray[9] = this.sendOption.transferScaleY;
    floatArray[10] = this.sendOption.transferScaleZ;
    floatArray[11] = this.sendOption.mriType;
    floatArray[12] = this.sendOption.isMobile;

    this.client.send(this.buffer);
};

Nornenjs.prototype.finish = function($this){
    $this.sendOption.streamType = ENUMS.STREAM_TYPE.FINISH;
    $this.send();
};

Nornenjs.prototype.addEvent = function(){

    if(isMobile.any()){
        this.touchEvent();
    }else{
        this.mouseEvent();
    }

    this.resize();
};

Nornenjs.prototype.touchEvent = function(){
    var $this = this;
    var el = document.getElementById($this.selector);

    el.addEventListener('touchstart', function(evt){
        evt.preventDefault();
        var touches = evt.changedTouches;

        if(touches.length == 1){
            $this.touch.isOn = true;
            $this.touch.beforeX = touches[0].pageX;
            $this.touch.beforeY = touches[0].pageY;
        }

    });

    el.addEventListener('touchmove', function(evt){
        evt.preventDefault();
        var touches = evt.changedTouches;

        if($this.touch.isOn){
            $this.sendOption.streamType = ENUMS.STREAM_TYPE.EVENT;

            $this.sendOption.rotationX += (touches[0].pageX - $this.touch.beforeX)/10.0;
            $this.sendOption.rotationY += (touches[0].pageY - $this.touch.beforeY)/10.0;

            $this.touch.beforeX = touches[0].pageX;
            $this.touch.beforeY = touches[0].pageY;
            
            $this.send();
        }

    });

    el.addEventListener('touchend', function(evt){
        evt.preventDefault();
        $this.touch.isOn = false;
        setTimeout($this.finish, 1000, $this);
    });

    el.addEventListener('touchcancel', function handleCancel(evt) {
        evt.preventDefault();
        $this.touch.isOn = false;
        setTimeout($this.finish, 1000, $this);
    });

    el.addEventListener('touchleave', function(evt){
        evt.preventDefault();
        $this.touch.isOn = false;
        setTimeout($this.finish, 1000, $this);
    });
    
};

Nornenjs.prototype.mouseEvent = function(){

    var $this = this;
    var el = document.getElementById($this.selector);

    el.addEventListener('mousedown', function(evt){
        evt.preventDefault();

        $this.mouse.isOn = true;
        $this.mouse.beforeX = evt.pageX;
        $this.mouse.beforeY = evt.pageY;

    });

    el.addEventListener('mousemove', function(evt){
        evt.preventDefault();

        if($this.mouse.isOn){
            $this.sendOption.streamType = ENUMS.STREAM_TYPE.EVENT;

            $this.sendOption.rotationX += (evt.pageX - $this.mouse.beforeX)/5.0;
            $this.sendOption.rotationY += (evt.pageY - $this.mouse.beforeY)/5.0;
            
            $this.mouse.beforeX = evt.pageX;
            $this.mouse.beforeY = evt.pageY;

            $this.send();
        }

    });

    document.addEventListener('mouseup', function(evt){
        evt.preventDefault();
        $this.mouse.isOn = false;
        setTimeout($this.finish, 1000, $this);
    });
    
};

Nornenjs.prototype.resize = function(){
    var $this = this;
    window.addEventListener('resize', function(event){
        var el = document.getElementById($this.selector),
            width = el.clientWidth;
        el.width = width;
        el.height = width;
        $this.finish($this);
    });
};

Nornenjs.prototype.type = function(renderingType){
    if(renderingType == ENUMS.RENDERING_TYPE.VOLUME){
        // ~ Volume
    }else if(renderingType == ENUMS.RENDERING_TYPE.MRI){
        // ~ MRI
        this.sendOption.rotationX = STATIC.MRI_DEFAULT_OPTION.rotationX;
        this.sendOption.rotationY = STATIC.MRI_DEFAULT_OPTION.rotationY;
        this.sendOption.positionZ = STATIC.MRI_DEFAULT_OPTION.positionZ;
    }else if(renderingType == ENUMS.RENDERING_TYPE.MIP){
        // ~ MIP
    }else{
        return;
    }
    
    this.sendOption.transferScaleX = 0;
    this.sendOption.transferScaleY = 0;
    this.sendOption.transferScaleZ = 0;

    this.sendOption.streamType = ENUMS.STREAM_TYPE.EVENT;
    this.sendOption.renderingType = renderingType;

    this.send();
    setTimeout(this.finish, 1000, this);
};

Nornenjs.prototype.axisType = function(type){

    this.sendOption.streamType = ENUMS.STREAM_TYPE.EVENT;
    this.sendOption.mriType = type;
    
    if(type == ENUMS.MRI_TYPE.X){
        var value = this.sendOption.transferScaleY != 0 ? this.sendOption.transferScaleY : this.sendOption.transferScaleZ;
        this.sendOption.transferScaleX = value;
        this.sendOption.transferScaleY = 0;
        this.sendOption.transferScaleZ = 0;
    }else if(type == ENUMS.MRI_TYPE.Y){
        var value = this.sendOption.transferScaleX != 0 ? this.sendOption.transferScaleX : this.sendOption.transferScaleZ;
        this.sendOption.transferScaleX = 0;
        this.sendOption.transferScaleY = value;
        this.sendOption.transferScaleZ = 0;
    }else if(type == ENUMS.MRI_TYPE.Z){
        var value = this.sendOption.transferScaleX != 0 ? this.sendOption.transferScaleX : this.sendOption.transferScaleY;
        this.sendOption.transferScaleX = 0;
        this.sendOption.transferScaleY = 0;
        this.sendOption.transferScaleZ = value;
    }

    this.send();
    setTimeout(this.finish, 1000, this);
    
};

Nornenjs.prototype.axis = function(value, isFinish){

    this.sendOption.streamType = ENUMS.STREAM_TYPE.EVENT;

    if(this.sendOption.mriType == ENUMS.MRI_TYPE.X){
        this.sendOption.transferScaleX = value;
    }else if(this.sendOption.mriType == ENUMS.MRI_TYPE.Y){
        this.sendOption.transferScaleY = value;
    }else if(this.sendOption.mriType == ENUMS.MRI_TYPE.Z){
        this.sendOption.transferScaleZ = value;
    }

    this.send();
    if(isFinish){
        setTimeout(this.finish, 1000, this);
    }
};

Nornenjs.prototype.scale = function(value, isFinish){
    this.sendOption.streamType = ENUMS.STREAM_TYPE.EVENT;
    this.sendOption.positionZ = value;
    this.send();
    if(isFinish){
        setTimeout(this.finish, 1000, this);
    }
}

Nornenjs.prototype.brightness = function(value, isFinish){
    this.sendOption.streamType = ENUMS.STREAM_TYPE.EVENT;
    this.sendOption.brightness = value;
    this.send();
    if(isFinish){
        setTimeout(this.finish, 1000, this);
    }
};

Nornenjs.prototype.otf = function(value, isFinish){
    this.sendOption.streamType = ENUMS.STREAM_TYPE.EVENT;
    this.sendOption.transferOffset = value;
    this.send();
    if(isFinish){
        setTimeout(this.finish, 1000, this);
    }
};

var isMobile = {
    Android: function() {
        return navigator.userAgent.match(/Android/i);
    },
    BlackBerry: function() {
        return navigator.userAgent.match(/BlackBerry/i);
    },
    iOS: function() {
        return navigator.userAgent.match(/iPhone|iPad|iPod/i);
    },
    Opera: function() {
        return navigator.userAgent.match(/Opera Mini/i);
    },
    Windows: function() {
        return navigator.userAgent.match(/IEMobile/i);
    },
    any: function() {
        return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
    }
};