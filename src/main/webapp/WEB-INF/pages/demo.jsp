<%--
    User: pi Date: 15. 2. 3 Time: 오후 3:10
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/head.jspf" %>

<script src="https://www.google.com/jsapi"></script>

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
                    <span>Compress time <img class="cuda_rect"/> Cuda <img class="jpeg_rect"/> Jpeg <img class="png_rect"/> Png </span>
                </li>
                
            </ul>
            
        </article>
        
        
    </section>
    
</section>

<script>
    var volumePrimaryNumber = '<c:out value="${volume.pn}"/>'
</script>

<script src="http://cdn.binaryjs.com/0/binary.js"></script>
<script src="http://112.108.40.166:3000/socket.io/socket.io.js"></script>
<script src="${cp}/client/nornenjs.0.1.0.js"></script>
<script src="${cp}/resources/javascript/chart.js"></script>
<script src="${cp}/resources/javascript/server.js"></script>



<%@ include file="../layout/foot.jspf" %>