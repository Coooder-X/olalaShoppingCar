<%@ page import="com.goktech.olala.server.pojo.customer.CtmLogin" %>
<%@ page import="com.goktech.olala.server.pojo.customer.CtmInfo" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/1/5
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
    <title>安全设置</title>
    <link href="/business/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="/business/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
    <link href="/business/css/personal.css" rel="stylesheet" type="text/css">
    <link href="/business/css/bilstyle.css" rel="stylesheet" type="text/css">

    <script src="/business/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="/business/AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>

</head>

<body>
<!--头 -->
<header></header>
<div class="nav-table"></div>
<b class="line"></b>
<div class="center">
    <div class="col-main">
        <div class="main-wrap">

            <!--标题 -->
            <div class="user-safety">
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">账户安全</strong> / <small>Set&nbsp;up&nbsp;Safety</small></div>
                </div>
                <hr/>

                <!--头像 -->
                <div class="user-infoPic">

                    <div class="filePic">
                        <img class="am-circle am-img-thumbnail" src="/business/images/getAvatar.do.jpg" alt="" />
                    </div>

                    <p class="am-form-help">头像</p>
            <%
                CtmInfo ctmInfo = (CtmInfo) session.getAttribute("USERINFO");
            %>
                    <div class="info-m">
                        <div><b>用户名：<i><%=ctmInfo==null?"":ctmInfo.getCustomerName()%></i></b></div>
                        <div class="safeText">
                            <a href="/business/person/safety.jsp">账户安全:<em style="margin-left:20px ;">60</em>分</a>
                            <div class="progressBar"><span style="left: -95px;" class="progress"></span></div>
                        </div>
                    </div>
                </div>

                <div class="check">
                    <ul>
                        <li>
                            <i class="i-safety-lock"></i>
                            <div class="m-left">
                                <div class="fore1">登录密码</div>
                                <div class="fore2"><small>为保证您购物安全，建议您定期更改密码以保护账户安全。</small></div>
                            </div>
                            <div class="fore3">
                                <a href="/business/person/password.jsp">
                                    <div class="am-btn am-btn-secondary">修改</div>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>

            </div>
        </div>
        <!--底部-->
        <div class="footer"></div>
    </div>
    <aside class="menu"></aside>
</div>
</body>
<script>
    $(function () {
        $("header").load("/business/person/header.jsp");
        $(".nav-table").load("/business/person/nav.html");
        $("div.footer").load("/business/home/footer.html");
        $("aside").load("/business/home/aside.html");
    })
</script>
</html>
