<%--
    User: pi Date: 15. 2. 3 Time: 오후 3:10
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/head.jspf" %>

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
                <li></li>
                <li></li>
            </ul>
            
        </article>
        
    </section>
    
</section>

<script>
    $(function(){
        
        $('.chart_name>select').on('change', function(){
            var name = $(this).val();
            $('.chart_platform>select').hide();
            $('.chart_platform>select.' + name).show();
            
            $('.chart_versionNumber select').hide();
            $('.chart_versionNumber>div.'+name+'>select:first-child').show();
        });
        
        $('.chart_platform>select').on('change', function(){
            var platform = $(this).val();
            var name = $(this).attr('data-name');

            $('.chart_versionNumber>div.'+name+'>select').hide();
            $('.chart_versionNumber>div.'+name+'>select.'+platform).show();
        });
        
        $('.chart_versionNumber>select').on('change', function(){

        });
    });
</script>


<%@ include file="../layout/foot.jspf" %>