<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/dbCon.jsp" %>

<%
	String sqlTot = "SELECT count(*) total FROM nboard";
	ResultSet rsTot = stmt.executeQuery(sqlTot);
	rsTot.next();
	int total = rsTot.getInt("total"); // 전체 데이터 개수
	
	int rownumber = total; // 행번호

	String sql = " SELECT unq,"; 
		   sql+= "	title, ";
		   sql+= "	name, "; 
		   sql+= "	date_format(rdate, '%Y-%m-%d') rdate,"; // left(rdate,10), subString(1, 10)
		   sql+= "	hits";
		   sql+= "	FROM nboard ";
		   sql+= " 	ORDER BY unq DESC ";
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
					<caption> 
						<div>게시판 목록</div>
						<div style="display:flex; align-item: center; justify-content:center; margin-top: 5px;">
							<div style="font-size:12px; width:50%; height:30px; line-height:30px; text-align:left; font-weight:400; ">
								전체 데이터 개수 : 총 <%=total %>개
							</div> 
							<div style="width:50%; text-align:right; height:30px margin-top:10px;">
								<button type="button" onclick="location='boardWrite.jsp' ">글쓰기</button>
							</div>
						</div>
					</caption>
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
								<td><%=rownumber %></td>
								<td><%=title %></td>
								<td><%=name %></td>
								<td><%=rdate %></td>
								<td><%=hits %></td>
							</tr>
						<%
								rownumber--;
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