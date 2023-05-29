<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*"%>
<%
	//request 인코딩
	request.setCharacterEncoding("utf-8");

	/* 요청값 유효성 검사
	* 값이 null, "" 이면 addSubject.jsp 페이지로 리턴
	*/
	
	if(request.getParameter("subjectName") == null
		|| request.getParameter("subjectTime") == null
		|| request.getParameter("subjectName").equals("")
		|| request.getParameter("subjectTime").equals("")){
		response.sendRedirect(request.getContextPath()+"/subject/addSubject.jsp");
		return;
	}
	
	// 값 저장
	String subjectName = request.getParameter("subjectName");
	int subjectTime = Integer.parseInt(request.getParameter("subjectTime"));
	// 디버깅 코드
	System.out.println(subjectName + "<-- addSubjetAction.jsp subjectName");
	System.out.println(subjectTime + "<-- addSubjetAction.jsp subjectTime");
	
	// vo.subject 모델 만들어 값 저장
	Subject subject = new Subject();
	subject.setSubjectName(subjectName);
	subject.setSubjectTime(subjectTime);
	
	// subjectDao Method
	SubjectDao subjectDao = new SubjectDao();
	
	/* redirection.
	* row의 teacherDao.addTeacher(teacher) 후 변수 row의 값 저장. 값에 따른 페이지 이동.
	* row == 0 : addSubject.jsp
	* row == 1 : subjectList.jsp 
	*/
	int row = subjectDao.addSubject(subject);
	System.out.println(row+"<--addSubjectAction.jsp row");
	
	if(row == 0){
		response.sendRedirect(request.getContextPath()+"/subject/addSubject.jsp");
		System.out.println("addSubject 실패");
	}else if(row == 1){ 
		response.sendRedirect(request.getContextPath()+"/subject/subjectList.jsp?");
		System.out.println("addSubject 성공");
	}else {
		System.out.println("error row값 : "+row);
	}
	
%>