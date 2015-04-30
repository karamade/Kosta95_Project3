<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.boram3.yanolja.DAO.*" %>
<%@ page import="com.boram3.yanolja.DTO.*" %>
<%
	List memberlist = (List)request.getAttribute("memberlist");
%>
<html>
<head>
<title>회원관리 시스템 관리자모드(회원 목록 보기)</title>
<script>
function CallConfirm() {//사용자 정의 함수
	if(window.confirm("삭제할까요")){ 
		document.deleteok.submit();
	
	}else{
		
	}
}
/* <form action="./MemberDeleteAction.me" method="post" name="deleteok">
<td>
<input type="button" value="삭제" onclick="CallConfirm()" >
</td>
</form> */
</script>
</head>
<body>
<center>

<%-- <table border=1 width=300>
	<tr align=center>
		<td colspan=2>회원 목록</td>
	</tr>
	<%
	for(int i=0;i<memberlist.size();i++){ 
	MemberBean member=(MemberBean)memberlist.get(i);
	%>
	<tr align=center>
		<td>
			<a href="MemberViewAction.me?userid=<%=member.getUserid() %>">
				<%=member.getUserid() %>
			</a>
		</td>
		<td>
		<a href="MemberDeleteAction.me?userid=<%=member.getUserid() %>">삭제</a>
		</td>
	</tr>
	<%} %>
	<form action="./MemberSearchAction.me" method="post">
	<tr align=center>
		<td colspan=2>
			<input type="text" name="searchMember" />
			<input type="submit" value="검색" />
		</td>
	</tr>
	</form>
	<tr align=center>
		<td colspan=2>
			<a href="./BoardList.bo">[게시판 이동]</a>
		</td>
	</tr>
</table> --%>

<table border=1 width=300>
	<tr align=center>
		<td colspan=2>회원 목록</td>
	</tr>
	<%
	for(int i=0;i<memberlist.size();i++){ 
	MemberBean member=(MemberBean)memberlist.get(i);
	%>
	<tr align=center>
		<td>
			<a href="MemberViewAction.me?userid=<%=member.getUserid() %>">
				<%=member.getUserid() %>
			</a>
		</td>
		<form action="./MemberDeleteAction.me" method="post" name="deleteok">
		<td>
		<input type="button" value="삭제" onclick="CallConfirm()" >
		</td>
		</form>
	</tr>
	<%} %>
	<form action="./MemberSearchAction.me" method="post">
	<tr align=center>
		<td colspan=2>
			<input type="text" name="searchMember" />
			<input type="submit" value="검색" />
		</td>
	</tr>
	</form>
	<tr align=center>
		<td colspan=2>
			<a href="./BoardList.bo">[게시판 이동]</a>
		</td>
	</tr>
</table>

</center>
</body>
</html>