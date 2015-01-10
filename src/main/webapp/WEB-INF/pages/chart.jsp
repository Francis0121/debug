<%--
    User: pi Date: 15. 1. 10 Time: 오후 9:21
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/head.jspf" %>

<div id="header">
    <h2>Real-time updates</h2>
</div>

<div id="content">

    <div class="demo-container">
        <div id="placeholder" class="demo-placeholder"></div>
    </div>

    <p>You can update a chart periodically to get a real-time effect by using a timer to insert the new data in the plot and redraw it.</p>

    <p>Time between updates: <input id="updateInterval" type="text" value="" style="text-align: right; width:5em"> milliseconds</p>

</div>

<div id="footer">
    Copyright &copy; 2007 - 2014 IOLA and Ole Laursen
</div>

<table>
    <caption>2009 Employee Sales by Department</caption>
    <thead>
    <tr>
        <td></td>
        <th scope="col">food</th>
        <th scope="col">auto</th>
        <th scope="col">household</th>
        <th scope="col">furniture</th>
        <th scope="col">kitchen</th>
        <th scope="col">bath</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row">Mary</th>
        <td>190</td>
        <td>160</td>
        <td>40</td>
        <td>120</td>
        <td>30</td>
        <td>70</td>
    </tr>
    <tr>
        <th scope="row">Tom</th>
        <td>3</td>
        <td>40</td>
        <td>30</td>
        <td>45</td>
        <td>35</td>
        <td>49</td>
    </tr>
    <tr>
        <th scope="row">Brad</th>
        <td>10</td>
        <td>180</td>
        <td>10</td>
        <td>85</td>
        <td>25</td>
        <td>79</td>
    </tr>
    <tr>
        <th scope="row">Kate</th>
        <td>40</td>
        <td>80</td>
        <td>90</td>
        <td>25</td>
        <td>15</td>
        <td>119</td>
    </tr>
    </tbody>
</table>

<%@ include file="../layout/foot.jspf" %>