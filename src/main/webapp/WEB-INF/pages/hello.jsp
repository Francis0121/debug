<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/head.jspf"%>

<h2>Hello ${message}</h2>

<span>${board}</span>

<spna id="json"></spna>

<%@ include file="../layout/foot.jspf"%>

<script>
    var json = {
        pn : '<c:out value="${board.pn}"/>',
        content : '<c:out value="${board.content}"/>'
    };

    $.postJSON(contextPath + '/json', json, function(result){
        $('#json').html(result);
    });

</script>
