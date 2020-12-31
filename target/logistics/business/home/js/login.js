$(function(){
    $("#loginBtn").click(function () {
        $.post("/sysUser/login.do",$("#infoForm").serialize(),function (data) {
            console.log('result===>'+data.result)
            if (data.result == 'success') {
                //登录成功
                //页面跳转
                location.href = "index.html";
            } else {
                //登录失败
                $("#errorMsg").html(data.errorMsg);
                return false;
            }
        })
    });
});

function query(thisObj) {
    alert("进入方法");
    $.post("/Home/query", { "state": 1 }, function (data) {
        alert("success");
    });
}

