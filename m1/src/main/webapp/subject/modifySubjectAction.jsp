<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%
	// request 인코딩
	request.setCharacterEncoding("utf-8");
	
	/* 요청값(subjectNo) 유효성 검사
	* 값이 null, "" 이면 subjectList.jsp 페이지로 리턴
	*/
	if(request.getParameter("subjectNo") == null
		|| request.getParameter("subjectNo").equals("")){
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp");
		return;
	}
	
	// 값 저장
	int subjectNo = Integer.parseInt(request.getParameter("subjectNo"));
	System.out.println(subjectNo +"<-- modifySubjectAction.jsp subjectNo");
	
	/* 요청값 유효성 검사
	* 값이 null, "" 이면 modifySubject.jsp 페이지로 리턴
	*/
	if(request.getParameter("subjectName") == null
		|| request.getParameter("subjectTime") == null
		|| request.getParameter("subjectName").equals("")
		|| request.getParameter("subjectTime").equals("")){
		response.sendRedirect(request.getContextPath()+"/subject/modifySubject.jsp");
		return;
	}
	
	// 값 저장
	String subjectName = request.getParameter("subjectName");
	int subjectTime = Integer.parseInt(request.getParameter("subjectTime"));
	// 디버깅 코드
	System.out.println(subjectName +"<-- modifySubjectAction.jsp subjectName");
	System.out.println(subjectTime +"<-- modifySubjectAction.jsp subjectTime");
	
	// vo.subject 모델 만들어 값 저장
	Subject subject = new Subject();
	subject.setSubjectNo(subjectNo);
	subject.setSubjectName(subjectName);
	subject.setSubjectTime(subjectTime);
	
	// subjectDao Method
	SubjectDao subjectDao = new SubjectDao();
	
	/* redirection. 
	* row의 teacherDao.modifySubject(teacher) 후 변수 row의 값 저장. 값에 따른 페이지 이동.
	* row == 0 : modifySubject.jsp?subjectNo=subjectNo
	* row == 1 : subjectOne.jsp?subjectNo=subjectNo
	*/
	int row = subjectDao.addSubject(subject);
	System.out.println(row+"<--modifySubjectAction.jsp row");
	
	if(row == 0){
		response.sendRedirect(request.getContextPath()+"/subject/modifySubject.jsp?subjectNo="+subjectNo);
		System.out.println("modifySubject 실패");
	}else if(row == 1){ 
		response.sendRedirect(request.getContextPath()+"/subject/subjectOne.jsp?subjectNo="+subjectNo);
		System.out.println("modifySubject 성공");
	}else {
		System.out.println("error row값 : "+row);
	}
%>
