<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>회원가입 페이지</title>
<script>
function idcheck(){
	
	
	var id=document.joinform.userid.value;
	window.open('./member/idcheck.jsp?userid='+id,'win',width="300", heigth="200");
}
function CheckData(){
	/* var title= document.myform.title;
	var content = document.myform.content; */
	
	var id= document.joinform.userid.value;
	if(id.length<4){
		alert("아이디가 너무 짧습니다.");
		document.joinform.userid.focus();
		return;
	}
	
	
	var pic= document.joinform.profile_pic.value;
	if(pic==""){
		alert("사진을 첨부하여 주십시오.");
		document.joinform.profile_pic.focus();
		return;
	}
	
	var nam= document.joinform.name.value;
	if(nam==""){
		alert("이름을 입력해주십시오.");
		document.joinform.name.focus();
		return;
	}
	
	var pwd= document.joinform.pwd.value;
	if(pwd==""){
		alert("비밀번호를 입력해주십시오.");
		document.joinform.pwd.focus();
		return;
	}else if(pwd.length<5){
		alert("비밀번호를 4자리 이상 입력해주십시오.");
		document.joinform.pwd.focus();
		return;
	}

	var chpwd= document.joinform.pwd1.value;
	if(chpwd==""){
		alert("비밀번호확인을 입력해주십시오.");
		document.joinform.pwd1.focus();
		return;
	}if(pwd!=chpwd){
		alert("비밀번호를 동일하게 입력해주십시오.");
		document.joinform.pwd1.focus();
		return;
	}
	
	var ph= document.joinform.phone.value;
	if(ph==""){
		alert("전화번호를 입력해주십시오.");
		document.joinform.phone.focus();
		return;
	}

	var mail= document.joinform.email.value;
	if(mail==""){
		alert("이메일을 입력해주십시오.");
		document.joinform.email.focus();
		return;
	}

	document.joinform.submit();
}
</script>

</head>
<body>
<form name="joinform" action="./MemberJoinAction.me" method="post" enctype="multipart/form-data">
<center>
<table border=1>
	<tr>
		<td colspan="2" align=center>
			<b><font size=5>회원가입 페이지</font></b>
		</td>
	</tr>
	<tr>
		<td>아이디 : </td>
		<td><input type="text" name="userid"/></td>
		<td><input type="button" name="useridcheck" onclick="idcheck()"/></td>
	</tr>
	<tr>
		<td>프로필사진 : </td>
		<td><input type="file" name="profile_pic"/></td>
	</tr>
	<tr>
		<td>이름 : </td>
		<td><input type="text" name="name"/></td>
	</tr>
	<tr>
		<td>비밀번호 : </td>
		<td><input type="password" name="pwd"/></td>
	</tr>
	<tr>
		<td>비밀번호 확인 : </td>
		<td><input type="password" name="pwd1"/></td>
	</tr>
	<tr>
		<td>전화번호(숫자만) : </td>
		<td><input type="text" name="phone" /></td>
	</tr>
	<tr>
		<td>이메일 주소 : </td>
		<td><input type="text" name="email" size=30/></td>
	</tr>
	<tr>
		<td>응원하는 팀 : </td>
		<td>
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
	<tr>
		<td colspan="2" align=center>
			<input type="button" value="회원가입" onclick="CheckData()">
			<!-- <a href="javascript:joinform.submit()">회원가입</a>&nbsp;&nbsp; -->
			<a href="javascript:joinform.reset()">다시작성</a>
		</td>
	</tr>
</table>
</center>
</form>
</body>
</html>