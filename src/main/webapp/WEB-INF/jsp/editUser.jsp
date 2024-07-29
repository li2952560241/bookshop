<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息编辑</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/upload.css">
</head>
<body>

<nav class="navbar">
    <div class="nav-menu">
        <ul class="menu">
            <li><a class="active" href="/home.do">首页</a></li>
            <li><a href="/goBookStore.do">书籍良品</a></li>
            <li><a href="/goAskBookStore.do">求书区</a></li>
<%--            <li><a href="#">服务区</a></li>--%>
        </ul>
    </div><!-- nav-menu -->

    <form class="nav-search">
        <input type="search" class="searchIn" name="name" placeholder="搜图书...">
        <button class="search-logo"><img src="<%=request.getContextPath()%>/img/search2.png"></button>
    </form>

    <div class="nav-info">
        <a href="#" class="username">${user.name}</a>
        <a href="/myBookshelf.do" class="bookshelf">||&nbsp;&nbsp;&nbsp;我的书架</a>
        <a href="#" class="logout">[ 退 出 ]</a>
    </div><!-- nav-info-end -->
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

<form action="updateUser" method="post">
    <input type="hidden" name="id" value="${user.id}"/>

    <div class="form-group">
        <label for="studentid">学号:</label>
        <input type="text" id="studentid" name="studentid" value="${user.studentid}" />
    </div>

    <div class="form-group">
        <label for="name">姓名:</label>
        <input type="text" id="name" name="name" value="${user.name}" />
    </div>

    <div class="form-group">
        <label for="password">密码:</label>
        <input type="password" id="password" name="password" value="${user.password}" />
    </div>

    <div class="form-group">
        <label for="sex">性别:</label>
        <input type="text" id="sex" name="sex" value="${user.sex}" />
    </div>

    <div class="form-group">
        <label for="tel">电话:</label>
        <input type="text" id="tel" name="tel" value="${user.tel}" />
    </div>

    <div class="form-group">
        <label for="address">地址:</label>
        <input type="text" id="address" name="address" value="${user.address}" />
    </div>

    <div class="form-group">
        <label for="major">专业:</label>
        <input type="text" id="major" name="major" value="${user.major}" />
    </div>

    <button type="submit" onclick="alert('信息已修改，请重新登录！')">保存</button>
</form>

<footer>
    <a href="#">©2018-2019 二手书交易</a>
    <a href="#">意见反馈&nbsp;&nbsp;&nbsp;联系我们&nbsp;&nbsp;&nbsp;隐私权声明&nbsp;&nbsp;&nbsp;使用条款</a>
</footer>

</body>
</html>
