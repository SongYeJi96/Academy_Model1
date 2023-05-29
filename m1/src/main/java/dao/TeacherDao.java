package dao;

import java.sql.*;
import java.util.*;
import util.DBUtil;
import vo.Teacher;

public class TeacherDao {
	
	/* 강사목록 조회
	* group_concat(문자컬럼) : MariaDB에만 있는 group by 집계함수(문자열 집계함수). 함수 사용 하여 subjectName 조회
	* 교과목이 연결되지 않은 강사는 출력되지 않는다. LEFT OUTER JOIN 사용, nvl() 함수 사용하여 null값 공백으로 변경
	* ORDER BY t.teacher_no desc, LIMIT beginRow, rowPerPage
	*/ 
	public ArrayList<HashMap<String, Object>> selectTeacherListByPage(int beginRow, int rowPerPage) throws Exception{
		
		ArrayList<HashMap<String,Object>> list = new ArrayList<>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "SELECT t.teacher_no teacherNo, t.teacher_id teacherId, t.teacher_name teacherName, GROUP_CONCAT(nvl(s.subject_name, '')) subjectName\r\n"
				+ "FROM teacher t LEFT OUTER JOIN teacher_subject ts\r\n"
				+ "ON t.teacher_no = ts.teacher_no\r\n"
				+ "LEFT OUTER JOIN subject s\r\n"
				+ "ON ts.subject_no = s.subject_no\r\n"
				+ "GROUP BY t.teacher_no, t.teacher_id, t.teacher_name\r\n"
				+ "ORDER BY t.teacher_no desc LIMIT ?, ?";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,beginRow);
		stmt.setInt(2,rowPerPage);
		System.out.println(stmt + "<-- TeacherDao.java selectTeacherListByPage stmt");
		
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<>();
			m.put("teacherNo", rs.getInt("teacherNo"));
			m.put("teacherId", rs.getString("teacherId"));
			m.put("teacherName", rs.getString("teacherName"));
			m.put("subjectName", rs.getString("subjectName"));
			list.add(m);
		}
		
		return list;
	}
	
	// 강사 1명 상세 조회
	public Teacher selectTeacherOne(int teacherNo) throws Exception {
		Teacher teacher = null;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "SELECT teacher_no teacherNo, teacher_id teacherId, teacher_name teacherName, teacher_history teacherHistory, createdate, updatedate\r\n"
						+ "FROM teacher WHERE teacher_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, teacherNo);
		System.out.println(stmt + "<-- TeacherDao.java selectTeacherOne stmt");
		
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			teacher = new Teacher();
			teacher.setTeacherNo(rs.getInt("teacherNo"));
			teacher.setTeacherId(rs.getString("teacherId"));
			teacher.setTeacherName(rs.getString("teacherName"));
			teacher.setTeacherHistory(rs.getString("teacherHistory"));
			teacher.setCreatedate(rs.getString("createdate"));
			teacher.setUpdatedate(rs.getString("updatedate"));
		}
		
		return teacher;
	}
	
	// 강사 정보등록
	public int addTeacher(Teacher teacher) throws Exception {
		int row = 0;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "INSERT INTO teacher(teacher_id, teacher_name, teacher_history, createdate, updatedate) VALUES(?, ?, ?, NOW(), NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,teacher.getTeacherId() );
		stmt.setString(2, teacher.getTeacherName());
		stmt.setString(3, teacher.getTeacherHistory());
		System.out.println(stmt + "<-- TeacherDao.java addTeacher stmt");
		
		row = stmt.executeUpdate();
		System.out.println(row + "<-- TeacherDao.java addTeacher stmt row");
		
		return row;	
	}
	
	
	// 강사 정보수정
	public int modifyTeacher(Teacher teacher) throws Exception {
		
		int row = 0;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "UPDATE teacher SET teacher_id = ? , teacher_name = ?, teacher_history = ?, updatedate = NOW( ) WHERE teacher_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, teacher.getTeacherId());
		stmt.setString(2, teacher.getTeacherName());
		stmt.setString(3, teacher.getTeacherHistory());
		stmt.setInt(4, teacher.getTeacherNo());
		System.out.println(stmt + "<-- SubjectDao.java modifyTeacher stmt");
		
		row = stmt.executeUpdate();
		System.out.println(row + "<-- SubjectDao.java modifyTeacher row");
		
		return row;
	}
	
	// 강사 정보삭제
	public int removeTeacher(int teacherNo) throws Exception {
		
		int row  =0;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "DELETE FROM teacher WHERE teacher_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, teacherNo);
		System.out.println(stmt + "<-- TeacherDao.java removeTeacher stmt");
		
		row = stmt.executeUpdate();
		System.out.println(row + "<-- TeacherDao.java removeTeacher row");
		
		return row;
	}
	
	// 강사 전체 행의 수
	public int selectTeacherCnt() throws Exception {
		
		int totalrow = 0;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "SELECT COUNT(*) FROM teacher";
		PreparedStatement stmt = conn.prepareStatement(sql);
		System.out.println(stmt + "<-- TeachertDao.java selectTeacherCnt stmt");
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			totalrow = rs.getInt(1);
		}
		System.out.println(totalrow + "<-- TeachertDao.java selectTeacherCnt stmt totalrow");
		
		return totalrow;
	}
}
