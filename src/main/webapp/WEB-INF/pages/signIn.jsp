<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<c:set var="cp" value="<%=request.getContextPath() %>"/>
<c:set var="rp" value='<%=request.getAttribute("javax.servlet.forward.request_uri")%>'/>

<!DOCTYPE html>
<html>
<head>
    <title>Nornenjs</title>

    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />

    <link rel="image_src" href="${cp }/resources/image/favicon.ico" />
    <link rel="shortcut icon" type="image/x-icon" href="${cp }/resources/image/favicon.ico"/>

    <link rel="stylesheet" type="text/css" href="${cp }/resources/css/default.css">

    <script src="${cp}/resources/javascript/jquery-1.11.2.min.js"></script>
    <script>
        var contextPath = '<c:out value="${cp}"/>';
        var realPath = '<c:out value="${rp}"/>';
    </script>
</head>
<body>
<sec:authorize access="isAnonymous()">
    
    <section>

        <header class="user_login_header">
            <h1>
                Nornenjs-login
            </h1>
        </header>

        <article class="user_login_article">
            <form id="user" action="${cp}/j_spring_security_check" method="post">
                <ul class="user_login_form">
                    <li>
                        <input id="nornenjs_username" name="nornenjs_username" type="text" placeholder="ID" class="none"/>
                    </li>
                    <li>
                        <input id="nornenjs_password" name="nornenjs_password" type="password" placeholder="PW" class="none">
                    </li>
                    <c:if test="${not empty param.login_error}">
                        <li class="error">
                            <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>
                        </li>
                    </c:if>
                    <li>
                        <button type="submit" class="button_common button_blue">Sign In</button>
                    </li>
                </ul>
            </form>
        </article>

    </section>
    
</sec:authorize>
<sec:authorize access="isAuthenticated()">
    <script>
        location.href= contextPath + '/admin/volume'
    </script>
</sec:authorize>

</body>
</html>