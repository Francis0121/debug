/**
 * Created by pi on 15. 1. 10.
 */
$(function(){

    debug.emit();

    debug.interval = setInterval(debug.statistics, 1000);

});

debug.access = false;
debug.access_uuid = null;

debug.emit = function(){
    var url = contextPath + '/access/emit';
    $.getJSON(url, function(uuid){
        debug.access = true;
        debug. access_uuid = uuid;
    });
};

debug.statistics = function(){
    var url = contextPath + '/access/statistics';
    var json = {
        uuidPn : debug.access_uuid,
        name : $.browser.name,
        platform : $.browser.platform,
        version : $.browser.version,
        versionNumber : $.browser.versionNumber,
        isMobile : $.browser.desktop,
        frameCount : 30
    };

    $.postJSON(url, json, function(stats_pn){
        console.log('statistics', stats_pn);
        clearInterval(debug.interval);
    });

};
