<%--
    User: pi Date: 15. 2. 3 Time: 오후 4:09
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../../layout/admin_head.jspf"%>

<section class="nornen_section_wrap section_top">

    <section class="nornen_section">
    
        <form:form commandName="volume" action="${cp}/admin/volume" method="post" enctype="multipart/form-data">
            <ul>
                <li>
                    <form:label path="name">Name</form:label>
                    <form:input path="name"/>
                </li>
                <li>
                    <form:label path="url">Url</form:label>
                    <form:input path="url"/>
                </li>
                <li>
                    <label for="image">Image</label>
                    <input type="file" name="image" id="image"/>
                </li>
                <li>
                    <label for="video">Video</label>
                    <input type="file" name="video" id="video"/>
                </li>
                <li>
                    <label for="volume">Volume</label>
                    <input type="file" name="volume" id="volume"/>
                </li>
                <li>
                    <button type="submit">POST</button>
                </li>
            </ul>
        </form:form>
        
    </section>

</section>

<%@ include file="../../layout/admin_foot.jspf"%>