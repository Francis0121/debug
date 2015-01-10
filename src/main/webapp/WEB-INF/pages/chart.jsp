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

<script type="text/javascript">

    $(function() {

        // We use an inline data source in the example, usually data would
        // be fetched from a server

        var data = [],
                totalPoints = 300;

        function getRandomData() {

            if (data.length > 0)
                data = data.slice(1);

            // Do a random walk

            while (data.length < totalPoints) {

                var prev = data.length > 0 ? data[data.length - 1] : 50,
                        y = prev + Math.random() * 10 - 5;

                if (y < 0) {
                    y = 0;
                } else if (y > 100) {
                    y = 100;
                }

                data.push(y);
            }

            // Zip the generated y values with the x values

            var res = [];
            for (var i = 0; i < data.length; ++i) {
                res.push([i, data[i]])
            }

            return res;
        }

        // Set up the control widget

        var updateInterval = 30;
        $("#updateInterval").val(updateInterval).change(function () {
            var v = $(this).val();
            if (v && !isNaN(+v)) {
                updateInterval = +v;
                if (updateInterval < 1) {
                    updateInterval = 1;
                } else if (updateInterval > 2000) {
                    updateInterval = 2000;
                }
                $(this).val("" + updateInterval);
            }
        });

        var plot = $.plot("#placeholder", [ getRandomData() ], {
            series: {
                shadowSize: 0	// Drawing is faster without shadows
            },
            yaxis: {
                min: 0,
                max: 100
            },
            xaxis: {
                show: false
            }
        });

        function update() {

            plot.setData([getRandomData()]);

            // Since the axes don't change, we don't need to call plot.setupGrid()

            plot.draw();
            setTimeout(update, updateInterval);
        }

        update();

        // Add the Flot version string to the footer

        $("#footer").prepend("Flot " + $.plot.version + " &ndash; ");
    });

</script>

<%@ include file="../layout/foot.jspf" %>