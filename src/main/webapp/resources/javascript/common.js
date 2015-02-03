/**
 * Created by pi on 15. 1. 10.
 */
$(function(){

    $('.list_btn').on('click', function(){
        var navWrap = $('.nav_wrap> menu');
        
        if(navWrap.attr('data-isShow') === 'false'){
            $('.nav_wrap> menu').animate({
                'margin': '0 0 0 0'
            }, 500, function() {
                navWrap.attr('data-isShow', 'true');
            });
        }else{
            $('.nav_wrap> menu').animate({
                'margin': '0 0 0 100%'
            }, 500, function() {
                navWrap.attr('data-isShow', 'false');
            });
        }
        
    });

    
    $('.view_video_btn').on('click', function(){
        var _parent = $(this).parents('li'),
            _wrap = _parent.find('.volume_image'),
            _order = _parent.attr('data-order');
            _img = _wrap.children('img'),
            _width = _img.width();
        
        if(_parent.attr('data-view') == 'img'){
            _img.hide();
            _wrap.children('video').attr('height', _width).show();
            _parent.attr('data-view', 'video');
            document.getElementById('video_'+_order).currentTime=0;
            document.getElementById('video_'+_order).play();
        }else{
            _img.show();
            _wrap.children('video').hide();
            _parent.attr('data-view', 'img');
        }
    });
    
});

