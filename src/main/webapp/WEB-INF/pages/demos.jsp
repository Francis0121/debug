<%--
    User: pi Date: 15. 2. 3 Time: 오후 3:10
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/head.jspf" %>
<script src="https://www.google.com/jsapi"></script>

<section class="nornen_section_wrap section_top">
    
    <section class="nornen_section">
        
        <article class="nornen_content_type02">
            
            <header>
                <h2>Volume list</h2>
            </header>
            
            <ul class="content">

                <c:forEach items="${volumes}" var="volume" varStatus="loop">
                <li data-view="img" data-order="<c:out value="${loop.count}"/>">
                    <h3><c:out value="${loop.count}"/>.<c:out value="${volume.name}"/> [ <a href="${cp}/data/volume/<c:out value="${volume.volumeData.pn}"/>"><c:out value="${volume.volumeData.originalName}"/></a> ] </h3>
                    <div class="image volume_image" >
                        <img src="${cp}/data/image/<c:out value="${volume.imageData.pn}"/>" title="<c:out value="${volume.imageData.originalName}"/>"/>
                        <video controls loop autoplay preload="auto" id="video_<c:out value="${loop.count}"/>">
                            <source src="${cp}/data/video/<c:out value="${volume.videoData.pn}"/>" type="video/mp4">
                        </video>
                    </div>
                    <div class="link">
                        <a href="${cp}/demo/pn/<c:out value="${volume.pn}"/>">Real time page</a>&nbsp;/&nbsp;<a href="#video_<c:out value="${loop.count}"/>" class="view_video_btn">View sample video</a>
                    </div>
                </li>
                </c:forEach>
            </ul>
            
        </article>
        
    </section>
    
    <section class="nornen_section">
        
        <article class="nornen_content_type02">
            
            <header>
                <h2>
                    Volume Chart
                </h2>
            </header>

            <div>
                <form:form commandName="statisticsFilter" method="get">
                    <form:hidden path="versionNumber"/>
                    <form:hidden path="platform"/>
                    
                    <div class="chart_volumePn">
                        <form:select path="volumePn">
                            <c:forEach items="${volumes}" var="volume">
                                <form:option value="${volume.pn}">${volume.name}</form:option>
                            </c:forEach>
                        </form:select>
                    </div>
                    
                    <div class="chart_name">
                    <form:select path="name">
                        <form:options items="${names}"/>
                    </form:select>
                    </div>

                    <div class="chart_platform">
                    <c:forEach items="${names}" var="name" varStatus="loop">
                        <select class="${name}" style="${loop.count eq 1 ? 'display : block;' : 'display:none;'}" data-name="${name}">
                            <c:forEach items="${platformMap[name]}" var="platform">
                                <option value="${platform}">${platform}</option>
                            </c:forEach>
                        </select>
                    </c:forEach>
                    </div>

                    <div class="chart_versionNumber">
                    <c:forEach items="${names}" var="name" varStatus="nLoop">
                        <div class="${name}">
                        <c:forEach items="${platformMap[name]}" var="platform" varStatus="pLoop">
                            <select class="${platform}" style="${nLoop.count eq 1 and pLoop.count eq 1 ? 'display : block;' : 'display:none;'}">
                                <c:forEach items="${versionNumberMap[name][platform]}" var="versionNumber">
                                    <option value="${versionNumber}">${versionNumber}</option>
                                </c:forEach>
                            </select>
                        </c:forEach>
                        </div>
                    </c:forEach>
                    </div>
                    
                </form:form>
            </div>
            
            <ul>
                <li>
                    <div id="fps_chart">
                        
                    </div>
                </li>
                <li></li>
            </ul>
            
        </article>
        
    </section>
    
</section>

<script>
    google.load('visualization', '1.1', {packages: ['corechart']});

    var CHART_SIZE = 10;

    var drawFps = {
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
            },
            legend: { position: 'none'}
        },
        chart : null,
        data : null,
        view : null,
        count : 1,

        drawChart : function(){
            drawFps.chart.draw(drawFps.data, drawFps.option);
        },

        init : function(){
            drawFps.chart = new google.visualization.LineChart(document.getElementById('fps_chart'));

            drawFps.data = new google.visualization.DataTable();
            drawFps.data.addColumn('string', 'count');
            drawFps.data.addColumn('number', 'fp');

            <c:forEach items="${statisticsList}" var="statistics">
            drawFps.data.addRow(['${statistics.pn}', ${statistics.frameCount}]);
            </c:forEach>

            drawFps.drawChart();
        }
    };

    google.setOnLoadCallback(drawFps.init);
    
    $(function(){
        
        var chartAjax = function(){
            var form = document.forms['statisticsFilter'];
            var url = contextPath + '/access/fpsChart';
            var json = {
                name : form.name.value,
                versionNumber : form.versionNumber.value,
                platform : form.platform.value,
                volumePn : form.volumePn.value
            };
            
            $.postJSON(url, json, function(statisticsList){
                var option = {
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
                    },
                    legend: { position: 'none'}
                };
                var chart = new google.visualization.LineChart(document.getElementById('fps_chart'));
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'count');
                data.addColumn('number', 'fp');
                
                for(var i=0; i<statisticsList.length; i++) {
                    var statistics = statisticsList[i];
                    data.addRow([statistics.pn.toString(), statistics.frameCount]);
                }
                chart.draw(data, option);
            });
        };
        
        $('.chart_name>select').on('change', function(){
            var name = $(this).val();
            $('.chart_platform>select').hide();
            $('.chart_platform>select.' + name).show();
            var platform = $('.chart_platform>select.' + name).val();
            $('input[name=platform]').val(platform);
            
            $('.chart_versionNumber select').hide();
            $('.chart_versionNumber>div.'+name+'>select:first-child').show();
            var versionNumber =$('.chart_versionNumber>div.'+name+'>select:first-child').val();
            $('input[name=versionNumber]').val(versionNumber);
            
            chartAjax();
        });
        
        $('.chart_platform>select').on('change', function(){
            var platform = $(this).val();
            var name = $(this).attr('data-name');
            $('input[name=platform]').val(platform);
            
            $('.chart_versionNumber>div.'+name+'>select').hide();
            $('.chart_versionNumber>div.'+name+'>select.'+platform).show();
            var versionNumber = $('.chart_versionNumber>div.'+name+'>select.'+platform).val();
            $('input[name=versionNumber]').val(versionNumber);
            
            chartAjax();
        });
        
        $('.chart_versionNumber select').on('change', function(){
            var versionNumber = $(this).val();
            $('input[name=versionNumber]').val(versionNumber);
            chartAjax();
        });
        
        $('.chart_volumePn>select').on('change', function(){
            chartAjax();
        });
    });

    
    
</script>



<%@ include file="../layout/foot.jspf" %>