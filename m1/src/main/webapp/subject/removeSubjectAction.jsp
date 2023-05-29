<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="dao.*"%>
<%
	// request 인코딩
	request.setCharacterEncoding("utf-8");	

	// 요청값 유효성 검사(subjectNo)
	if(request.getParameter("subjectNo") == null
		|| request.getParameter("subjectNo").equals("")){
			response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");		
	}

	// 값 저장
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	System.out.println(subjectNo +"<-- removeSubjectAction.jsp subjectNo");
	
	// SubjectDao Method
	SubjectDao subject = new SubjectDao();
	
	/* 변수 row에 subject.removeSubject(subjectNo) 리턴값 저장
	* redirection delete 성공, 실패 상관없이 subjectList.jsp 페이지로 이동.
	*/ 
	int row = subject.removeSubject(subjectNo);
	
	if(row == 0){
		System.out.println(row +"<-- removeSubjectAction.jsp 삭제 실패");
	}else if(row == 1){
		System.out.println(row +"<-- removeSubjectAction.jsp 삭제 성공");
	}else {
		System.out.println("error row값 : "+row);
	}
	response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
%>
