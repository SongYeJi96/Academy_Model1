<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.TeacherDao"%>
<%
	//request 인코딩
	request.setCharacterEncoding("utf-8");	
	
	// 요청값 유효성 검사(teacherNo)
	if(request.getParameter("teacherNo") == null
		|| request.getParameter("teacherNo").equals("")){
			response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");		
	}
	
	// 값 저장
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	
	// TeacherDao Method
	TeacherDao teacherDao = new TeacherDao();
	
	/* 변수 row에 teacherDao.removeTeacher(teacherNo) 리턴값 저장
	* redirection delete 성공, 실패 상관없이 teacherList.jsp 페이지로 이동.
	*/ 
	int row = teacherDao.removeTeacher(teacherNo);

	if(row == 0){
		System.out.println(row +"<-- removeTeacherAction.jsp 삭제 실패");
	}else if(row == 1){
		System.out.println(row +"<-- removeTeacherAction.jsp 삭제 성공");
	}else {
		System.out.println("error row값 : "+row);
	}
	response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
%>