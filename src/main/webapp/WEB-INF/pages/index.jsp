<%--
    User: pi Date: 15. 1. 10 Time: 오후 3:36
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/head.jspf" %>

<header class="nornen_header_wrap">

    <div class="nornen_header">
    
        <h1 class="logo">
            <a href="${cp}/">
                <img src="${cp}/resources/image/header/logo.png">
                <div class="title_wrap">
                    <span class="title">Nornen<span class="highlight">js</span></span>
                    <span class="sub_title">Volume Rendering Cloud system</span>
                </div>
            </a>
        </h1>
        
        <nav class="nav_wrap">

            <button type="button" class="list_btn">List</button>

            <menu data-isShow="false">
                <li>
                    <a href="${cp}/">
                        Home
                    </a>
                </li>
                <li>
                    <a href="${cp}">
                        Get Started
                    </a>
                </li>
                <li>
                    <a href="${cp}">
                        Example/Demo
                    </a>
                </li>
                <li>
                    <a href="${cp}">
                        Document
                    </a>
                </li>
                <li>
                    <a href="https://github.com/Francis0121/volume-rendering-cloud-system">
                        Github
                    </a>
                </li>
            </menu>

        </nav>

    </div>
    
</header>

<section class="nornen_section">
    
</section>

<footer class="nornen_footer">
    
    <div class="copyright">
        <span>Copyright &copy; Teriusbin.Lee. Francis.Kim. All rights reserved.</span>
    </div>
    
</footer>

<%@ include file="../layout/foot.jspf" %>