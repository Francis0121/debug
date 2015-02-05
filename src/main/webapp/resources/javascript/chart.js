/**
 * Created by pi on 15. 2. 5.
 */
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
