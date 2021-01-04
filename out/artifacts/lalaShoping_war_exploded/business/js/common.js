var version = 1.0 //版本号
var login_status = 0; //0,未登录 1,已登录

// 将表单数据序列化为一个json对象，例如 {"name":"zs", "age":10}
// 使用：var jsonObj = $("#formId").serializeObject();
$.fn.serializeObject = function() {
    var param = {};
    var service = {};
    var formData = this.serializeArray();
    $.each(formData, function() {
        if (service[this.name]) {
            if (!service[this.name].push) {
                service[this.name] = [service[this.name]];
            }
            service[this.name].push(this.value || '');
        } else {
            service[this.name] = this.value || '';
        }
    });
    param.data = service;
    return param;
};

var Validator = {
    // 中文
    isChinese : function(s) {
        var p = /^[\u4e00-\u9fa5]+$/;
        return this.test(s, p);
    },

    // 英文
    isEnglish : function(s) {
        var p = /^[A-Za-z]+$/;
        return this.test(s, p);
    },

    // 邮箱
    isEmail : function(s) {
        var p = "^[-!#$%&\'*+\\./0-9=?A-Z^_`a-z{|}~]+@[-!#$%&\'*+\\/0-9=?A-Z^_`a-z{|}~]+\.[-!#$%&\'*+\\./0-9=?A-Z^_`a-z{|}~]+$";
        return this.test(s, p);
    },

    // 手机号码
    isMobile : function(s) {
        return this.test(s, /^(13[0-9]|15[0|3|6|7|8|9]|18[2|8|9])\d{8}$/);
    },

    // 电话号码
    isPhone : function(s) {
        return this.test(s, /^[0-9]{3,4}\-[0-9]{7,8}$/);
    },

    // 邮编
    isPostCode : function(s) {
        return this.test(s, /^[1-9][0-9]{5}$/);
    },

    // 数字
    isNumber : function(s, d) {
        return !isNaN(s.nodeType == 1 ? s.value : s) && (!d || !this.test(s, '^-?[0-9]*\\.[0-9]*$'));
    },

    // 判断是否为空
    isEmpty : function(s) {
        return !jQuery.isEmptyObject(s);
    },

    // 判断是否为空
    isFax : function(s) {
        return this.test(s, /^((\+?[0-9]{2,4}\-[0-9]{3,4}\-)|([0-9]{3,4}\-))?([0-9]{7,8})(\-[0-9]+)?$/);
    },

    isImage : function(s) {
        return this.test(s, /\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/);
    },

    // 正则匹配
    test : function(s, p) {
        s = s.nodeType == 1 ? s.value : s;
        return new RegExp(p).test(s);
    }
};