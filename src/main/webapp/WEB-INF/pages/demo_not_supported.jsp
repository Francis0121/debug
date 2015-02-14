<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/head.jspf" %>

<!-- Not connection web socket -->
<section class="nornen_section_wrap section_top">

    <section class="nornen_section">

        <article class="nornen_content_type02">

            <header>
                <h2>Volume Rendering - <c:out value="${volume.name}"/></h2>
            </header>
            
            <div class="error_info">
                <img src="${cp}/resources/image/icon/error.png"/>
                <div class="text">
                    <p>Demonstration page not supported.</p>
                    <p>We will show demonstration video</p>
                </div>
            </div>
            
            <ul class="content">
                <li class="video">
                    <h3>- Desktop</h3>
                    
                    <video controls preload="auto">
                        <source src="${cp}/resources/video/<c:out value="${volume.name}"/>_mobile.webm" type='video/webm;codecs="vp8, vorbis"'>
                    </video>
                    
                </li>
                
                <li class="video">
                    <h3>- Mobile</h3>

                    <video controls preload="auto">
                        <source src="${cp}/resources/video/<c:out value="${volume.name}"/>_mobile.webm" type='video/webm;codecs="vp8, vorbis"'>
                    </video>
                    
                </li>
                
            </ul>

        </article>

    </section>

</section>

<%@ include file="../layout/foot.jspf" %>