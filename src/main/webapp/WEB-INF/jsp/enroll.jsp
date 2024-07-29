<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册页面</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            max-width: 600px;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .form-group input[type="radio"] {
            width: auto;
            margin-right: 5px;
        }
        .form-group select {
            height: 35px;
        }
        .button-container {
            text-align: center;
        }
        .loginBtn {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
        }
        .loginBtn:hover {
            background-color: #0056b3;
        }
        .forgetPass {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #007bff;
            text-decoration: none;
        }
        .forgetPass:hover {
            text-decoration: underline;
        }
        #errorInfo {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>用户注册页面</h1>
    <form id="reset-form">
        <div class="form-group">
            <label for="studentid">学号:</label>
            <input type="text" id="studentid" class="userName" placeholder="学号">
        </div>

        <div class="form-group">
            <label for="name">姓名:</label>
            <input type="text" id="name" class="userName" placeholder="姓名">
        </div>

        <div class="form-group">
            <label for="password">密码:</label>
            <input type="password" id="password" class="password" placeholder="密码">
        </div>

        <div class="form-group">
            <label>性别:</label>
            <input type="radio" id="male" name="sex" value="m" checked="checked">男
            <input type="radio" id="female" name="sex" value="f">女
        </div>

        <div class="form-group">
            <label for="tel">手机号:</label>
            <input type="tel" id="tel" class="userName" placeholder="手机号">
        </div>

        <div class="form-group">
            <label for="building">栋数:</label>
            <select id="building" class="userName">
                <option value="">选择栋数</option>
                <% for (int building = 1; building <= 20; building++) { %>
                <option value="<%=building%>"><%=building%></option>
                <% } %>
            </select>
        </div>

        <div class="form-group">
            <label for="floor">层数:</label>
            <select id="floor" class="userName">
                <option value="">选择层数</option>
                <% for (int floor = 1; floor <= 8; floor++) { %>
                <option value="<%=floor%>"><%=floor%></option>
                <% } %>
            </select>
        </div>

        <div class="form-group">
            <label for="room">房间号:</label>
            <select id="room" class="userName">
                <option value="">选择房间号</option>
                <% for (int room = 1; room <= 32; room++) { %>
                <option value="<%=room%>"><%=room%></option>
                <% } %>
            </select>
        </div>

        <div class="form-group">
            <label for="major">专业:</label>
            <select id="major" class="userName">
                <option value="">选择专业</option>
                <option value="计算机科学与技术">计算机科学与技术</option>
                <option value="大数据科学与技术">大数据科学与技术</option>
                <option value="网络安全">网络安全</option>
                <option value="软件工程">软件工程</option>
            </select>
        </div>

        <div class="button-container">
            <button class="loginBtn" id="enroll-button" type="submit">注册</button>
        </div>
        <a class="forgetPass" href="/users">返回登录页面</a>
    </form>

    <p id="errorInfo"></p>
</div>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.js"></script>
<script type="text/javascript">
    $(function() {
        $('#enroll-button').click(function(event) {
            event.preventDefault(); // 阻止表单的默认提交行为
            $('#errorInfo').html(""); // 清空错误信息

            var studentid_ = $('#studentid').val();
            var name_ = $('#name').val();
            var password_ = $('#password').val();
            var sex_ = $('input[name="sex"]:checked').val();
            var tel_ = $('#tel').val();
            var building_ = $('#building').val();
            var floor_ = $('#floor').val();
            var room_ = $('#room').val();
            var major_ = $('#major').val();

            // 检查输入框是否为空
            if (studentid_.length === 0 || name_.length === 0 || password_.length === 0 || tel_.length === 0 || building_.length === 0 || floor_.length === 0 || room_.length === 0 || !major_) {
                $('#errorInfo').html("所有字段均为必填项！");
                return false;
            }

            // 电话字段正则表达式验证：10到15位数字
            var telPattern = /^\d{10,15}$/;
            if (!telPattern.test(tel_)) {
                $('#errorInfo').html("手机号格式不正确！请输入10到15位数字。");
                return false;
            }

            // 构建用户对象
            var user = {
                studentid: studentid_,
                name: name_,
                password: password_,
                sex: sex_,
                tel: tel_,
                address: building_ + "-" + floor_ + "-" + room_,
                major: major_
            };

            // 发送AJAX请求
            $.ajax({
                url: '/users/enrollController',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(user),
                success: function(response) {
                    if (response.success) {
                        alert("注册成功！");
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
