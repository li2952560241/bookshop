<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>个人信息编辑</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/upload.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }
        .navbar {
            background-color: #4d4b55;
            color: white;
            padding: 10px;
        }
        .navbar .menu li {
            display: inline;
            margin-right: 20px;
        }
        .navbar .menu li a {
            color: white;
            text-decoration: none;
        }
        .navbar .menu li a.active {
            font-weight: bold;
        }
        .nav-search {
            display: inline-block;
            margin-left: 50px;
        }
        .nav-info {
            float: right;
        }
        .container {
            width: 50%;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-top: 20px;
        }
        .container p {
            margin-bottom: 15px;
        }
        .container label {
            display: block;
            margin-bottom: 5px;
        }
        .container input[type="text"],
        .container input[type="password"] {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
        }
        .container .submit-container {
            text-align: center;
        }
        .container input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            margin-top: 10px;
        }
        .container input[type="submit"]:hover {
            background-color: #4d4b52;
        }
        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #f5c6cb;
        }
        footer {
            text-align: center;
            padding: 20px;
            background-color: #4d4b52;
            color: white;
            margin-top: 20px;
        }
        footer a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
        }
        @media (max-width: 768px) {
            .container {
                width: 90%;
            }
            .navbar .nav-info {
                float: none;
                text-align: center;
                margin-top: 10px;
            }
        }
    </style>
</head>
<body>

<!-- 导航条 -->
<nav class="navbar">
    <div class="nav-menu">
        <ul class="menu">
            <li><a class="active" href="/home.do">首页</a></li>
            <li><a href="/goBookStore.do">书籍良品</a></li>
            <li><a href="/goAskBookStore.do">求书区</a></li>
            <%-- <li><a href="#">服务区</a></li> --%>
        </ul>
    </div>

    <form class="nav-search" action="searchBook.do" method="post" accept-charset="UTF-8" onsubmit="return validateForm()">
        <input type="search" class="searchIn" name="name" placeholder="搜图书...">
        <button class="search-logo"><img src="<%=request.getContextPath()%>/img/search2.png" alt="search"></button>
    </form>

    <div class="nav-info">
        <a href="#" class="username">${user.name}</a>
        <a href="/myBookshelf.do" class="bookshelf">||&nbsp;&nbsp;&nbsp;我的书架</a>
        <a href="#" class="logout">[ 退 出 ]</a>
    </div>
</nav>

<div class="titleName">
    <h3>编辑个人信息</h3>
</div>

<!-- 显示错误信息 -->
<c:if test="${not empty errorMessage}">
    <div class="error-message">
        <p>${errorMessage}</p>
    </div>
</c:if>

<div class="container">
    <form action="updateUser" method="post">
        <input type="hidden" name="id" value="${user.id}"/>

        <p>
            <label for="studentid">学号:</label>
            <input type="text" id="studentid" name="studentid" value="${user.studentid}" />
        </p>

        <p>
            <label for="name">姓名:</label>
            <input type="text" id="name" name="name" value="${user.name}" />
        </p>

        <p>
            <label for="password">密码:</label>
            <input type="password" id="password" name="password" value="${user.password}" />
        </p>

        <p>
            <label for="sex">性别:</label>
            <input type="text" id="sex" name="sex" value="${user.sex}" />
        </p>

        <p>
            <label for="tel">电话:</label>
            <input type="text" id="tel" name="tel" value="${user.tel}" />
        </p>

        <p>
            <label for="address">地址:</label>
            <input type="text" id="address" name="address" value="${user.address}" />
        </p>

        <p>
            <label for="major">专业:</label>
            <input type="text" id="major" name="major" value="${user.major}" />
        </p>

        <div class="submit-container">
            <label><input type="submit" onclick="alert('信息已修改，请重新登录！')" value="保存" content="auto"></label>
        </div>
    </form>
</div>

<footer>
    <a href="#">©2018-2019 二手书交易</a>
    <a href="#">意见反馈&nbsp;&nbsp;&nbsp;联系我们&nbsp;&nbsp;&nbsp;隐私权声明&nbsp;&nbsp;&nbsp;使用条款</a>
</footer>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.form.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/session.js"></script>
<script type="text/javascript">
    function validateForm() {
        var keyword = $('#search-input').val();
        if (keyword.trim() === "") {
            alert("请输入搜索关键字");
            return false;  // 阻止表单提交
        }
        return true;  // 允许表单提交
    }
</script>
</body>
</html>
