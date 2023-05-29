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
	<!-- 강사 수정 form -->
	<form action ="<%=request.getContextPath()%>/teacher/modifyTeacherAction.jsp" method="post">
		<div>
			<table>
				<tr>
					<td>강사 번호</td>
					<td>
						<input type ="text" name="teacherNo" value="<%=teacher.getTeacherNo()%>" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>강사 Id</td>
					<td>
						<input type="text" name="teacherId" value="<%=teacher.getTeacherId()%>">
					</td>
				</tr>
				<tr>
					<td>강사 성명</td>
					<td>
						<input type="text" name="teacherName" value="<%=teacher.getTeacherName()%>">
					</td>
				</tr>
				<tr>
					<td>강사 연혁</td>
					<td>
						<textarea rows="5" cols="80" name="teacherHistory"><%=teacher.getTeacherHistory()%></textarea>
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
			<button type="submit">수정</button>
		</div>
	</form>
</body>
</html>