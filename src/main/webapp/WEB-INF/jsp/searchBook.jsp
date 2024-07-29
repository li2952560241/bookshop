<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"  %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>搜索结果</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/book.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/hide.css">
</head>
<body>
<!-- 导航 -->
<header>
    <nav class="navbar">
        <div class="nav-info">
            <a href="#" class="username">${user.getName()}</a>
            <a href="/myBookshelf.do" class="bookshelf">||&nbsp;&nbsp;&nbsp;我的书架</a>
            <a href="#" class="logout">[ 退 出 ]</a>
        </div> <!-- nav-info -->
        <form action="searchBook.do" method="post" onsubmit="return validateForm()">
            <div class="nav-search">
                <a href="home.do"><img class="logo" src="<%=request.getContextPath()%>/img/logo2.png"></a>
                <div class="search-form">
                    <input id="search-input" name="name" type="search" class="searchIn" placeholder="搜图书...">
                    <a href="#" class="search-logo">| &nbsp;<img src="<%=request.getContextPath()%>/img/search.png"></a>
                    <button type="submit" id="search-button" class="searchBtn">搜索</button>
                </div>
            </div><!--  nav-search -->
        </form>
        <ul class="menu">
            <li><a href="/home.do">首页</a></li>
            <li><a href="/goBookStore.do">书籍良品</a></li>
            <li><a href="/goAskBookStore.do">求书区</a></li>
<%--            <li><a href="#">服务区</a></li>--%>
        </ul>
    </nav>
    <div class="askBook-pic"></div>
</header>
<!-- 图书分类 -->
<div id="container">
    <div id="book-container">
        <h3 class="book-title"><a href="#">| 所有搜索结果</a></h3>
        <p>搜索关键字: ${keyword}</p> <!-- 显示搜索关键字 -->
        <ul class="book-lists">
            <c:if test="${not empty books}">
                <div class="book-part">
                    <ul class="book-lists">
                        <c:forEach var="book" items="${books}">
                            <li class="book-list">
                                <a href="/books/${book.getId()}" class="book-pic" target="_blank">
                                    <img src="<%=request.getContextPath()%>/img/book-list/article/${book.getBookImage().getId()}.jpg">
                                </a>
                                <a href="#" class="book-info">
                                    <h5 class="book-name">${book.name}</h5>
                                    <span class="book-detail">${book.description}</span>
                                </a>
                                <span class="book-price">￥${book.price}
                            <div class="tooltip">
                                <a href="#" class="book-buy" >联系卖家</a>
                                <!-- 提示文字内容 -->
                                <span class="tooltiptext">这个功能没有具体实现</span>
                            </div>
                        </span>
                            </li>
                        </c:forEach>
                    </ul><!--  book-list end -->
                </div><!--  book-part end -->
            </c:if>
            <c:if test="${empty books}">
                <p>没有找到相关的书籍。</p>
            </c:if>
        </ul><!--  book-list end -->
    </div> <!-- book-container end-->
    <span class="page-btn">
			<a href="?start=0" class="page-top">首页</a>
			<a href="?start=${page.getStart()-page.getCount()}" class="page-pre">上一页</a>
			<a href="?start=${page.getStart()+page.getCount()}" class="page-next">下一页</a>
			<a href="?start=${page.getEnd()}" class="page-end">尾页</a>
		</span>
</div><!-- container end-->
<footer>
    <a href="#">©2018-2019 二手书交易</a>
    <a href="#">意见反馈&nbsp;&nbsp;&nbsp;联系我们&nbsp;&nbsp;&nbsp;隐私权声明&nbsp;&nbsp;&nbsp;使用条款</a>
</footer>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/session.js"></script>
<script type="text/javascript">
    $(function(){
        //菜单特效
        var index = 0
        $("#book-menu-toggle").on("click",function(){
            if (index ===0 ) {
                $("#book-menu").css("left","1px");
                $(this).css("left","178px");
                index =1;
            }else{
                $("#book-menu").css("left","-180px");
                $(this).css("left","1px");
                index=0;
            }
        });

        //点击菜单，对应类别颜色加深
        $(".book-class li").on("click",function(){
            //加粗当前点击的li
            $(this).css("font-weight","600").siblings("li").css("font-weight","500");
        });
    })

    /*非空的时候，不可以进行搜索
     */
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
