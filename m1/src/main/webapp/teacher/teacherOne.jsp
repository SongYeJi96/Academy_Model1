<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.TeacherDao"%>
<%@ page import="vo.Teacher"%>
<%
	// 요청값(teacherNo) 유효성 검사
	if(request.getParameter("teacherNo") == null
		|| request.getParameter("teacherNo").equals("")){
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
		return;
	}

	// 값 저장
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	
	// TeacherDao Method
	TeacherDao teacherDao = new TeacherDao();

	/* 강사 1명 상세 정보 조회
	* teacher에 teacherDao.selectTeacherOne 리턴값 저장
	*/
	Teacher teacher = teacherDao.selectTeacherOne(teacherNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 강사 1명 상세 정보 출력 -->
	<div>
		<table>
			<tr>
				<td>강사 번호</td>
				<td>
					<%=teacher.getTeacherNo()%>
				</td>
			</tr>
			<tr>
				<td>강사 Id</td>
				<td>
					<%=teacher.getTeacherId()%>
				</td>
			</tr>
			<tr>
				<td>강사 성명</td>
				<td>
					<%=teacher.getTeacherName()%>
				</td>
			</tr>
			<tr>
				<td>강사 연혁</td>
				<td>
					<%=teacher.getTeacherHistory()%>
				</td>
			</tr>
			<tr>
				<td>등록일</td>
				<td>
					<%=teacher.getCreatedate().substring(0, 10)%>
				</td>
			</tr>
			<tr>
				<td>수정일</td>
				<td>
					<%=teacher.getUpdatedate().substring(0, 10)%>
				</td>
			</tr>
		</table>
	</div>
	<div>
		<a href="<%=request.getContextPath()%>/teacher/modifyTeacher.jsp?teacherNo=<%=teacher.getTeacherNo()%>">수정</a>
		<a href="<%=request.getContextPath()%>/teacher/removeTeacherAction.jsp?teacherNo=<%=teacher.getTeacherNo()%>">삭제</a>
	</div>
</body>
</html>