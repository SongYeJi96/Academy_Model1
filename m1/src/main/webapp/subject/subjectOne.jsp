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
	System.out.println(subjectNo + "<--subjectOne.jsp subjectNo");
	
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
</head>
<body>
	<div>
		<table>
			<tr>
				<th>번호</th>
				<td><%=subject.getSubjectNo()%></td>
			</tr>
			<tr>
				<th>과목명</th>
				<td><%=subject.getSubjectName()%></td>
			</tr>
			<tr>
				<th>수업시간</th>
				<td><%=subject.getSubjectTime()%></td>
			</tr>
			<tr>
				<th>등록일</th>
				<td><%=subject.getCreatedate().substring(0,10)%></td>
			</tr>
			<tr>
				<th>수정일</th>
				<td><%=subject.getUpdatedate().substring(0,10)%></td>
			</tr>
		</table>
	</div>
	<div>
		<a href = "<%=request.getContextPath()%>/subject/modifySubject.jsp?subjectNo=<%=subject.getSubjectNo()%>">수정</a>
		<a href = "<%=request.getContextPath()%>/subject/removeSubjectAction.jsp?subjectNo=<%=subject.getSubjectNo()%>">삭제</a>
	</div>
</body>
</html>