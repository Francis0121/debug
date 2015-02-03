<%--
    User: pi Date: 15. 2. 3 Time: 오후 3:10
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/head.jspf" %>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
    google.load('visualization', '1.1', {packages: ['line']});
    google.setOnLoadCallback(drawChart);

    function drawChart() {

        var data = new google.visualization.DataTable();
        data.addColumn('number', 'Second');
        data.addColumn('number', 'fps');

        data.addRows([
            [1,  37.8],
            [2,  30.9],
            [3,  25.4],
            [4,  11.7],
            [5,  11.9],
            [6,   8.8],
            [7,   7.6],
            [8,  12.3],
            [9,  16.9],
            [10, 12.8],
            [11,  5.3],
            [12,  6.6],
            [13,  4.8],
            [14,  4.2]
        ]);

        var options = {
            legend: { position: 'none'},
            hAxis: { textPosition: 'none'}
        };

        var chart = new google.charts.Line(document.getElementById('fps_chart'));
        chart.draw(data, options);

        var chart = new google.charts.Line(document.getElementById('compress_chart'));
        chart.draw(data, options);
    }
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
                    <li>
                        <h3>
                            <img src="${cp}/resources/image/icon/type.png" title="type">
                            <span>Rendering Type</span>
                        </h3>
                        <div class="list rendering_type">
                            <a class="active" data-type="1">Volume</a>
                            <a data-type="2">MIP</a>
                            <a data-type="3">MRI</a>
                        </div>
                    </li>
                    <li>
                        <h3>
                            <img src="${cp}/resources/image/icon/axis.png" title="axis">
                            <span>Axis</span>
                        </h3>
                        <div class="list">
                            <a class="active">X</a>
                            <a>Y</a>
                            <a>Z</a>
                        </div>
                    </li>
                </ul>
                
                <div class="slider">
                    <div class="bg">
                        <div class="title">
                            <img src="${cp}/resources/image/icon/zoom.png" title="zoom">
                            <span>Zoom</span>
                        </div>
                    </div>
                </div>
                
                <div class="slider">
                    <div class="bg">
                        <div class="title">
                            <img src="${cp}/resources/image/icon/brightness.png" title="brightness">
                            <span>Brightness</span>
                        </div>
                    </div>
                </div>
                
                <div class="slider">
                    <div class="bg">
                        <div class="title">
                            <img src="${cp}/resources/image/icon/otf.png" title="otf">
                            <span>OTF</span>
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
    nornenjs.connect();
    
    $(function(){
        $('.rendering_type>a').on('click', function(){
            var type = $(this).attr('data-type');
            console.log(type);
            nornenjs.type(type);
        });
    });
</script>

<%@ include file="../layout/foot.jspf" %>