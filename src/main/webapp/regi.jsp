<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>regi(account).jsp</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <style>
        html {
            font-family: "Noto Sans KR", sans-serif;
            font-size: 16px;
            font-weight: 400;
        }

        * {
            box-sizing: border-box;
        }

        form {
            margin: 16px auto;
            width: 360px;
        }

        label {
            color: #2c2c2c;
            display: block;
            margin: 16px 0 8px;
        }

        input, textarea, select {
            border: 1px solid #d1d1d1;
            color: #000000;
            display: block;
            font-size: 16px;
            line-height: 24px;
            margin: 8px 0;
            padding: 16px 24px;
            width: 100%;
        }

        input[type="radio"],
        input[type="checkbox"] {
            display: inline-block;
            width: initial;
        }

        button, #submit {
            background: #2c2c2c;
            border: none;
            color: #ffffff;
            display: block;
            font-size: 18px;
            font-weight: 700;
            margin: 24px 0;
            padding: 16px;
            width: 100%;
            cursor: pointer;
        }

        .login-title {
            color: #4e4e4e;
            font-size: 36px;
            font-weight: 700;
            margin: 24px 0;
            text-align: center;
        }

    </style>

</head>
<body>

<h1 class="login-title">회원가입</h1>

<div class="center">
    <form action="regiAf.jsp" method="post">
        <label for="id">아이디</label>
        <input id="id" name="id" style="width: 100%;">
        <p id="idcheck" style="font-size: 12px"></p>
        <button type="button" id="id_Chk_Btn" style="width: 20%; border-radius: 15px; font-size: 12px; padding: 10px">id확인</button>

        <label for="pw">비밀번호</label>
        <input id="pw" name="pw" type="password">

        <label for="name">이름</label>
        <input id="name" name="name">

        <label for="email">이메일</label>
        <input id="email" name="email" type="email">

        <input type="submit" id="submit" value="가입하기">
<%--        <table border="1">--%>
<%--            <tr>--%>
<%--                <th>아이디</th>--%>
<%--                <td>--%>
<%--                    <input type="text" name="id" id="id" size="20"><br/>--%>
<%--                    <p id="idcheck" style="font-size: 8px"></p>--%>
<%--                    <button type="button" id="id_Chk_Btn">id확인</button>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <th>패스워드</th>--%>
<%--                <td>--%>
<%--                    <input type="password" name="pw" size="20">--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <th>이름</th>--%>
<%--                <td>--%>
<%--                    <input type="text" name="name" size="20">--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <th>이메일</th>--%>
<%--                <td>--%>
<%--                    <input type="email" name="email" size="20">--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td colspan="2" align="center">--%>
<%--                    <input type="submit" value="회원가입">--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--        </table>--%>
    </form>

</div>

<script>
    // ajax
    $(document).ready(function () {
        $("#id_Chk_Btn").click(function () {
            // alert('click');
            // id 빈칸 검사!!

            let id = document.getElementById("id").value;
            if (id === "") {
                alert("아이디를 기입해 주십시오.");
                return;
            }

            $.ajax({
                url: "idcheck.jsp",
                type: "post",
                data: {"id": $("#id").val()},
                success: function (data) {
                    // alert('success');
                    // alert(data.trim());

                    if (data.trim() === "YES") {
                        $("#idcheck").css("color", "#0000ff");
                        $("#idcheck").text("사용할 수 있는 아이디입니다");
                    } else {
                        $("#idcheck").css("color", "#ff0000");
                        $("#idcheck").text("사용중인 아이디입니다");
                        $("#id").val("");
                    }
                },
                error: function () {
                    alert('error');
                }
            });
        });
    });
</script>


</body>
</html>




