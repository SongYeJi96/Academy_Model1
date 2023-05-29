<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 과목 등록 폼 -->
	<form action="<%=request.getContextPath()%>/subject/addSubjectAction.jsp">
		<div>
			<table>
				<tr>
					<td>과목명</td>
					<td>
						<input type ="text" name="subjectName">
					</td>
				</tr>
				<tr>
					<td>수업시간</td>
					<td>
						<input type ="text" name="subjectTime">
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