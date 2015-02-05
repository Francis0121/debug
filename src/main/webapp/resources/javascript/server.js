/**
 * Created by pi on 15. 2. 5.
 */
var nornenjs = new Nornenjs('112.108.40.166', 3000, 9000);

var debugCallback = function(data){
    drawCompress.addRow(data);
};

var fpsCallback = function(fps){
    drawFps.addRow(fps);
};

nornenjs.connect(debugCallback, fpsCallback);

$(function(){

    $('.rendering_type>ul>li').click(function(){
        var type = $(this).attr('data-type');

        $('.rendering_type>ul>li>a').removeClass('active');
        $(this).find('a').addClass('active');

        if(type == ENUMS.RENDERING_TYPE.MRI){
            $('.scale_slider').hide();
            $('.brightness_slider').hide();
            $('.otf_slider').hide();
            $('.axis_slider').show();
            $('.axis_type').show();
            nornenjs.sendOption.rotationX = STATIC.MRI_DEFAULT_OPTION.rotationX;
            nornenjs.sendOption.rotationY = STATIC.MRI_DEFAULT_OPTION.rotationY;
            nornenjs.sendOption.positionZ = STATIC.MRI_DEFAULT_OPTION.positionZ;
        }else if(type == ENUMS.RENDERING_TYPE.VOLUME){
            $('.scale_slider').show();
            $('.brightness_slider').show();
            $('.otf_slider').show();
            $('.axis_slider').hide();
            $('.axis_type').hide();
        }else if(type == ENUMS.RENDERING_TYPE.MIP){
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
