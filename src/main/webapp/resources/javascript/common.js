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

});

