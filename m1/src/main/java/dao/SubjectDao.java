package dao;

import java.sql.*;
import java.util.*;
import util.DBUtil;
import vo.Subject;

public class SubjectDao {
	
	// 과목목록 조회
	public ArrayList<Subject> selectSubjectListByPage(int beginRow, int rowPerPage) throws Exception {
		ArrayList<Subject> list = new ArrayList<>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "SELECT subject_no subjectNo, subject_name subjectName, subject_time subjectTime FROM subject ORDER BY subject_no DESC LIMIT ?, ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		System.out.println(stmt + "<-- SubjectDao.java selectSubjectList stmt");
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Subject s = new Subject();
			s.setSubjectNo(rs.getInt("subjectNo"));
			s.setSubjectName(rs.getString("subjectName"));
			s.setSubjectTime(rs.getInt("subjectTime"));
			list.add(s);
		}
		return list;
	}
	
	// 1과목 상세 조회
	public Subject selectSubjectOne(int subjectNo) throws Exception {
		Subject subject = null;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "SELECT subject_no subjectNo, subject_name subjectName, subject_time subjectTime, createdate, updatedate FROM subject WHERE subject_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, subjectNo);
		System.out.println(stmt + "<-- SubjectDao.java selectSubjectOne stmt");
		
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			subject = new Subject();
			subject.setSubjectNo(rs.getInt("subjectNo"));
			subject.setSubjectName(rs.getString("subjectName"));
			subject.setSubjectTime(rs.getInt("subjectTime"));
			subject.setCreatedate(rs.getString("createdate"));
			subject.setUpdatedate(rs.getString("updatedate"));
		}
		
		return subject;
	}
	
	// 과목 등록
	public int addSubject(Subject subject) throws Exception {
		int row = 0;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "INSERT INTO subject(subject_name, subject_time, createdate, updatedate) VALUES(?, ?, NOW(), NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, subject.getSubjectName());
		stmt.setInt(2, subject.getSubjectTime());
		System.out.println(stmt + "SubjectDao.java addSubject stmt");
		
		row = stmt.executeUpdate();
		System.out.println(row + "<-- SubjectDao.java addSubject row");
		
		return row;
	}
	
	// 과목 수정
	public int modifySubject(Subject subject) throws Exception {
		int row = 0;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "UPDATE subject SET subject_name = ?, subject_time = ?, updatedate = now() WHERE subject_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, subject.getSubjectName());
		stmt.setInt(1, subject.getSubjectTime());
		stmt.setInt(3, subject.getSubjectNo());
		System.out.println(stmt + "<-- SubjectDao.java modifySubject stmt");
		
		row = stmt.executeUpdate();
		System.out.println(row + "<-- SubjectDao.java modifySubject row");
		
		return row;
	}
	
	// 과목 삭제
	public int removeSubject(int subjectNo) throws Exception {
		int row = 0;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "DELETE FROM subject WHERE subject_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, subjectNo);
		System.out.println(stmt + "<-- SubjectDao.java removeSubject stmt");
		
		row = stmt.executeUpdate();
		System.out.println(row + "<-- SubjectDao.java removeSubject row");
		
		return row;
	}
	
	// 과목 전체 행의 수
	public int selectSubjectCnt() throws Exception {
		int totalrow = 0;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "SELECT COUNT(*) FROM subject";
		PreparedStatement stmt = conn.prepareStatement(sql);
		System.out.println(stmt + "<-- SubjectDao.java selectSubjectCnt stmt");
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			totalrow = rs.getInt(1);
		}
		System.out.println(totalrow + "<-- SubjectDao.java selectSubjectCnt totalrow");
		
		return totalrow;
	}
		
}
