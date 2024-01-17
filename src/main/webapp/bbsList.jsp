<%@ page import="dao.BbsDao" %>
<%@ page import="java.util.List" %>
<%@ page import="dto.BbsDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    // 제목이 길 경우에  ... 로 표현하는 함수
    public String dot3(String title) {
        String str = "";

        if (title.length() >= 35) {
            str = title.substring(0, 35);
            str += "...";
        } else {
            str = title.trim();
        }
        return str;
    }

    //답글의 화살표와 공백을 추가하는 함수
    public String arrow(int depth){

        String rs = "<img src='./images/arrow1.png' width='20px' height='20px'/>";
        String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";

        String ts = "";
        for (int i = 0; i < depth; i++) {
            ts += nbsp;
        }
        return depth == 0 ? "" : ts + rs;
    }
%>
<%
    String choice = request.getParameter("choice");
    String search = request.getParameter("search");

    if (choice == null) {
        choice = "";
    }
    if (search == null) {
        search = "";
    }

    //페이지 넘버
    String sPageNumber = request.getParameter("pageNumber");
    int pageNumber = 0;
    if (sPageNumber != null && !sPageNumber.isEmpty()) {
        pageNumber = Integer.parseInt(sPageNumber);
    }

    BbsDao dao = BbsDao.getInstance();
//    List<BbsDto> list = dao.getBbsList();
//    List<BbsDto> list = dao.getBbsSearchList(choice, search);
    List<BbsDto> list = dao.getBbsPageList(choice, search, pageNumber);

    //글의 총 수
    int count = dao.getAllBbs(choice, search);

    //페이지(수)를 계산 14 -> 2페이지 / 32 -> 4페이지
    int pageBbs = count / 10;
    if ((count % 10) > 0) {
        pageBbs = pageBbs + 1;
    }
%>
<html>
<head>
    <title>게시판</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .center {
            margin: auto;
            width: 1000px;
            text-align: center;
        }

        th {
            --bs-table-bg: lightblue;
            --bs-table-color: white;
        }

        tr {
            line-height: 24px;
        }

        td {
            text-align: center;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            <%--let choice = "<%=choice%>";--%>
            let search = "<%=search%>";

            // alert(choice);
            // alert(search);

            if(search !== ""){
                let choice = document.getElementById("choice");
                choice.value = "<%=choice%>";

                choice.setAttribute("selected", "selected");
            }
        });
    </script>
</head>
<body>

<h1 style="text-align: center; padding: 40px">게시판</h1>

<div class="center">
    <table class="table table-hover">
        <col width="70"/>
        <col width="600"/>
        <col width="100"/>
        <col width="150"/>
        <thead class="thead">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>조회수</th>
            <th>작성자</th>
        </tr>
        </thead>
            <%
    if(list == null || list.isEmpty()){
%>
        <tbody>
        <tr>
            <td colspan="4" style="text-align: center">작성된 글이 없습니다</td>
        </tr>
        <%
        } else {
            for (int i = 0; i < list.size(); i++) {
                BbsDto bbs = list.get(i);
        %>
        <tr>
            <td>
                <%=i + 1%>
            </td>
            <td style="text-align: left; padding-left: 10px">
                <%=arrow(bbs.getDepth())%>
                <%
                    if(bbs.getDel() == 0){
                %>
                <a href="bbsDetail.jsp?seq=<%=bbs.getSeq()%>"><%=dot3(bbs.getTitle())%>
                <%
                    } else {
                %>
                    <font color="red"> ***** 이 글은 작성자의 의해서 삭제된 글 입니다. *****</font>
                <%
                    }
                %>
                </a>
            </td>
            <td>
                <%=bbs.getReadcount()%>
            </td>
            <td>
                <%=bbs.getId()%>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
</div>
</table>
<%
    //페이지 랜더링
    for (int i = 0; i < pageBbs; i++) {
        if (pageNumber == i) { // 현재 페이지
%>
    <span style="font-size: 15pt; color: blue; font-weight: bold;">
            <%=i + 1%>
    </span>
<%
    } else {            //그 밖에 페이지
%>
    <a href="#none" title="<%=i + 1%>페이지" onclick="goPage(<%=i%>)"
       style="font-size: 15px; color: #000; font-weight: bold; text-decoration: none;">
        [<%=i + 1%>]
    </a>
<%
    }
}
%>

<br/><br/>

<select id="choice">
    <option value="">검색</option>
    <option value="title">제목</option>
    <option value="content">내용</option>
    <option value="writer">작성자</option>
</select>

<input type="text" id="search" size="20" value="<%=search%>">
<button type="button" onclick="searchBtn()">검색</button>
<br/><br/>

<a href="bbsWrite.jsp">글쓰기</a>
<script>
    function searchBtn() {
        // alert("zzz")
        let choice = document.getElementById("choice").value; //select
        let search = document.getElementById("search").value; //input

        // if (choice === ""){
        //     alert("카테고리를 선택해주십시오.");
        //     return;
        // }
        // if (search === ""){
        //     alert("검색어를 입력해주십시오.");
        //     return;
        // }

        location.href = "bbsList.jsp?choice=" + choice + "&search=" + search;
    }

    function goPage( pageNum ){

        let choice = document.getElementById("choice").value; //select
        let search = document.getElementById("search").value; //input

        location.href = "bbsList.jsp?choice=" + choice + "&search=" + search + "&pageNumber=" + pageNum;
    }
</script>
</body>
</html>