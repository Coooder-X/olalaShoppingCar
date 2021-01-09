<%@ page import="com.goktech.olala.server.pojo.customer.CtmInfo" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/1/4
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>个人资料</title>

    <link href="/business/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="/business/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

    <link href="/business/css/personal.css" rel="stylesheet" type="text/css">
    <link href="/business/css/infstyle.css" rel="stylesheet" type="text/css">
    <script src="/business/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
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

            <div class="user-info">
                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small></div>
                </div>
                <hr/>

                <!--头像 -->
                <div class="user-infoPic">

                    <div class="filePic">
                        <input type="file" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*">
                        <img class="am-circle am-img-thumbnail" src="/business/images/getAvatar.do.jpg" alt="" />
                    </div>
                    <p class="am-form-help">头像</p>

                    <div class="info-m">
                        <div><b>用户名：<i><%=session.getAttribute("USERINFO")==null?"":((CtmInfo)session.getAttribute("USERINFO")).getCustomerName()%></i></b></div>
                        <div class="vip">
                            <span></span><a href="#">会员专享</a>
                        </div>
                    </div>
                </div>
                <!--个人信息 -->
                <div class="info-main">
                    <form class="am-form am-form-horizontal" action="/cntApi/userInfo.do" method="post">

                        <div class="am-form-group">
                            <label for="user-name2" class="am-form-label">昵称</label>
                            <div class="am-form-content">
                                <input type="text" name="user-name2" id="user-name2" placeholder=<%=session.getAttribute("USERINFO")==null?"":((CtmInfo)session.getAttribute("USERINFO")).getCustomerName()%>>
                                <small>昵称长度不能超过40个汉字</small>
                            </div>
                        </div>

                        <div class="am-form-group">
                            <label for="user-name" class="am-form-label">姓名</label>
                            <div class="am-form-content">
                                <input type="text" name="user-name" id="user-name" placeholder=<%=session.getAttribute("USERINFO")==null?"":((CtmInfo)session.getAttribute("USERINFO")).getRealName()%>>

                            </div>
                        </div>

                        <div class="am-form-group">
                            <label class="am-form-label">性别</label>
                            <div class="am-form-content sex">
                                <label class="am-radio-inline">
                                    <input type="radio" name="radio10" value="male" data-am-ucheck> 男
                                </label>
                                <label class="am-radio-inline">
                                    <input type="radio" name="radio10" value="female" data-am-ucheck> 女
                                </label>
                                <label class="am-radio-inline">
                                    <input type="radio" name="radio10" value="secret" data-am-ucheck> 保密
                                </label>
                            </div>
                        </div>

                        <script type="text/javascript" src="/business/home/js/birthdays.js"></script>
                        <div class="am-form-group">
                            <label class="am-form-label">生日</label>
                            <div class="am-form-content birth">
                                <div class="birth-select">
                                    <%
                                        CtmInfo ctmInfo = new CtmInfo();
                                        if(session.getAttribute("USERINFO") != null)
                                            ctmInfo = (CtmInfo) session.getAttribute("USERINFO");
                                        String []Time = {"", "", ""};
                                        if(ctmInfo.getBirthday().isEmpty() == false){
                                            Time = ctmInfo.getBirthday().split("-");
                                        }
                                    %>
                                    <select name="year" id="year" onfocus="years('year',new Date().getFullYear()),change_date()" onchange="change_date()">
<%--                                        <option selected="selected"><%=((CtmInfo)session.getAttribute("USERINFO")).getUserMobile()%></option>--%>
                                        <option selected="selected"><%=Time[0]%></option>
                                    </select>
                                    <em>年</em>
                                </div>
                                <div class="birth-select2">
                                    <select name="month" id="month" onfocus="months(),change_date()" onchange="change_date()">
                                        <option selected="selected"><%=Time[1]%></option>
                                    </select>
                                    <em>月</em></div>
                                <div class="birth-select2">
                                    <select id="date" name="date">
                                        <option selected="selected"><%=Time[2]%></option>
                                    </select>
                                    <em>日</em></div>
                            </div>

                        </div>

                        <div class="am-form-group">
                            <label for="user-phone" class="am-form-label">电话</label>
                            <div class="am-form-content">
                                <input id="user-phone" name="user-phone"  type="tel" placeholder=<%=session.getAttribute("USERINFO")==null?"":((CtmInfo)session.getAttribute("USERINFO")).getUserMobile()%>>

                            </div>
                        </div>
                        <div class="am-form-group">
                            <label for="user-email" class="am-form-label">电子邮件</label>
                            <div class="am-form-content">
                                <input id="user-email" name="user-email"  type="email" placeholder=<%=session.getAttribute("USERINFO")==null?"":((CtmInfo)session.getAttribute("USERINFO")).getEmail()%>>

                            </div>
                        </div>
                        <div class="am-form-group address">
                            <label class="am-form-label">收货地址</label>
                            <div class="am-form-content address">
                                <a href="address.html">
                                    <p class="new-mu_l2cw">
                                        <span class="province">湖北</span>省
                                        <span class="city">武汉</span>市
                                        <span class="dist">洪山</span>区
                                        <span class="street">雄楚大道666号(中南财经政法大学)</span>
                                        <span class="am-icon-angle-right"></span>
                                    </p>
                                </a>

                            </div>
                        </div>
                        <div class="am-form-group safety">
                            <label class="am-form-label">账号安全</label>
                            <div class="am-form-content safety">
                                <a href="safety.html">

                                    <span class="am-icon-angle-right"></span>

                                </a>

                            </div>
                        </div>
                        <div class="info-btn">
                            <div>
                            <input type="submit" value="保存修改" class="am-btn am-btn-danger">
                            </div>
                        </div>
                    </form>

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
