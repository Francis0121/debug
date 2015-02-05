/**
 * Created by pi on 15. 2. 5.
 */
if($.browser.desktop){

    google.load('visualization', '1.1', {packages: ['corechart']});

    var CHART_SIZE = 10;

    var drawCompress = {
        option : {
            animation: {
                duration: 400,
                easing: 'in'
            },
            hAxis: {
                viewWindow: {
                    min: 0,
                    max: CHART_SIZE
                },
                textPosition: 'none'
            }
        },
        chart : null,
        data : null,
        view : null,
        count : 1,

        drawChart : function(){
            drawCompress.chart.draw(drawCompress.data, drawCompress.option);
        },

        init : function(){
            drawCompress.chart = new google.visualization.LineChart(document.getElementById('compress_chart'));

            drawCompress.data = new google.visualization.DataTable();
            drawCompress.data.addColumn('string', 'count');
            drawCompress.data.addColumn('number', 'cuda');
            drawCompress.data.addColumn('number', 'jpeg');
            drawCompress.data.addColumn('number', 'png');

            drawCompress.data.addRow([drawCompress.count.toString(), 0, 0, 0]);
            drawCompress.drawChart();
        },

        addRow : function(data){
            if(data.cudaTime == 0){
                return;
            }

            drawCompress.count++;
            var cudaTime = data.cudaTime;
            var compressTime = data.compressTime - data.cudaTime;

            if(data.type == 1) {
                drawCompress.data.addRow([drawCompress.count.toString(), cudaTime, 0, compressTime]);
            }else if(data.type == 2){
                drawCompress.data.addRow([drawCompress.count.toString(), cudaTime, compressTime, 0]);
            }else{
                return;
            }

            if(drawCompress.count > CHART_SIZE){
                drawCompress.option.hAxis.viewWindow.min +=1;
                drawCompress.option.hAxis.viewWindow.max +=1;
            }
            drawCompress.drawChart();
        }
    };

    google.setOnLoadCallback(drawCompress.init);

    var drawFps = {
        option : {
            animation: {
                duration: 400,
                easing: 'out',
                startup: false
            },
            hAxis: {
                viewWindow: {
                    min: 0,
                    max: CHART_SIZE
                },
                textPosition: 'none'
            },
            legend: { position: 'none'}
        },
        chart : null,
        data : null,
        count : 1,

        drawChart : function(){
            drawFps.chart.draw(drawFps.data, drawFps.option);
        },

        init : function(){
            drawFps.chart = new google.visualization.LineChart(document.getElementById('fps_chart'));

            drawFps.data = new google.visualization.DataTable();
            drawFps.data.addColumn('string', 'count');
            drawFps.data.addColumn('number', 'fps');
            drawFps.data.addRow([drawFps.count.toString(), 0]);

            drawFps.drawChart();
        },

        addRow : function(value){
            drawFps.count++;
            drawFps.data.addRow([drawFps.count.toString(), value]);

            if(drawFps.count > CHART_SIZE){
                drawFps.option.hAxis.viewWindow.min +=1;
                drawFps.option.hAxis.viewWindow.max +=1;
            }
            drawFps.drawChart();
        }
    };

    google.setOnLoadCallback(drawFps.init);
    
}else{
    $('#compress_chart').addClass('mobile_chart');
    $('#fps_chart').addClass('mobile_chart');
    
    var drawCompress = {
        addRow : function(data){
            if(data.cudaTime == 0){
                return;
            }
            
            var cudaTime = data.cudaTime.toFixed(1);
            var compressTime = (data.compressTime - data.cudaTime).toFixed(1);
            
            var p = $('<p>');
            if(data.type == 1){
                p.html('<span class="cuda">Cuda</span> : ' + cudaTime + 'ms   ' + '<span class="png">Png</span> : ' + compressTime + 'ms ');
            }else if(data.type == 2){
                p.html('<span class="cuda">Cuda</span> : ' + cudaTime + 'ms   ' + '<span class="jpeg">Jpeg</span> : ' + compressTime + 'ms ');
            }
            
            $('#compress_chart').append(p);
            
            var el = document.getElementById('compress_chart');
            if (el.scrollHeight > 0) el.scrollTop = el.scrollHeight;
        }
    };
    
    var drawFps = {
        addRow : function(value){
            if(value == 0){
                return;
            }
            var p = $('<p>');
            p.html('<span class="fps">FPS</span> : ' + value);
            $('#fps_chart').append(p);
            
            var el = document.getElementById('fps_chart');
            if (el.scrollHeight > 0) el.scrollTop = el.scrollHeight;
        }
    };
}
