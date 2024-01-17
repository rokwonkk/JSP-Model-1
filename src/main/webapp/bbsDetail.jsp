<%@ page import="dto.MemberDto" %>
<%@ page import="dao.BbsDao" %>
<%@ page import="dto.BbsDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    MemberDto login = (MemberDto) session.getAttribute("login");
    if (login == null) {
%>
<script>
    alert("로그인을 해 주십시오")
    location.href = "login.jsp";
</script>
<% } %>
<%
    String sseq = request.getParameter("seq");
    int seq = Integer.parseInt(sseq);

    BbsDao dao = BbsDao.getInstance();
//    List<BbsDto> list = dao.getBbsDetail(seq);

    //접속한 이력을 조사 !참고!
    //조회수 증가
    dao.readcount(seq);

    BbsDto dto = dao.getBbs(seq);
    System.out.println(dto.toString());
%>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            padding: 40px;
        }

        .mytable {
            width: 800px;
            border: 1px solid lightgray;
        }

        th {
            border: 1px solid lightgray;
            text-align: center;
            vertical-align: middle;
        }

        button {
            margin: 0 80px;
        }
    </style>
</head>
<body>

<h1 style="text-align: center">글 상세보기</h1>
<br/>
<div align="center">
    <table class="table mytable">
        <col width="200"/>
        <col width="400"/>
        <tr>
            <th>작성자</th>
            <td>
                <%=login.getId()%>
            </td>
        </tr>
        <tr>
            <th>작성일</th>
            <td><%=dto.getWdate()%>
        </tr>
        <tr>
            <th>조회수</th>
            <td><%=dto.getReadcount()%>
            </td>
        </tr>
        <tr>
            <th>제목</th>
            <td><%=dto.getTitle()%>
            </td>
        </tr>
        <tr>
            <th>내용</th>
            <td><textarea name="content" class="form-control" cols="50" rows="10"
                          readonly><%=dto.getContent()%></textarea>
            </td>
        </tr>
    </table>
    <br/>

    <%
        if (login.getId().equals(dto.getId())) {
    %>
    <button type="button" onclick="updateBbs(<%=dto.getSeq()%>)" class="btn btn-primary">글수정</button>
    <button type="button" onclick="deleteBbs(<%=dto.getSeq()%>)" class="btn btn-primary">글삭제</button>
    <%
        }
    %>
    <button type="button" onclick="answerBbs(<%=dto.getSeq()%>)" class="btn btn-primary">답글작성</button>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
    function updateBbs(seq){
        location.href = "bbsDetailUpdate.jsp?seq=" + seq;
    }

    function deleteBbs(seq){
        let Yn = confirm("정말 글을 삭제하시겠습니까?");
        if(!Yn){
            alert("삭제를 취소합니다");
            return;
        }
        location.href = "bbsDelete.jsp?seq=" + seq;
    }

    function answerBbs(seq) {
        location.href = "answer.jsp?seq=" + seq;
    }
</script>
</body>
</html>
