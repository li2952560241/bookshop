<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>校园二手书交易平台登录页面</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/login.css">
</head>
<body>
<div id="login-container">
    <h2>校园二手书交易平台</h2>
    <br />
    <form id="login-form">
        <input type="text" id="studentid" class="userName" placeholder="学号"><br/>
        <input type="password" id="password" class="password" placeholder="密码"><br/>
        <a class="forgetPass" href="users/forgetPassword" >忘记密码?</a><br/>
        <a  href="users/enroll" ><input type="button" class="loginBtn" value="注册"></a><br/>
        <button class="loginBtn" id="login-button" type="submit">登录</button><br/>
<%--        这个ID用来对登录操作进行处理的--%>

        <%--            登录验证用的是ajax加js进行处理的 --%>
    </form>
    <p id="errorInfo"></p>
</div>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.js"></script>
<script type="text/javascript">
    $(function() {
        $('#login-button').click(function (event) {
            event.preventDefault(); // 阻止表单的默认提交行为
            $('#errorInfo').html(""); // 清空错误信息
            var studentid_ = $('#studentid').val();
            var password_ = $('#password').val();
            if (studentid_.length == 0 || password_.length == 0) {
                $('#errorInfo').html("学号或密码不能为空！");
                return false;
            }

            var user_ = {"studentid": studentid_, "password": password_};
            var jsonData = JSON.stringify(user_);
            $.ajax({
                type: "POST", // 请求类型为 POST
                url: "/users/sessions", // 请求的 URL，即服务器端处理登录请求的地址
                async: false, // 请求是同步的，设置为 false，意味着在请求完成之前，浏览器会停止其他操作
                dataType: "json", // 预期服务器返回的数据类型为 JSON
                contentType: "application/json;charset=UTF-8", // 请求头中设置内容类型为 JSON，并指定字符编码为 UTF-8
                data: jsonData, // 请求体中的数据，即用户输入的学号和密码，已被转换为 JSON 格式的字符串
                success: function (result) { // 请求成功后的回调函数
                    if (result.resultCode == 200) { // 如果服务器返回的 resultCode 为 200，表示登录成功
                        location.href = "home.do"; // 跳转到主页
                    } else { // 如果 resultCode 不是 200，表示登录失败
                        $('#errorInfo').html(result.message); // 在页面上显示错误信息
                    }
                }
            });
        });
    });
</script>
</body>
</html>
