<%--
    User: pi Date: 15. 2. 3 Time: 오후 3:10
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/head.jspf" %>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
    google.load('visualization', '1.1', {packages: ['corechart']});

    var CHART_SIZE = 10;

    var drawCompress = {
        option : {
            animation: {
                duration: 1000,
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
        
        array : [
                ['count', 'cuda', 'jpeg', 'png'],
                [ 1 , 0, 0, 0 ]
        ],

        drawChart : function(){
            drawCompress.data = google.visualization.arrayToDataTable(drawCompress.array);
            drawCompress.view = new google.visualization.DataView(drawCompress.data);
            drawCompress.view.setColumns([0, 1,
                {
                    calc: 'stringify',
                    sourceColumn: 1,
                    type: 'string',
                    role: 'annotation'
                },
                2,
                {
                    calc: 'stringify',
                    sourceColumn: 2,
                    type: 'string',
                    role: 'annotation'
                },
                3,
                {
                    calc: 'stringify',
                    sourceColumn: 3,
                    type: 'string',
                    role: 'annotation'
                }]);
            drawCompress.chart.draw(drawCompress.view, drawCompress.option);
        },

        init : function(){
            drawCompress.chart = new google.visualization.LineChart(document.getElementById('compress_chart'));
            drawCompress.drawChart();
        },

        addRow : function(data){
            if(data.cudaTime == 0){
                return;
            }

            drawCompress.count++;
            var cudaTime = data.cudaTime.toFixed(1);
            var compressTime = (data.compressTime - data.cudaTime).toFixed(1);
            
            if(data.type == 1) {
                drawCompress.array.push([drawCompress.count.toString(), cudaTime, 0, compressTime]);
            }else if(data.type == 2){
                drawCompress.array.push([drawCompress.count.toString(), cudaTime, compressTime, 0]);
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
                duration: 1000,
                easing: 'in'
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
        view : null,
        count : 1,

        array : [
            ['time', 'fps'],
            [ 1 , 0 ]
        ],

        drawChart : function(){
            drawFps.data = google.visualization.arrayToDataTable(drawFps.array);
            drawFps.view = new google.visualization.DataView(drawFps.data);
            drawFps.view.setColumns([0, 1,
                {
                    calc: 'stringify',
                    sourceColumn: 1,
                    type: 'string',
                    role: 'annotation'
                }]);
            drawFps.chart.draw(drawFps.view, drawFps.option);
        },

        init : function(){
            drawFps.chart = new google.visualization.LineChart(document.getElementById('fps_chart'));
            drawFps.drawChart();
        },

        addRow : function(value){
            drawFps.count++;
            drawFps.array.push([drawFps.count.toString(), (value/2).toFixed(0)]);

            if(drawFps.count > CHART_SIZE){
                drawFps.option.hAxis.viewWindow.min +=1;
                drawFps.option.hAxis.viewWindow.max +=1;
            }
            drawFps.drawChart();
        }
    };

    google.setOnLoadCallback(drawFps.init);
    
</script>

<section class="nornen_section_wrap section_top">
    
    <section class="nornen_section">

        <article class="nornen_content_type015">
            
            <header>
                <h2>Volume Rendering</h2>
            </header>

            <div class="nornen_stream left">
                
                <canvas id="view_canvas">
                    
                </canvas>

                <ul class="selector">
                    <li class="rendering_type">
                        <h3>
                            <img src="${cp}/resources/image/icon/type.png" title="type">
                            <span>Rendering Type</span>
                        </h3>
                        <ul class="list">
                            <li data-type="1">
                                <a class="active">Volume</a>
                            </li>
                            <li data-type="2">
                                <a>MIP</a>
                            </li>
                            <li data-type="3">
                                <a>MRI</a>
                            </li>
                        </ul>
                    </li>
                    <li class="axis_type">
                        <h3>
                            <img src="${cp}/resources/image/icon/axis.png" title="axis">
                            <span>Axis</span>
                        </h3>
                        <ul class="list">
                            <li data-type="1" >
                                <a class="active">X</a>
                            </li>
                            <li data-type="2">
                                <a>Y</a>
                            </li>
                            <li data-type="3">
                                <a>Z</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                
                <div class="slider_wrap scale_slider">

                    <div class="slider nstSlider" data-range_min="0" data-range_max="10000" data-cur_min="3000" data-type="scale">
                        <div class="bar"></div>
                        <div class="leftGrip"></div>

                        <div class="title">
                            <img src="${cp}/resources/image/icon/zoom.png" title="zoom">
                            <span>Zoom</span>
                        </div>
                    </div>
                </div>

                <div class="slider_wrap brightness_slider">
                    <div class="slider nstSlider" data-range_min="0" data-range_max="200" data-cur_min="100" data-type="brightness">
                        <div class="bar"></div>
                        <div class="leftGrip"></div>

                        <div class="title">
                            <img src="${cp}/resources/image/icon/brightness.png" title="brightness">
                            <span>Brightness</span>
                        </div>
                    </div>
                </div>

                <div class="slider_wrap otf_slider">
                    <div class="slider nstSlider" data-range_min="50000" data-range_max="200000" data-cur_min="100000" data-type="otf">
                        <div class="bar"></div>
                        <div class="leftGrip"></div>

                        <div class="title">
                            <img src="${cp}/resources/image/icon/otf.png" title="otf">
                            <span>OTF</span>
                        </div>
                    </div>
                </div>

                <div class="slider_wrap axis_slider">
                    <div class="slider nstSlider" data-range_min="0" data-range_max="10000" data-cur_min="0" data-type="axis">
                        <div class="bar"></div>
                        <div class="leftGrip"></div>

                        <div class="title">
                            <img src="${cp}/resources/image/icon/axis.png" title="axis">
                            <span>Axis</span>
                        </div>
                    </div>
                </div>
                
            </div>
            
            <ul class="chart right">
                
                <li>
                    <div id="fps_chart"></div>
                    <span>Frame per second</span>
                </li>
                
                <li>
                    <div id="compress_chart"></div>
                    <span>Jpeg compress time</span>
                </li>
                
            </ul>
            
        </article>
        
        
    </section>
    
</section>

<script src="http://cdn.binaryjs.com/0/binary.js"></script>
<script src="http://112.108.40.166:3000/socket.io/socket.io.js"></script>
<script src="${cp}/client/nornenjs.0.1.0.js"></script>

<script>
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
    
</script>

<%@ include file="../layout/foot.jspf" %>