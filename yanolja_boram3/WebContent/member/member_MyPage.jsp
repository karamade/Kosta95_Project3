<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="com.boram3.yanolja.DAO.*" %>
<%@ page import="com.boram3.yanolja.DTO.*" %>
<%
	MemberBean member=(MemberBean)request.getAttribute("member");
	String userid = (String)session.getAttribute("userid");
%>



<%-- <%
	String[] team_radio= null;
	for(int i = 0 ; i<=team_radio.length;i++){
		team_radio[i]= ;
	}
%> --%>
<html>
<head>
<title>MyPage</title>
<script>
function picCheck(){
	var pic=document.picupdateform.profile_pic.value;
	if(pic==""){
		alert('사진첨부를 하여주십시오.');
		return;
	}
	
	document.picupdateform.submit();
}
function dataCheck(){
	var pwd= document.updateform.pwd.value;
	if(pwd==""){
		alert("비밀번호를 입력해주십시오.");
		document.updateform.pwd.focus();
		return;
	}else if(pwd.length<5){
		alert("비밀번호를 4자리 이상 입력해주십시오.");
		document.updateform.pwd.focus();
		return;
	}
	
	var ph= document.updateform.phone.value;
	if(ph==""){
		alert("전화번호를 입력해주십시오.");
		document.updateform.phone.focus();
		return;
	}
	
	var team= document.updateform.team_no_fk.value;
	if(team==""){
		alert("팀을 선택해주십시오.");
		return;
	}
	alert("수정되었습니다.");
	document.updateform.submit();
}
</script>
</head>
<body>
<center>
<%-- <form name="updateform" action="./MemberUpdateAction.me" method="post" enctype="multipart/form-data">
<table border=1 width=500>
	<input type="hidden" name="userid" value=<%=member.getUserid() %> />
	<input type="hidden" name="name" value=<%=member.getName() %> />
	<input type="hidden" name="email" value=<%=member.getEmail() %> />
	<input type="hidden" name="joindate" value=<%=member.getJoindate() %> />
	<tr align=center>
		<td>아이디 : </td>
		<td><%=member.getUserid() %></td>
	</tr>
	<tr align=center>
		<td>프로필 사진 : </td>
		<td><img alt="" src="memberpic/<%=member.getProfile_pic()%>" width="100" height="100"><br>
		수정할 사진 : <input type="file" value=<%=member.getProfile_pic()%> name="profile_pic"/></td>
	</tr>
	<tr align=center>
		<td>이름 : </td>
		<td><%=member.getName() %></td>
	</tr>
	<tr align=center>
		<td>비밀번호 : </td>
		<td><input type="password" name="pwd" value=<%=member.getPwd() %>></td>
	</tr>
	<tr align=center>
		<td>전화번호 : </td>
		<td><input type="text" name="phone" value=<%=member.getPhone() %> /></td>
	</tr>
	<tr align=center>
		<td>이메일 주소 : </td>
		<td><%=member.getEmail() %></td>
	</tr>
	<tr align=center>
		<td>현재 응원팀 : </td>
		<td><%=member.getTeam_name() %><br>
			<input type="radio" name="team_no_fk" value="0" checked/>무소속
			<input type="radio" name="team_no_fk" value="1"/>삼성
			<input type="radio" name="team_no_fk" value="2"/>넥센
			<input type="radio" name="team_no_fk" value="3"/>NC
			<input type="radio" name="team_no_fk" value="4"/>LG
			<input type="radio" name="team_no_fk" value="5"/>SK
			<input type="radio" name="team_no_fk" value="6"/>두산
			<input type="radio" name="team_no_fk" value="7"/>롯데
			<input type="radio" name="team_no_fk" value="8"/>KIA
			<input type="radio" name="team_no_fk" value="9"/>한화
			<input type="radio" name="team_no_fk" value="10"/>KT
		</td>
	</tr>
	<tr align=center>
		<td>가입일 : </td>
		<td><%=member.getJoindate() %></td>
	</tr>
	<tr align=center>
		<td>
			<!-- <a href="MemberUpdateAction.me">수정하기</a> -->
			<a href="javascript:updateform.submit()">수정하기</a>
		</td>
		<td>
			<a href="BoardList.bo">리스트로 돌아가기</a>
		</td>
	</tr>
</table>
</form> --%>


<table border=1 width=500>

	<%-- <input type="hidden" name="userid" value=<%=member.getUserid() %> />
	<input type="hidden" name="name" value=<%=member.getName() %> />
	<input type="hidden" name="email" value=<%=member.getEmail() %> />
	<input type="hidden" name="joindate" value=<%=member.getJoindate() %> /> --%>
	
	<tr align=center>
		<td>아이디 : </td>
		<td><%=member.getUserid() %></td>
	</tr>
	<form name="picupdateform" action="./MemberPicUpdateAction.me" method="post" enctype="multipart/form-data">
	<input type="hidden" name="userid" value=<%=member.getUserid() %> />
	<tr align=center>
		<td>프로필 사진 : </td>
		<td><img alt="" src="memberpic/<%=member.getProfile_pic()%>" width="100" height="100"><br>
		<input type="file" value=<%=member.getProfile_pic()%> name="profile_pic"/></td>
		<td>
			<!-- <a href="MemberUpdateAction.me">수정하기</a> -->
			<input type="button" name="picUpdate" value="사진수정하기" onclick="picCheck()">
			<!-- <a href="javascript:picupdateform.submit()">사진수정하기</a> -->
		</td>
	</tr>
	</form>
	<tr align=center>
		<td>이름 : </td>
		<td><%=member.getName() %></td>
	</tr>
	<form name="updateform" action="./MemberUpdateAction.me" method="post" enctype="multipart/form-data">
	<input type="hidden" name="userid" value=<%=member.getUserid() %> />
	<input type="hidden" name="name" value=<%=member.getName() %> />
	<input type="hidden" name="email" value=<%=member.getEmail() %> />
	<input type="hidden" name="joindate" value=<%=member.getJoindate() %> />
	<tr align=center>
		<td>비밀번호 : </td>
		<td><input type="password" name="pwd" value=<%=member.getPwd() %>></td>
	</tr>
	<tr align=center>
		<td>전화번호 : </td>
		<td><input type="text" name="phone" value=<%=member.getPhone() %> /></td>
	</tr>
	
	<tr align=center>
		<td>이메일 주소 : </td>
		<td><%=member.getEmail() %></td>
	</tr>
	<tr align=center>
		<td>현재 응원팀 : </td>
		<td><%=member.getTeam_name() %><br>
			<input type="radio" name="team_no_fk" value="0"/>무소속
			<input type="radio" name="team_no_fk" value="1"/>삼성
			<input type="radio" name="team_no_fk" value="2"/>넥센
			<input type="radio" name="team_no_fk" value="3"/>NC
			<input type="radio" name="team_no_fk" value="4"/>LG
			<input type="radio" name="team_no_fk" value="5"/>SK
			<input type="radio" name="team_no_fk" value="6"/>두산
			<input type="radio" name="team_no_fk" value="7"/>롯데
			<input type="radio" name="team_no_fk" value="8"/>KIA
			<input type="radio" name="team_no_fk" value="9"/>한화
			<input type="radio" name="team_no_fk" value="10"/>KT
		</td>
		<%-- <td><%=member.getTeam_name() %><br>
			<%
	for(int i=0;i<memberlist.size();i++){ 
	MemberBean member=(MemberBean)memberlist.get(i);
	%>
	
		<td align=center>
			<a href="MemberViewAction.me?userid=<%=member.getUserid() %>">
				<%=member.getUserid() %>
			</a>
		</td>
		<td>
		<a href="MemberDeleteAction.me?userid=<%=member.getUserid() %>">삭제</a>
		</td>
	
	<%} %>
			<input type="radio" name="team_no_fk" value="0" checked/>무소속
			<input type="radio" name="team_no_fk" value="1"/>삼성
			<input type="radio" name="team_no_fk" value="2"/>넥센
			<input type="radio" name="team_no_fk" value="3"/>NC
			<input type="radio" name="team_no_fk" value="4"/>LG
			<input type="radio" name="team_no_fk" value="5"/>SK
			<input type="radio" name="team_no_fk" value="6"/>두산
			<input type="radio" name="team_no_fk" value="7"/>롯데
			<input type="radio" name="team_no_fk" value="8"/>KIA
			<input type="radio" name="team_no_fk" value="9"/>한화
			<input type="radio" name="team_no_fk" value="10"/>KT
		</td> --%>
	</tr>
	
	<tr align=center>
		<td>가입일 : </td>
		<td><%=member.getJoindate() %></td>
	</tr>
	<tr align=center>
		<td>
			<!-- <a href="MemberUpdateAction.me">수정하기</a> -->
			<!-- <a href="javascript:updateform.submit()">수정하기</a> -->
			<input type="button" name="update" value="수정하기" onclick="dataCheck()">
		</td>
		<td>
			<a href="BoardList.bo">리스트로 돌아가기</a>
		</td>
	</tr>
	</form>
</table>

</center>
</body>
</html>