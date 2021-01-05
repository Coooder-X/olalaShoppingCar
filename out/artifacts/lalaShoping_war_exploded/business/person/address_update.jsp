<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/1/5
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.goktech.olala.server.pojo.customer.CtmConsignee" %>
<%@ page import="java.util.List" %>
<%@ page import="com.goktech.olala.server.pojo.customer.CtmInfo" %>
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
                            <%
                                CtmConsignee consignee = (CtmConsignee) request.getAttribute("oldAddress");
                            %>
                            <div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
                                <form class="am-form am-form-horizontal" action=<%="/cntApi/updateAddress.do?addID="+request.getAttribute("addID")%> method="post">

                                    <div class="am-form-group">
                                        <label for="user-name" class="am-form-label">收货人</label>
                                        <div class="am-form-content">
                                            <input type="text" name="user-name" id="user-name" placeholder=<%=consignee.getUserName()%>>
                                        </div>
                                    </div>

                                    <div class="am-form-group">
                                        <label for="user-phone" class="am-form-label">手机号码</label>
                                        <div class="am-form-content">
                                            <input id="user-phone" name="user-phone" placeholder=<%=consignee.getPhone()%>>
                                        </div>
                                    </div>
                                    <div class="am-form-group">
                                        <label for="user-name" class="am-form-label">所在地</label>
                                        <div class="am-form-content">
                                            <input type="text" name="province" id="province" placeholder=<%=consignee.getProvince()%>>
                                            <input type="text" name="city" id="city" placeholder=<%=consignee.getCity()%>>
                                            <input type="text" name="area" id="area" placeholder=<%=consignee.getDistrict()%>>
                                        </div>
                                    </div>

                                    <div class="am-form-group">
                                        <label for="user-intro" class="am-form-label">详细地址</label>
                                        <div class="am-form-content">
                                            <textarea class="" rows="3" name="user-intro" id="user-intro" placeholder=<%=consignee.getAddress()%>></textarea>
                                            <small>100字以内写出你的详细地址/business.</small>
                                        </div>
                                    </div>

                                    <div class="am-form-group">
                                        <div class="am-u-sm-9 am-u-sm-push-3">
                                            <a> <input type="submit" class="am-btn am-btn-danger" value="保存"></a>
                                            <a href="/cntApi/listAddress.do" class="am-close am-btn am-btn-danger" data-am-modal-close>取消</a>
                                        </div>
                                    </div>
                                </form>
                            </div>

                        </div>

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

