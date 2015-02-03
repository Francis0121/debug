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
    },
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
        isMobile : $.browser.desktop ? 0 : 1 // TODO NEED jquery browesr
    };
    this.sendOptionSize = null;
    
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

    var key, count = 0;
    if(this.sendOptionSize == null){
        for(key in this.sendOption) {
            if(this.sendOption.hasOwnProperty(key)) {
                count++;
            }
        }
        this.sendOptionSize = count;
    }
    
    this.buffer = new ArrayBuffer(count * 4);
    var floatArray = new Float32Array(this.buffer);

    count = 0;
    for(key in this.sendOption){
        if(this.sendOption.hasOwnProperty(key)){
            floatArray[count] = this.sendOption[key];
            count++;
        }
    }
    
    this.client.send(this.buffer);
};

Nornenjs.prototype.finish = function(){
    this.sendOption.streamType = ENUMS.STREAM_TYPE.FINISH;
    this.send();
};

Nornenjs.prototype.addEvent = function(){

    if($.browser.mobile){
        // ~ Run touch event
    }
    
};


/*
stream : {

    resize : function(){
        $(window).resize(function(){
            var $cthis = medical.connect;
            var $sthis = medical.stream;
            $cthis.document.canvas.attr('width', $($cthis.selector).width()+'px');
            $cthis.document.canvas.attr('height', $($cthis.selector).width()+'px');

            $sthis.sendTimeout();
        });
    },

    type : function(){
        $('.option_rendering ul li').on('click', function(){
            var thiz = $(this);
            var $sthis = medical.stream;
            var type = thiz.attr('data-type');

            $('.option_rendering ul li').removeClass('option_select_wrap_active').addClass('option_select_wrap_none');
            thiz.removeClass('option_select_wrap_none').addClass('option_select_wrap_active');

            if(type == $sthis.RENDERING_TYPE.VOLUME){
                $('.option_zoom').show();
                $('.option_brightness').show();
                $('.option_otf').show();
                $('.option_axis').hide();
            }else if(type == $sthis.RENDERING_TYPE.MRI){
                $('.option_zoom').hide();
                $('.option_brightness').hide();
                $('.option_otf').hide();
                $('.option_axis').show();

                $sthis.sendOption.rotationX = $sthis.MRI_DEFAULT_OPTION.rotationX;
                $sthis.sendOption.rotationY = $sthis.MRI_DEFAULT_OPTION.rotationY;
                $sthis.sendOption.positionZ = $sthis.MRI_DEFAULT_OPTION.positionZ;
            }else if(type == $sthis.RENDERING_TYPE.MIP){
                $('.option_zoom').show();
                $('.option_brightness').hide();
                $('.option_otf').hide();
                $('.option_axis').hide();
            }

            $sthis.sendOption.transferScaleX = 0;
            $sthis.sendOption.transferScaleY = 0;
            $sthis.sendOption.transferScaleZ = 0;
            $('#axis .ui-slider-range').css('width', '0');
            $('#axis .ui-slider-handle').css('left', '0');

            $sthis.sendOption.streamType = $sthis.STREAM_TYPE.EVENT;
            $sthis.sendOption.renderingType = type;

            $sthis.send();

            setTimeout($sthis.sendTimeout, 1000);
        });
    },

    axisType : function(){
        $('.option_axis ul li').on('click', function(){
            var thiz = $(this);
            var $sthis = medical.stream;
            var type = thiz.attr('data-type');

            $('.option_axis ul li').removeClass('option_select_wrap_active').addClass('option_select_wrap_none');
            thiz.removeClass('option_select_wrap_none').addClass('option_select_wrap_active');

            $sthis.sendOption.streamType = $sthis.STREAM_TYPE.EVENT;
            $sthis.sendOption.mriType = type;

            $sthis.sendOption.transferScaleX = 0;
            $sthis.sendOption.transferScaleY = 0;
            $sthis.sendOption.transferScaleZ = 0;
            $('#axis .ui-slider-range').css('width', '0');
            $('#axis .ui-slider-handle').css('left', '0');

            $sthis.send();

            setTimeout($sthis.sendTimeout, 1000);
        });
    },

    scale : function(){
        $('#scale').each(function() {
            $( this ).empty().slider({
                range: 'min',
                min: 0,
                value : 3000,
                max: 10000,
                animate: true,
                orientation: 'horizontal',
                slide: function( event, ui ) {
                    var $sthis = medical.stream;
                    $sthis.sendOption.streamType = $sthis.STREAM_TYPE.EVENT;
                    $sthis.sendOption.positionZ = ui.value/1000.0;
                    $sthis.send();
                },
                stop : function(event, ui){
                    var $sthis = medical.stream;
                    setTimeout($sthis.sendTimeout, 1000);
                }
            });
        });
    },

    brightness : function(){
        $('#brightness').each(function() {
            $( this ).empty().slider({
                range: 'min',
                min: 0,
                max: 200,
                value : 100,
                animate: true,
                orientation: 'horizontal',
                slide: function( event, ui ) {
                    var $sthis = medical.stream;
                    $sthis.sendOption.streamType = $sthis.STREAM_TYPE.EVENT;
                    $sthis.sendOption.brightness = ui.value/100.0;
                    $sthis.send();
                },
                stop : function(event, ui){
                    var $sthis = medical.stream;
                    setTimeout($sthis.sendTimeout, 1000);
                }
            });
        });
    },

    otf : function(){
        $('#otf').each(function() {
            $( this ).empty().slider({
                range: 'min',
                min: 5000,
                value: 10000,
                max: 15000,
                animate: true,
                orientation: 'horizontal',
                slide: function( event, ui ) {
                    var $sthis = medical.stream;
                    $sthis.sendOption.streamType = $sthis.STREAM_TYPE.EVENT;
                    $sthis.sendOption.transferOffset = (ui.value-10000)/10000.0;
                    $sthis.send();
                },
                stop : function(event, ui){
                    var $sthis = medical.stream;
                    setTimeout($sthis.sendTimeout, 1000);
                }
            });
        });
    },

    axis : function(){
        $('#axis').each(function() {
            $( this ).empty().slider({
                range: 'min',
                min: 0,
                value: 0,
                max: 10000,
                animate: true,
                orientation: 'horizontal',
                slide: function( event, ui ) {
                    var $sthis = medical.stream;
                    $sthis.sendOption.streamType = $sthis.STREAM_TYPE.EVENT;

                    if($sthis.sendOption.mriType == $sthis.MRI_TYPE.X){
                        $sthis.sendOption.transferScaleX = (ui.value)/10000.0;
                    }else if($sthis.sendOption.mriType == $sthis.MRI_TYPE.Y){
                        $sthis.sendOption.transferScaleY = (ui.value)/10000.0;
                    }else if($sthis.sendOption.mriType == $sthis.MRI_TYPE.Z){
                        $sthis.sendOption.transferScaleZ = (ui.value)/10000.0;
                    }

                    $sthis.send();
                },
                stop : function(event, ui){
                    var $sthis = medical.stream;
                    setTimeout($sthis.sendTimeout, 1000);
                }
            });
        });
    },

    isMouseOn : false,
        beforeX : null,
        beforeY : null,
        mouse : function(){
        var $sthis = medical.stream;
        var $cthis = medical.connect;

        $($cthis.selector).on('mousedown', function(event){
            $ethis.stream.isMouseOn = true;
            $ethis.stream.beforeX = event.pageX;
            $ethis.stream.beforeY = event.pageY;
        });

        $($cthis.selector).on('mousemove', function(event){
            if($ethis.stream.isMouseOn){
                $sthis.sendOption.streamType = $sthis.STREAM_TYPE.EVENT;

                $sthis.sendOption.rotationX += (event.pageX - $ethis.stream.beforeX)/5.0;
                $sthis.sendOption.rotationY += (event.pageY - $ethis.stream.beforeY)/5.0;

                $ethis.stream.beforeX = event.pageX;
                $ethis.stream.beforeY = event.pageY;

                $sthis.send();
            }
        });

        $('body').on('mouseup', function(event){
            $ethis.stream.isMouseOn = false;
            setTimeout($sthis.sendTimeout, 1000);
        });
    },

    isTouchOn : false,
        touchBeforeX : null,
        touchBeforeY : null,
        touch : function(){
        var el = document.getElementsByTagName('canvas')[0];

        el.addEventListener('touchstart', function(evt){
            evt.preventDefault();
            var el = document.getElementsByTagName('canvas')[0];
            var ctx = el.getContext('2d');
            var touches = evt.changedTouches;

            if(touches.length == 1){
                $ethis.stream.isTouchOn = true;
                $ethis.stream.touchBeforeX = touches[0].pageX;
                $ethis.stream.touchBeforeY = touches[0].pageY;
                console.log('x ', $ethis.stream.touchBeforeX, 'y : ', $ethis.stream.touchBeforeY);
            }

        });

        el.addEventListener('touchmove', function(evt){
            evt.preventDefault();
            var el = document.getElementsByTagName('canvas')[0];
            var ctx = el.getContext('2d');
            var touches = evt.changedTouches;
            var $sthis = medical.stream;


            if($ethis.stream.isTouchOn){
                $sthis.sendOption.streamType = $sthis.STREAM_TYPE.EVENT;

                $sthis.sendOption.rotationX += (touches[0].pageX - $ethis.stream.touchBeforeX)/100.0;
                $sthis.sendOption.rotationY += (touches[0].pageY - $ethis.stream.touchBeforeY)/100.0;

                $ethis.stream.beforeX = touches[0].pageX;
                $ethis.stream.beforeY = touches[0].pageY;

                $sthis.queue = [];
                $sthis.send();
            }

        });

        el.addEventListener('touchend', function(evt){
            evt.preventDefault();
            var el = document.getElementsByTagName('canvas')[0];
            var ctx = el.getContext('2d');
            var touches = evt.changedTouches;

            $ethis.stream.isTouchOn = false;
            setTimeout($sthis.sendTimeout, 1000);
        });

        el.addEventListener('touchcancel', function handleCancel(evt) {
            evt.preventDefault();
            $ethis.stream.isTouchOn = false;
            setTimeout($sthis.sendTimeout, 1000);
        });

        el.addEventListener('touchleave', function(evt){
            evt.preventDefault();
            var el = document.getElementsByTagName('canvas')[0];
            var ctx = el.getContext('2d');
            var touches = evt.changedTouches;

            $ethis.stream.isTouchOn = false;
            setTimeout($sthis.sendTimeout, 1000);
        });

    }

}*/
