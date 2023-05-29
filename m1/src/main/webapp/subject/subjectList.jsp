<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*"%>
<%
	/* subjectList 페이징
	* currentPage : 현재 페이지
	* rowPerPage : 페이지당 출력할 행의 수
	* beginRow : 시작 행번호
	* totalRow : 전체 행의 수
	* lastPage : 마지막 페이지를 담을 변수. totalRow(전체 행의 수) / rowPerPage(한 페이지에 출력되는 수)
	* totalRow % rowPerPage의 나머지가 0이 아닌경우 lastPage +1을 해야한다.
	*/
	
	int currentPage = 1;

	// currentPage 유효성 검사
	if(request.getParameter("currentPage") != null){
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	System.out.println(currentPage + "<-- subjectList.jsp currentPage");
	
	// SubjectDao Method
	SubjectDao subjectDao = new SubjectDao();
	
	int rowPerPage = 10;
	int beginRow = (currentPage-1)*rowPerPage;
	int totalRow = subjectDao.selectSubjectCnt();
	int lastPage = totalRow / rowPerPage;
	
	if(totalRow % rowPerPage != 0){
		lastPage +=1;
	}
	
	/* 페이지 블럭
	* currentBlock : 현재 페이지 블럭
	* pageLength : 현제 페이지 블럭의 들어갈 페이지 수
	* totalPage : 총 페이지 개수
	* totalPage가 0이면 페이지가 없으므로 totalPage = 1페이지로
	* startPage : 블럭의 시작 페이지 (currentBlock -1) * pageLength +1
	* endPage : 블럭의 마지막 페이지 startPage + pageLength -1
	* 맨 마지막 블럭에서는 끝지점에 도달하기 전에 페이지가 끝나기 때문에 아래와 같이 처리 
	* if(endPage > totalPage){endPage = totalPage;}
	*/
	
	int currentBlock = 0;
	int pageLength = 5;
	if(currentPage % pageLength == 0){
		currentBlock = currentPage / pageLength;
	}else{
		currentBlock = (currentPage / pageLength) +1;	
	}
	System.out.println(currentBlock+"<-- subjectList.jsp currentBlock");
	
	int totalPage = 0;
	if(totalRow % rowPerPage == 0){
		totalPage = totalRow / rowPerPage;
			
		if(totalPage == 0){
				totalPage = 1;
		}
	} else{
		totalPage = (totalRow / rowPerPage) +1;
	} 
	System.out.println(totalPage+"<-- subjectList.jsp totalPage");
	
	int startPage = (currentBlock -1) * pageLength +1;
	System.out.println(startPage+"<-- subjectList.jsp startPage");
	
	int endPage = startPage + pageLength -1;
	if(endPage > totalPage){
		endPage = totalPage;
	}
	System.out.println(endPage+"<-- subjectList.jsp endPage");
	
	/* 1페이지당 과목 리스트
	* list에 subject.selectSubjectListByPage 리턴값 저장
	*/ 
	ArrayList<Subject> subjectList = subjectDao.selectSubjectListByPage(beginRow, rowPerPage);
	
	/* 전체 행의 수
	* totalSubjectCnt에 subject.selectSubjectCnt 리턴값 저장
	*/
	int totalSubjectCnt = subjectDao.selectSubjectCnt();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/ba8d291cc0.js" crossorigin="anonymous"></script>
<style>
	<style>
	.pageNav{
		display: flex;
		margin: 30px;
		justify-content: center;
		align-items: center;
	}
	.pageNavLi:hover{
		background-color: #000042;
		color: #FFFFFF;
    	cursor: pointer;
	}
	.currentPageNav{
		background-color: #000042;
		color: #FFFFFF;
	}
	.subjectListTr:hover{
		background-color:#F6F6F6;
		cursor: pointer;
	}
	thead{
		background-color: #000042;
		color: #FFFFFF;
	}
</style>
</head>
<body>
<div>
	<div>
		<h3>과목 리스트(총 <%=totalSubjectCnt%> 과목)</h3>
	</div>
	<div class="container">
		<table class="table table-sm">
			<thead>
				<tr>
					<th>번호</th>
					<th>과목명</th>
					<th>수업시간</th>
				</tr>
			</thead>
			<%
				for(Subject s : subjectList){
			%>		
				<tr class="subjectListTr" onclick="location.href='<%=request.getContextPath()%>/subject/subjectOne.jsp?subjectNo=<%=s.getSubjectNo()%>'">
					<td><%=s.getSubjectNo()%></td>
					<td><%=s.getSubjectName()%></td>
					<td><%=s.getSubjectTime()%></td>
				</tr>
			<%	
				}
			%>
		</table>
	</div>
	<div>
		<button type="button" onclick="location.href='<%=request.getContextPath()%>/subject/addSubject.jsp'">과목 추가</button>
	</div>
	
	<!-- 페이지 네비게이션 -->
	<div class="pageNav">
		<ul class="list-group list-group-horizontal">
			<%
				if(startPage > 1){
			%>
					<li class="list-group-item pageNavLi" onclick="location.href='<%=request.getContextPath()%>/subject/subjectList.jsp?currentPage=<%=startPage-pageLength%>'">
						<span>이전</span>
					</li>
			<%		
				}
					for(int i = startPage; i <= endPage; i++){
						if(i == currentPage){
			%>
							<li class="list-group-item currentPageNav">
								<span><%=i%></span>
							</li>
			<%
						} else{
			%>
					<li class="list-group-item pageNavLi" onclick="location.href='<%=request.getContextPath()%>/subject/subjectList.jsp?currentPage=<%=i%>'">
						<span><%=i%></span>
					</li>
			<%			
					}
				}
					if(endPage != lastPage){
			%>
						<li class="list-group-item pageNavLi" onclick="location.href='<%=request.getContextPath()%>/subject/subjectList.jsp?currentPage=<%=startPage+pageLength%>'">
							<span>다음</span>
						</li>	
			<%			
					}
			%>
		</ul>
	</div>	
</div>
</body>
</html>