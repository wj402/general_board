<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/dbCon.jsp" %>
<%
	String unq = request.getParameter("unq");

	String sql2 = "update nboard set hits=hits+1 where unq = '"+unq+"' ";
	stmt.executeUpdate(sql2);

	String sql = "select title, name, content, rdate ";
		   sql+= " from nboard ";
		   sql+= " where unq='"+unq+"'";
		   
	ResultSet rs = stmt.executeQuery(sql);
	
	String title = "";
	String name = "";
	String content = "";
	String rdate = "";
	
	if( rs.next() ) {
		title = rs.getString("title");
		name = rs.getString("name");
		content = rs.getString("content");
		rdate = rs.getString("rdate");
	} else {
%>
	<script>
		alert("잘못된 접근입니다!!");
		location = "../main/main.jsp";
	</script>
<%	
	return;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세화면</title>
<link rel="stylesheet" href="../css/layout.css" >
</head>

<style>
	td {
		text-align: left;
	}

	.box_title {
		width: 98%;
	}
	
	.box_name {
		width: 150px;
	}
</style>

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
				<form name="frm" method="post" action="boardWriteSave.jsp">
					<table>
						<caption> 게시판 입력화면 </caption>
						<colgroup>
							<col width="25%" />
							<col width="*" />
						</colgroup>
						<tbody>
							<tr>
								<th>제목</th>
								<td><%=title %></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><%=name %></td>
							</tr>
							<tr>
								<th>내용</th>
								<td>
									<%=content %>
								</td>
							</tr>
							<tr>
								<th>날짜</th>
								<td>
									<%=rdate %>
								</td>
							</tr>
						</tbody>
					</table>
					
					<div style="width:600px; text-align: center; margin-top:10px;">
						<button type="button">목록</button>
						<button type="button">수정</button>
						<button type="button">삭제</button>
					</div>
				</form>
			</article>
		</section>
		<footer>
			<%@ include file = "../include/footer.jsp" %>
		</footer>
	</div>
	
</body>
</html>