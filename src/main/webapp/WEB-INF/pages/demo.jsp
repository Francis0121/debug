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
                <li>
                    <h3><c:out value="${loop.count}"/>.<c:out value="${volume.name}"/> [ <a href=""><c:out value="${volume.volumeData.originalName}"/></a> ] </h3>
                    <img src="" title="<c:out value="${volume.imageData.originalName}"/>"/>
                    <a href="<c:out value="${volume.url}"/>" class="link">Real time page</a>&nbsp;/&nbsp;<a href="" class="link">View sample video</a>
                </li>
                </c:forEach>
            </ul>
            
        </article>
        
    </section>
    
</section>


<%@ include file="../layout/foot.jspf" %>