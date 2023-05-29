<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.TeacherDao"%>
<%@ page import="vo.Teacher"%>
<%
	// request 인코딩
	request.setCharacterEncoding("utf-8");

	/* 요청값 유효성 검사
	* 값이 null, "" 이면 addTeacher.jsp 페이지로 리턴
	*/
	
	if(request.getParameter("teacherId") == null
		|| request.getParameter("teacherName") == null
		|| request.getParameter("teacherHistory") == null
		|| request.getParameter("teacherId").equals("")
		|| request.getParameter("teacherName").equals("")
		|| request.getParameter("teacherHistory").equals("")){
		response.sendRedirect(request.getContextPath()+"/teacher/addTeacher.jsp");
		return;
	}
	
	// 값 저장
	String teacherId = request.getParameter("teacherId");
	String teacherName = request.getParameter("teacherName");
	String teacherHistory = request.getParameter("teacherHistory");
	// 디버깅 코드
	System.out.println(teacherId + "addTeacherAction.jsp teacherId");
	System.out.println(teacherName + "addTeacherAction.jsp teacherName");
	System.out.println(teacherHistory + "addTeacherAction.jsp teacherHistory");
	
	// vo.Teacher 모델 만들어 값 저장
	Teacher teacher = new Teacher();
	teacher.setTeacherId(teacherId);
	teacher.setTeacherName(teacherName);
	teacher.setTeacherHistory(teacherHistory);
	
	// TeacherDao Method
	TeacherDao teacherDao = new TeacherDao();
	
	/* redirection.
	* row의 teacherDao.insertTeacher(teacher) 후 변수 row의 값 저장. 값에 따른 페이지 이동.
	* row == 0 : addTeacher.jsp 
	* row == 1 : teacherList.jsp
	*/
	int row = teacherDao.addTeacher(teacher);
	System.out.println(row+"<--addTeacherAction.jsp row");
	
	if(row == 0){
		response.sendRedirect(request.getContextPath()+"/teacher/addTeacher.jsp");
		System.out.println("addTeacher 실패");
	}else if(row == 1){ 
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp?");
		System.out.println("addTeacher 성공");
	}else {
		System.out.println("error row값 : "+row);
	}
%>