<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.TeacherDao"%>
<%@ page import="vo.Teacher"%>
<%
	// request 인코딩
	request.setCharacterEncoding("utf-8");
	
	/* 요청값(teacherNo) 유효성 검사
	* 값이 null, "" 이면 teacherList.jsp 페이지로 리턴
	*/
	if(request.getParameter("teacherNo") == null
		|| request.getParameter("teacherNo").equals("")){
		response.sendRedirect(request.getContextPath()+"/teacher/teacherList.jsp");
		return;
	}
	
	// 값 저장
	int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
	// 디버깅 코드
	System.out.println(teacherNo +"<-- modifyTeacherAction.jsp teacherNo");
	
	/* 요청값 유효성 검사
	* 값이 null, "" 이면 modifyTeacher.jsp 페이지로 리턴
	*/
	if(request.getParameter("teacherId") == null
		|| request.getParameter("teacherName") == null
		|| request.getParameter("teacherHistory") == null
		|| request.getParameter("teacherId").equals("")
		|| request.getParameter("teacherName").equals("")
		|| request.getParameter("teacherHistory").equals("")){
		response.sendRedirect(request.getContextPath()+"/teacher/modifyTeacher.jsp?teacherNo="+ teacherNo);
		return;
	}
	
	// 값 저장
	String teacherId = request.getParameter("teacherId");
	String teacherName = request.getParameter("teacherName");
	String teacherHistory = request.getParameter("teacherHistory");
	// 디버깅 코드
	System.out.println(teacherId +"<-- modifyTeacherAction.jsp teacherId");
	System.out.println(teacherName +"<-- modifyTeacherAction.jsp teacherName");
	System.out.println(teacherHistory +"<-- modifyTeacherAction.jsp teacherHistory");
	
	
	// vo.Teacher 모델 만들어 값 저장
	Teacher teacher = new Teacher();
	teacher.setTeacherNo(teacherNo);
	teacher.setTeacherId(teacherId);
	teacher.setTeacherName(teacherName);
	teacher.setTeacherHistory(teacherHistory);
	
	// TeacherDao Method
	TeacherDao teacherDao = new TeacherDao();
	
	/* redirection.
	* row의 teacherDao.modifyTeacher(teacher) 후 변수 row의 값 저장. 값에 따른 페이지 이동.
	* row == 0 : modifyTeacher.jsp?teacherNo=teacherNo
	* row == 1 : teacherOne.jsp?teacherNo=teacherNo
	*/
	int row = teacherDao.modifyTeacher(teacher);
	System.out.println(row+"<--modifyTeacherAction.jsp row");
	
	if(row == 0){
		response.sendRedirect(request.getContextPath()+"/teacher/modifyTeacher.jsp?teacherNo="+teacherNo);
		System.out.println("modifyTeacher 실패");
	}else if(row == 1){ 
		response.sendRedirect(request.getContextPath()+"/teacher/teacherOne.jsp?teacherNo="+teacherNo);
		System.out.println("modifyTeacher 성공");
	}else {
		System.out.println("error row값 : "+row);
	}
%>
