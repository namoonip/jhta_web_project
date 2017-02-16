<%@page import="vo.SalesNumVO"%>
<%@page import="vo.groupItemVO"%>
<%@page import="vo.StatisticsVO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="util.NumberUtil"%>
<%@page import="dao.StatisticsDAO"%>
<%@page import="vo.ItemVO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vo.BuyVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.AdminOnlyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=News+Cycle:400,700" />
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 추가한 CSS -->
<link rel="stylesheet" href="/css/style.css">

</head>

<!-- 모든유저가 보는 네비바 -->
<%@include file="/nav.jsp"%>

<!-- Admin의 네비바 -->
<%@include file="adminNav.jsp"%>

<body>
<!-- LogingCheck And Admin Check -->
<br id="naviTarget" />
<br />
<h2 align="center">Statistics</h2>
	<div class="container">
		<div class="row">
		    <ul id="myTab" class="nav nav-tabs" role="tablist">
		      <li role="presentation" style="width: 33.3%"><a href="#itemsales" role="tab" data-toggle="tab" aria-controls="itemsales" aria-expanded="true"><strong style="text-shadow: 40%"><font size="3">Month Sales Number</font></strong></a></li>
		      <li role="presentation" style="width: 33.3%"><a href="#totalprice"  role="tab" data-toggle="tab" aria-controls="totalprice" aria-expanded="true"><strong style="text-shadow: 40%"><font size="3">Month Total Sales </font></strong></a></li>
		      <li role="presentation"  style="width: 33.3%"><a href="#monthsales" role="tab"  data-toggle="tab" aria-controls="monthsales" aria-expanded="true" ><strong style="text-shadow:  40%"><font size="3">Annual Sales Category Item</font></strong></a></li>
		      
		    </ul>
	       <div id="myTabContent" class="tab-content">
						       		<%
						if(session == null) {
						response.sendRedirect("/main.jsp?err");
						return;
						}
						request.setCharacterEncoding("utf-8");
						
						UserVO user = (UserVO) session.getAttribute("LOGINED_USER");
						
						if(!"admin".equals(user.getId())) {
							response.sendRedirect("/main.jsp?YourNotManager!");
							return;
						}
					%>
	       		<div role="tabpanel" class="tab-pane fade in active" id="itemsales">
							<div id="chart1_div" style="width: 100%; height: 800px"></div>
				 </div>
	       		 <div role="tabpanel" class="tab-pane fade in active" id="totalprice">
	       				<div id="chart2_div" style="width:100%; height: 800px;"></div>
	       		 </div>
	       		 <div role="tabpanel" class="tab-pane fade in active" id="monthsales" >
	       		 		<div id="top_x_div" style="width: 100%; height: 800px;"></div>
	       		 </div>
				</div>
	       	</div>
		</div>
	<%@include file="/footer.jsp"%>
</body>	
<!-- 그래프 관련 -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart2);

      function drawChart2() {
    	  var data = google.visualization.arrayToDataTable([
          	['Month', 'Total Sales'],
      	    
      	    <% 
      	    	StatisticsDAO Statisticsdao = new StatisticsDAO();
      	    	ArrayList<StatisticsVO> StatisticsList = Statisticsdao.getItemTotalList();
      	    	
      	    	for(StatisticsVO  Statistics: StatisticsList) {
      	    %>
      	     
      	    ['<%=Statistics.getDate() %>', <%=Statistics.getSum() %>],
      	   
      	    <%
      	    	}
      	    %>
      	  ]);

        var options = {
          title: 'Month Total Sales',
          hAxis: {title: 'Year',  titleTextStyle: {color: '#333'}},
          vAxis: {minValue: 0}
        };

        var chart = new google.visualization.AreaChart(document.getElementById('chart2_div'));
        chart.draw(data, options);
      }
    </script>
    
     <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart1);

      function drawChart1() {
    	  var data = google.visualization.arrayToDataTable([
            	['Month', 'Sales Num'],
                
                <% 
               	StatisticsDAO curveDAO = new StatisticsDAO();
                	ArrayList<SalesNumVO> StatList = curveDAO.getAllStat();
                	
                	for(SalesNumVO stat : StatList) {
                %>
                 
                ['<%=stat.getDate() %>',  <%=stat.getSum()%>],
                
                <%
                	}
                %>
              ]);

        var options = {
          title: 'Month Sales Number',
          hAxis: {title: 'Year',  titleTextStyle: {color: '#333'}},
          vAxis: {minValue: 0}
        };

        var chart = new google.visualization.AreaChart(document.getElementById('chart1_div'));
        chart.draw(data, options);
      }
    </script>
    
 <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawStuff);

      function drawStuff() {
        var data = new google.visualization.arrayToDataTable([
          ['Category', 'Sum'],
          <%
      	  StatisticsDAO topx = new StatisticsDAO();
      	  ArrayList<groupItemVO> groupItemList = topx.groupItemTotalList();
      	  
      	  for(groupItemVO groupItem : groupItemList){
      	%>
          ["<%=groupItem.getCategoryname()%>", <%=groupItem.getSum()%>],
          
          <%
      	  }
      	  %>
        ]);	

        var options = {
          title: 'Annual Sales Category Item',
          width: 900,
          legend: { position: 'none' },
          chart: { title: 'Chess opening moves',
                   subtitle: 'popularity by Sum' },
          bars: 'horizontal', // Required for Material Bar Charts.
          axes: {
            x: {
              0: { side: 'top', label: 'Sum'} // Top x-axis.
            }
          },
          bar: { groupWidth: "40%" }
        };

        var chart = new google.visualization.BarChart(document.getElementById('top_x_div'));
        chart.draw(data, options);
      };
    </script>
</html>