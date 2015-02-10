/**
 * Created by pi on 15. 2. 5.
 */
/**
 * Set debug
 */
var debug = {

    option : {
        active : true,
        host : contextPath,
        isAccess : false,
        uuid : null,
    },

    run : function(){
        if (!this.option.active )
            return;

        this.emit();
    },

    emit : function(){
        var _this = this;
        var _option = _this.option;

        var url = _option.host + '/access/emit/pn/'+volumePrimaryNumber;

        $.getJSON(url, function(uuid){
            _option.uuid = uuid;
            _option.isAccess = true;
        }).error(function(error){
            console.log('[ERROR]', error);
            _option.isAccess = false;
        });
    },

    statistic : function(fps){
        var _this = this;
        var _option = _this.option;

        if(!_option.isAccess){ return; }

        var url = _option.host + '/access/statistics';
        var json = {
            uuidPn : _option.uuid.pn,
            name : $.browser.name,
            platform : $.browser.platform,
            version : $.browser.version,
            versionNumber : $.browser.versionNumber,
            isMobile : $.browser.desktop ? 1 : 0,
            frameCount :  fps
        };

        $.postJSON(url, json, function(stats_pn){

        }).error(function(error){
            _option.isAccess = false;
        });
    }

}
debug.run();
/**
 * Setting nornenjs
 */
var nornenjs = new Nornenjs(volumePrimaryNumber, '112.108.40.166', 3000, 9000);

var debugCallback = function(data){
    drawCompress.addRow(data);
};

var fpsCallback = function(fps){
    drawFps.addRow(fps);
    if(fps != 0){
        debug.statistic(fps);
    }
};

nornenjs.connect(debugCallback, fpsCallback);

$(function(){

    $('.quality_type>ul>li').click(function(){
        var value = $(this).attr('data-type');

        $('.quality_type>ul>li>a').removeClass('active');
        $(this).find('a').addClass('active');
        
        if(value == NORNENJS_ENUMS.QUALITY_TYPE.HIGH){
            nornenjs.quality(NORNENJS_ENUMS.QUALITY_TYPE.HIGH);
        }else{
            nornenjs.quality(NORNENJS_ENUMS.QUALITY_TYPE.LOW);
        }
    });
    
    $('.rendering_type>ul>li').click(function(){
        var type = $(this).attr('data-type');

        $('.rendering_type>ul>li>a').removeClass('active');
        $(this).find('a').addClass('active');

        if(type == NORNENJS_ENUMS.RENDERING_TYPE.MPR){
            $('.scale_slider').hide();
            $('.brightness_slider').hide();
            $('.otf_slider').hide();
            $('.axis_slider').show();
            $('.axis_type').show();
        }else if(type == NORNENJS_ENUMS.RENDERING_TYPE.VOLUME){
            $('.scale_slider').show();
            $('.brightness_slider').show();
            $('.otf_slider').show();
            $('.axis_slider').hide();
            $('.axis_type').hide();
        }else if(type == NORNENJS_ENUMS.RENDERING_TYPE.MIP){
            $('.scale_slider').show();
            $('.brightness_slider').hide();
            $('.otf_slider').hide();
            $('.axis_slider').hide();
            $('.axis_type').hide();
        }

        nornenjs.type(type);
    });

    $('.axis_type>ul>li').click(function(){
        var type = $(this).attr('data-type');

        $('.axis_type>ul>li>a').removeClass('active');
        $(this).find('a').addClass('active');

        nornenjs.axisType(type);
    });

    $('.nstSlider').nstSlider({
        'left_grip_selector' : '.leftGrip',
        'value_bar_selector' : '.bar',
        'value_changed_callback': function(cause, leftValue, rightValue) {
            $(this).find('.bar').css('background', 'url('+contextPath +'/resources/image/slider.png)' );

            if(nornenjs.isConnect) {
                if (this.attr('data-type') == 'scale') {
                    nornenjs.scale(leftValue / 1000, false);
                } else if (this.attr('data-type') == 'brightness') {
                    nornenjs.brightness(leftValue / 100, false);
                } else if (this.attr('data-type') == 'otf'){
                    nornenjs.otf((leftValue-100000)/100000, false);
                } else if (this.attr('data-type') == 'axis'){
                    nornenjs.axis(leftValue/10000, false);
                }
            }
        },
        'user_mouseup_callback' : function(cause, leftValue, rightValue) {
            setTimeout(nornenjs.finish, 1000, nornenjs);

        }
    });
});
