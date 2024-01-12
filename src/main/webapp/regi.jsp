<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>regi(account).jsp</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <style>
        .center {
            margin: auto;
            width: 60%;
            border: 2px solid;
            padding: 10px;
        }
    </style>

</head>
<body>

<h2>회원가입</h2>

<div class="center">

    <form action="regiAf.jsp" method="post">
        <table border="1">
            <tr>
                <th>아이디</th>
                <td>
                    <input type="text" name="id" id="id" size="20"><br/>
                    <p id="idcheck" style="font-size: 8px"></p>
                    <button type="button" id="id_Chk_Btn">id확인</button>
                </td>
            </tr>
            <tr>
                <th>패스워드</th>
                <td>
                    <input type="password" name="pw" size="20">
                </td>
            </tr>
            <tr>
                <th>이름</th>
                <td>
                    <input type="text" name="name" size="20">
                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>
                    <input type="email" name="email" size="20">
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="회원가입">
                </td>
            </tr>
        </table>
    </form>

</div>

<script>
    // ajax
    $(document).ready(function () {
        $("#id_Chk_Btn").click(function () {
            // alert('click');

            // id 빈칸 검사!!

            $.ajax({
                url: "idcheck.jsp",
                type: "post",
                data: {"id": $("#id").val()},
                success: function (data) {
                    // alert('success');
                    // alert(data.trim());

                    if (data.trim() == "YES") {
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




