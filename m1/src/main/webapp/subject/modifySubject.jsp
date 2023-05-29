<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%
	// 요청값 유효성 검사(subjectNo)
	if(request.getParameter("subjectNo") == null
		|| request.getParameter("subjectNo").equals("")){
			response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");		
	}

	// 값 저장
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	System.out.println(subjectNo + "<-- modifySubject.jsp subjectNo");
	
	// SubjectDao Method
	SubjectDao subjectDao = new SubjectDao();
	
	/* 1과목 상세 정보 조회
	* subject에 subjectDao.selectSubjectOne 리턴값 저장
	*/ 
	Subject subject = subjectDao.selectSubjectOne(subjectNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, tr, th, td{
		border: 1px solid #000000;
	}
</style>
</head>
<body>
	<form action="<%=request.getContextPath()%>/subject/modifySubjectAction.jsp" method="post">
		<div>
			<table>
				<tr>
					<th>번호</th>
					<td>
						<input type="text" name="subjectNo" value="<%=subject.getSubjectNo()%>" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>과목명</th>
					<td>
						<input type="text" name="subjectName" value="<%=subject.getSubjectName()%>">
					</td>
				</tr>
				<tr>
					<th>수업시간</th>
					<td>
						<input type="text" name="subjectTime" value="<%=subject.getSubjectTime()%>">
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