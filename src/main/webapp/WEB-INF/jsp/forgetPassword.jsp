<%--
  Created by IntelliJ IDEA.
  User: 29525
  Date: 2024/7/28
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>忘记密码页面</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/login.css">
</head>
<body>
<h1>忘记密码页面</h1>
<form id="reset-form">
    <input type="text" id="studentid" class="userName" placeholder="学号"><br/>
    <input type="password" id="password1" class="password" placeholder="密码"><br/>
    <input type="password" id="password2" class="password" placeholder="重复密码"><br/>
    <input type="tel" id="tel" class="userName" placeholder="手机号"><br/>
    <button class="loginBtn" id="reset-button" type="submit">重置</button><br/>
    <a class="forgetPass" href="/users">返回登录页面</a><br/>
</form>
<p id="errorInfo" style="color: red;"></p>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.js"></script>
<script type="text/javascript">
    $(function() {
        $('#reset-button').click(function (event) {
            event.preventDefault(); // 阻止表单的默认提交行为
            $('#errorInfo').html(""); // 清空错误信息
            var studentid_ = $('#studentid').val();
            var password1_ = $('#password1').val();
            var password2_ = $('#password2').val();
            var tel_ = $('#tel').val();

            // 检查输入框是否为空
            if (studentid_.length === 0 || password1_.length === 0 || password2_.length === 0 || tel_.length === 0) {
                $('#errorInfo').html("输入框不能为空！");
                return false;
            }
            // 检查密码是否一致
            if (password1_ !== password2_) {
                $('#errorInfo').html("前后密码不一致！");
                return false;
            }

            // 构建用户对象
            var user = {
                studentid: studentid_,
                password: password1_,
                tel: tel_
            };

            // 发送AJAX请求
            $.ajax({
                url: '/users/resetPassword',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(user),
                success: function(response) {
                    if (response.success) {
                        alert("密码重置成功！");
                    } else {
                        $('#errorInfo').html(response.message);
                    }
                },
                error: function() {
                    $('#errorInfo').html("请求失败，请稍后再试！");
                }
            });
        });
    });
</script>

</body>
</html>
