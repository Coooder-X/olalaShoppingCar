<%@ page import="com.goktech.olala.server.pojo.customer.CtmInfo" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/1/8
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>O拉拉欢迎你</title>

    <link href="../business/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="../business/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

    <link href="../business/css/personal.css" rel="stylesheet" type="text/css">

    <script src="../business/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="../business/AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>

</head>

<body>
<!--头 -->
<header>
    <article>
        <div class="mt-logo">
            <!--顶部导航条 -->
            <div class="am-container header">
                <ul class="message-l">
                    <div class="topMessage">
                        <div class="menu-hd">
                    <%
                        if(session.getAttribute("CTMLOGIN") == null) {
                    %>
                            <a href="/business/home/login.jsp" target="_top" class="h">亲，请登录</a>
                            <a href="/business/home/register.jsp" target="_top">免费注册</a>
                    <%
                    }
                    else {
                    %>
                            <a><b>欢迎：<%=((CtmInfo)session.getAttribute("USERINFO")).getCustomerName()%></b></a>
                    <%
                        }
                    %>
                        </div>
                    </div>
                </ul>
                <ul class="message-r">
                    <div class="topMessage home">
                        <div class="menu-hd"><a href="home/index.jsp" target="_top" class="h">商城首页</a></div>
                    </div>
                    <div class="topMessage my-shangcheng">
                        <div class="menu-hd MyShangcheng"><a href="/business/frame.jsp" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
                    </div>
                    <div class="topMessage mini-cart">
                        <div class="menu-hd"><a id="mc-menu-hd" href="/cntApi/mycar.do" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
                    </div>
                    <div class="topMessage favorite">
                        <div class="menu-hd"><a href="person/collection.html" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
                    </div>
                </ul>
            </div>

            <!--悬浮搜索框-->

            <div class="nav white">
                <div class="logoBig">
                    <li><img src="images/logobig.png" /></li>
                </div>

                <div class="search-bar pr">
                    <a name="index_none_header_sysc" href="search.jsp"></a>
                    <form method="post" action="/cntApi/search.do">
                        <input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
                        <input id="ai-topsearch" class="submit am-btn"  value="搜索" index="1" type="submit">
                    </form>
                </div>
            </div>

            <div class="clear"></div>
        </div>
        </div>
    </article>
</header>

<div class="nav-table">
    <div class="long-title"><span class="all-goods">全部分类</span></div>
    <div class="nav-cont">
        <ul>
            <li class="index"><a href="home/index.html">首页</a></li>
            <li class="qc"><a href="#">闪购</a></li>
            <li class="qc"><a href="#">限时抢</a></li>
            <li class="qc"><a href="#">团购</a></li>
            <li class="qc last"><a href="#">大包装</a></li>
        </ul>
        <div class="nav-extra">
            <i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
            <i class="am-icon-angle-right" style="padding-left: 10px;"></i>
        </div>
    </div>
</div>
<b class="line"></b>

<div class="center">
    <div class="col-main">
        <div class="main-wrap">
            <!--标题 -->
            <div class="am-cf am-padding">
                <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small></div>
            </div>
            <hr/>
        </div>
        <!--底部-->
        <div class="footer">
            <div class="footer-hd">
                <p>
                    <a href="#">恒望科技</a>
                    <b>|</b>
                    <a href="#">商城首页</a>
                    <b>|</b>
                    <a href="#">支付宝</a>
                    <b>|</b>
                    <a href="#">物流</a>
                </p>
            </div>
            <div class="footer-bd">
                <p>
                    <a href="#">关于恒望</a>
                    <a href="#">合作伙伴</a>
                    <a href="#">联系我们</a>
                    <a href="#">网站地图</a>
                    <em>© 2015-2025 Hengwang.com 版权所有</em>
                </p>
            </div>
        </div>
    </div>

    <aside class="menu">
        <ul>
            <li class="person active">
                <a href="home/index.jsp"><i class="am-icon-user"></i>个人中心</a>
            </li>
            <li class="person">
                <p><i class="am-icon-newspaper-o"></i>个人资料</p>
                <ul>
                    <li> <a href="/business/person/information.jsp">个人信息</a></li><!--这里改为了jsp-->
                    <li> <a href="/business/person/safety.jsp">安全设置</a></li>
                    <li> <a href="/cntApi/listAddress.do">地址管理</a></li>
                </ul>
            </li>
            <li class="person">
                <p><i class="am-icon-balance-scale"></i>我的交易</p>
                <ul>
                    <li><a href="/business/person/order.html">订单管理</a></li>
                </ul>
            </li>
            <li class="person">
                <p><i class="am-icon-dollar"></i>我的资产</p>
                <ul>
                    <li> <a href="/business/person/points.html">我的积分</a></li>
                </ul>
            </li>

            <li class="person">
                <p><i class="am-icon-tags"></i>我的收藏</p>
                <ul>
                </ul>
            </li>

            <li class="person">
                <p><i class="am-icon-qq"></i>在线客服</p>
                <ul>
                    <li> <a href="person/consultation.html">商品咨询</a></li>
                </ul>
            </li>
        </ul>

    </aside>
</div>

</body>

</html>
