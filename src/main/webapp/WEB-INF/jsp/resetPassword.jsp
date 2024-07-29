<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>重置密码</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css">
</head>
<body>
<div id="reset-container">
    <h2>重置密码</h2>
    <form id="reset-form">
        <input type="email" id="email" name="email" placeholder="请输入您的电子邮件"><br/>
        <button class="resetBtn" type="submit">发送重置链接</button>
    </form>
    <p id="resetInfo"></p>
</div>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.js"></script>
<script type="text/javascript">
    $(function() {
        $('#reset-form').submit(function (event) {
            event.preventDefault(); // 阻止表单的默认提交行为
            $('#resetInfo').html("");
            var email = $('#email').val();
            if (email.length == 0) {
                $('#resetInfo').html("电子邮件不能为空！");
                return false;
            }

            var data = {"email": email};
            var jsonData = JSON.stringify(data);
            $.ajax({
                type: "POST",
                url: "/users/reset-password",
                async: false,
                dataType: "json",
                contentType: "application/json;charset=UTF-8",
                data: jsonData,
                success: function (result) {
                    if (result.resultCode == 200) {
                        $('#resetInfo').html("重置链接已发送到您的电子邮件！");
                    } else {
                        $('#resetInfo').html(result.message);
                    }
                }
            });
        });
    });
</script>
</body>
</html>
