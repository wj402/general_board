<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/dbCon.jsp" %>

<%
	String sql = "SELECT unq, title, name, date_format(rdate, '%Y-%m-%d') rdate, hits FROM nboard ";
		   sql+= " ORDER BY unq DESC";
	ResultSet rs = stmt.executeQuery(sql);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<link rel="stylesheet" href="../css/layout.css" >

</head>
<body>
	
	<div class="wrap">
		<header>
			<div class="top_logo">
				
			</div>
			<div class="top_header">
			
			</div>
		</header>
		<nav>
			<%@ include file="../include/topmenu.jsp" %>
		</nav>
		<aside>
			<%@ include file="../include/leftmenu.jsp" %>
		</aside>
		<section>
			<article>
				<table>
					<caption> 게시판 목록 </caption>
					<colgroup>
						<col width="10%" />
						<col width="50%" />
						<col width="15%" />
						<col width="15%" />
						<col width="10%" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>이름</th>
							<th>날짜</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<%
							while( rs.next() ) {
								int unq = rs.getInt("unq");
								String title = rs.getString("title");
								String name = rs.getString("name");
								String hits = rs.getString("hits");
								String rdate = rs.getString("rdate");
						%>
							<tr>
								<td></td>
								<td><%=title %></td>
								<td><%=name %></td>
								<td><%=rdate %></td>
								<td><%=hits %></td>
							</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</article>
		</section>
		<footer>
			<%@ include file = "../include/footer.jsp" %>
		</footer>
	</div>
	
</body>
</html>