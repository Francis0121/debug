<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../layout/admin_head.jspf"%>

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

<%@ include file="../../layout/admin_foot.jspf"%>