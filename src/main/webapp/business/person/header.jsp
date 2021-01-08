<%@ page import="com.goktech.olala.server.pojo.customer.CtmInfo" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/1/8
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<article>
    <div class="mt-logo" >
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
                    <div class="menu-hd"><a href="/business/home/index.jsp" target="_top" class="h">商城首页</a></div>
                </div>
                <div class="topMessage my-shangcheng">
                    <div class="menu-hd MyShangcheng"><a href="/business/frame.jsp" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
                </div>
                <div class="topMessage mini-cart">
                    <div class="menu-hd"><a id="mc-menu-hd" href="/business/home/shopcart.html" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
                </div>
                <div class="topMessage favorite">
                    <div class="menu-hd"><a href="collection.html" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
                </div>
            </ul>
        </div>

        <!--悬浮搜索框-->

        <div class="nav white">
            <div class="logoBig">
                <li><img src="/business/images/logobig.png" /></li>
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
