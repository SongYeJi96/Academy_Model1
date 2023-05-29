<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 강사 등록 폼 -->
	<form action="<%=request.getContextPath()%>/teacher/addTeacherAction.jsp">
		<div>
			<table>
				<tr>
					<td>강사 Id</td>
					<td>
						<input type ="text" name="teacherId">
					</td>
				</tr>
				<tr>
					<td>강사 성명</td>
					<td>
						<input type ="text" name="teacherName">
					</td>
				</tr>
				<tr>
					<td>강사 연혁</td>
					<td>
						<textarea rows="5" cols="80" name="teacherHistory"></textarea>
					</td>
				</tr>
			</table>
		</div>
		<div>
			<button type="submit">등록</button>
		</div>
	</form>
</body>
</html>