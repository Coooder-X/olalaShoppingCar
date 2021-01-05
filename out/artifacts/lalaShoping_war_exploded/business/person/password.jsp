<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/1/5
  Time: 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>修改密码</title>

    <link href="/business/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="/business/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

    <link href="/business/css/personal.css" rel="stylesheet" type="text/css">
    <link href="/business/css/stepstyle.css" rel="stylesheet" type="text/css">

    <script type="text/javascript" src="/business/js/jquery-1.7.2.min.js"></script>
    <script src="/business/AmazeUI-2.4.2/assets/js/amazeui.js"></script>

</head>

<body>
<!--头 -->
<header></header>
<div class="nav-table"></div>
<b class="line"></b>
<div class="center">
    <div class="col-main">
        <div class="main-wrap">

            <div class="am-cf am-padding">
                <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">修改密码</strong> / <small>Password</small></div>
            </div>
            <hr/>
            <!--进度条-->
            <div class="m-progress">
                <div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">重置密码</p>
                            </span>
                    <span class="step-2 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
                                <p class="stage-name">完成</p>
                            </span>
                    <span class="u-progress-placeholder"></span>
                </div>
                <div class="u-progress-bar total-steps-2">
                    <div class="u-progress-bar-inner"></div>
                </div>
            </div>
            <form class="am-form am-form-horizontal" action="/cntApi/changepwd.do" method="post">
                <div class="am-form-group">
                    <label for="user-old-password" class="am-form-label">原密码</label>
                    <div class="am-form-content">
                        <input type="password" name="user-old-password" id="user-old-password" placeholder="请输入原登录密码">
                    </div>
                </div>
                <div class="am-form-group">
                    <label for="user-new-password" class="am-form-label">新密码</label>
                    <div class="am-form-content">
                        <input type="password" name="user-new-password" id="user-new-password" placeholder="由数字、字母组合">
                    </div>
                </div>
                <div class="am-form-group">
                    <label for="user-confirm-password" class="am-form-label">确认密码</label>
                    <div class="am-form-content">
                        <input type="password" name="user-confirm-password" id="user-confirm-password" placeholder="请再次输入上面的密码">
                    </div>
                </div>
                <div class="info-btn">
                    <div>
                        <input type="submit" value="保存修改" class="am-btn am-btn-danger">
                    </div>
                </div>

            </form>

        </div>
        <!--底部-->
        <div class="footer"></div>
    </div>
    <aside class="menu"></aside>
</div>
</body>
<script>
    $(function () {
        $("header").load("/business/person/header.html");
        $(".nav-table").load("/business/person/nav.html");
        $("div.footer").load("/business/home/footer.html");
        $("aside").load("/business/home/aside.html");
    })
</script>
</html>