<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>login</title>

    <!--
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
     -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <script src="http://lab.alexcican.com/set_cookies/cookie.js"></script>

    <style type="text/css">
        .center {
            margin: auto;
            width: 60%;
            border: 2px solid;
            padding: 10px;
        }
    </style>

</head>
<body>

<h2>login</h2>

<div class="center">
    <form action="loginAf.jsp" method="post">
        <table border="1">
            <tr>
                <th>아이디</th>
                <td>
                    <input type="text" id="id" name="id" size="20"><br/>
                    <input type="checkbox" id="chk_save_id">id 저장
                </td>
            </tr>
            <tr>
                <th>패스워드</th>
                <td>
                    <input type="password" name="pw" size="20">
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="login" value="log-in">&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="regi.jsp">회원가입</a>
                </td>
            </tr>
        </table>
    </form>
</div>

<script>
    /*
        cookie : client저장, id저장, pw저장, String 자료형 저장
        session : server저장, login 정보
    */

    let user_id = $.cookie("user_id");	// 쿠키에서 id를 산출
    if (user_id != null) {	// 쿠키에 저장한 id가 있다
        $("#id").val(user_id);
        $("#chk_save_id").prop("checked", true);
    }

    $("#chk_save_id").click(function () {

        if ($("#chk_save_id").is(":checked") == true) {	// 체크가 되었을 때

            if ($("#id").val().trim() == "") {	// 빈문자였을 때
                alert('id를 입력해 주십시오');
                $("#chk_save_id").prop("checked", false);	// 체크박스를 off
            } else {	// cookie에 저장
                $.cookie("user_id", $("#id").val().trim(), {expires: 7, path: '/'});
            }
        } else {
            $.removeCookie("user_id", {path: '/'});
        }

    });
</script>
</body>
</html>








