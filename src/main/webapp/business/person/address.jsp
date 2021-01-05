<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.goktech.olala.server.pojo.customer.CtmConsignee" %>
<%@ page import="java.util.List" %>
<%@ page import="com.goktech.olala.server.pojo.customer.CtmInfo" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/1/5
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>地址管理</title>

    <link href="/business/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="/business/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

    <link href="/business/css/personal.css" rel="stylesheet" type="text/css">
    <link href="/business/css/addstyle.css" rel="stylesheet" type="text/css">
    <script src="/business/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
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
            <div class="user-address">
                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small></div>
                </div>
                <hr/>
<%--                    <c:forEach items="${ADDLIST}" var="address">--%>
<%--                        "${address.userName}"--%>
<%--                    </c:forEach>--%>
                <%
                    List<CtmConsignee> list = (List<CtmConsignee>) request.getAttribute("ADDLIST");
                    for(CtmConsignee it : list){
                %>
    <%--                < class="am-avg-sm-1 am-avg-md-3 am-thumbnails">--%>

                        <li class="user-addresslist defaultAddr">
                        <%
                            if(it.getIsDefault()){
                        %>
                                <span class="new-option-r"><i class="am-icon-check-circle"></i>默认地址</span>
                        <%
                            }else{
                        %>
                                <span href=<%="/cntApi/setDefaultAddress.do?addID=" + it.getCustomerAddrId()%> class="new-option-r"><i class="am-icon-check-circle"></i>设为默认</span>
                        <%
                            }
                        %>
                            <p class="new-tit new-p-re">
                                <span class="new-txt"><%=it.getUserName()%></span>
                                <span class="new-txt-rd2"><%=it.getScPhone()%></span>
                            </p>
                            <div class="new-mu_l2a new-p-re">
                                <p class="new-mu_l2cw">
                                    <span class="title">地址：</span>
                                    <span class="province"><%=it.getProvince()%></span>省
                                    <span class="city"><%=it.getCity()%></span>市
                                    <span class="dist"><%=it.getDistrict()%></span>区
                                    <span class="street"><%=it.getAddress()%></span></p>
                            </div>
<%--                            <div class="new-addr-btn">--%>
<%--                                <a href="#"><i class="am-icon-edit"></i>编辑</a>--%>
<%--                                <span class="new-addr-bar">|</span>--%>
<%--                                <a href="javascript:void(0);" onclick="delClick(this);"><i class="am-icon-trash"></i>删除</a>--%>
<%--                            </div>--%>
                            <div class="new-addr-btn">
                                <a href=<%="/cntApi/to_updateAddress.do?addID=" + it.getCustomerAddrId()%>><i class="am-icon-edit"></i>编辑</a>
                                <span class="new-addr-bar">|</span>
                                <a href=<%="/cntApi/deleteAddress.do?addID=" + it.getCustomerAddrId()%>><i class="am-icon-trash"></i>删除</a>
                            </div>
                        </li>
                <%
                    }
                %>
                </ul>
                <div class="clear"></div>
                <a class="new-abtn-type" data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
                <!--例子-->
                <div class="am-modal am-modal-no-btn" id="doc-modal-1">

                    <div class="add-dress">

                        <!--标题 -->
                        <div class="am-cf am-padding">
                            <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small></div>
                        </div>
                        <hr/>

                        <div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
                            <form class="am-form am-form-horizontal" action="/cntApi/addAddress.do" method="post">

                                <div class="am-form-group">
                                    <label for="user-name" class="am-form-label">收货人</label>
                                    <div class="am-form-content">
                                        <input type="text" name="user-name" id="user-name" placeholder="收货人">
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-phone" class="am-form-label">手机号码</label>
                                    <div class="am-form-content">
                                        <input id="user-phone" name="user-phone" placeholder="手机号必填">
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label for="user-name" class="am-form-label">所在地</label>
                                    <div class="am-form-content">
                                        <input type="text" name="province" id="province" placeholder="省">
                                        <input type="text" name="city" id="city" placeholder="市">
                                        <input type="text" name="area" id="area" placeholder="区">
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-intro" class="am-form-label">详细地址</label>
                                    <div class="am-form-content">
                                        <textarea class="" rows="3" name="user-intro" id="user-intro" placeholder="输入详细地址"></textarea>
                                        <small>100字以内写出你的详细地址/business.</small>
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                        <a> <input type="submit" class="am-btn am-btn-danger" value="保存"></a>
                                        <a href="javascript: void(0)" class="am-close am-btn am-btn-danger" data-am-modal-close>取消</a>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>

                </div>

            </div>

            <script type="text/javascript">
                $(document).ready(function() {
                    $(".new-option-r").click(function() {
                        $(this).parent('.user-addresslist').addClass("defaultAddr").siblings().removeClass("defaultAddr");
                    });

                    var $ww = $(window).width();
                    if($ww>640) {
                        $("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
                    }

                })
            </script>

            <div class="clear"></div>

        </div>
        <!--底部-->
        <div class="footer"></div>
    </div>
    <aside class="menu"></aside>
</div>

</body>
<script>
    $(function(){
        $("header").load("/business/person/header.html");
        $(".nav-table").load("/business/person/nav.html");
        $("div.footer").load("/business/home/footer.html");
        $("aside").load("/business/home/aside.html");
    })
</script>
</html>
