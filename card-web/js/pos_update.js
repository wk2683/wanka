//POS详情信息


layui.use(['form','layer','upload'],function () {


    var upload = layui.upload;
    var layer = layui.layer;
    var form = layui.form;
    var user = layui.sessionData('user');


    var pageData = {};



    pageData.submitAdd = function(param){
        common.sendOption.data = param;
        common.sendOption.url = common.url.web_root + common.url.model.pos.action + common.url.opt.update;
        common.sendOption.type = common.sendMethod.POST;
        common.sendOption.completeCallBack =pageData.addComplete;

        common.httpSend(common.sendOption);
    }

    pageData.addComplete = function(res){
        common.noDataResponse(res,common.optName.CONTROLLER_OPT_UPDATE,common.url.model.pos.page.manager);
    };
    //弹出选择模态框
    pageData.openSelectMode = function(){
        var ww = $(window).width();
        ww = ww*0.8;
        var hh = $(window).height();
        hh = hh*0.8;
        layer.open({
            type:2,
            title:'选择',
            content: common.url.page_root + common.url.model.account.page.selectList,
            area:[ ww+'px',hh+'px'],
            btn:['确定'],
            yes:function (index, layero) {
                console.log("点击了确定");
                pageData.showSelect();
                layer.close(index);//关掉自己
            }
        })
    };
    //显示选中的
    pageData.showSelect = function(){
        var len = window.frames.length;
        var selectUsers = 0;
        for(var i=0;i<len;i++){
            if(window.frames[i].getSelectUsers && typeof  window.frames[i].getSelectUsers == "function"){
                selectUsers = window.frames[i].getSelectUsers();    //[{id,name},...]
                break;
            }
        }
        if(selectUsers.length>1){
            layer.msg('只能选择一个账户哦~',{anim:6},function () {
                pageData.openSelectMode();
            });

            return false;
        }
        var selectUser = selectUsers[0];
        $("input[name=importAccountId]").val(selectUser.id);
        $("input[name=importAccountName]").val(selectUser.name);
        $("input[name=cardNumber]").val(selectUser.cardNumber);
        $("input[name=bankName]").val(selectUser.bankName);
        $("input[name=userName]").val(selectUser.userName);
        // $(".account-card-number").text(selectUser.cardNumber?'卡号：'+selectUser.cardNumber:'');
    };

    pageData.initBankList = function(){
        if(!sessionStorage.bankList){
            common.util.loadBankList(pageData.initBankList);
            return false;
        }
        var bankList = JSON.parse(sessionStorage.bankList);
        var len  = bankList.length;
        var optionHtml = '<option value="">选择银行</option>';
        for(var i=0 ; i < len ; i++){
            var bank = bankList[i];
            optionHtml += '<option value="'+bank.name+'">'+bank.name+'</option>';
        }
        $("select[name=bankName]").html(optionHtml);
        form.render('select');
    };


    //加载数据
    pageData.getData = function(){
        var p = common.util.getHrefParam();//地址参数
        common.sendOption.data = { id:p.id };
        common.sendOption.url = common.url.web_root + common.url.model.pos.action + common.url.opt.get;
        common.sendOption.type = common.sendMethod.GET;
        common.sendOption.completeCallBack =pageData.getComplete;
        common.httpSend(common.sendOption);
    };
    //加载完成处理
    pageData.getComplete = function (res) {
        var resData = JSON.parse(res.responseText);
        if(resData.code = common.code.RESPONSE_CODE_SUCCESS){
            var item = JSON.parse(resData.data);
            pageData.initDetail(item);
        }else{
            layer.msg(resData.msg,{anim:6},function () {
                // history.back();
            })
        }
    };
    //显示数据
    pageData.initDetail = function (pos) {

        form.val('pos_form',{
            'id':pos.id,
            'name':pos.name,
            'importAccountName':pos.importAccountName,
            'importAccountId':pos.importAccountId,
            'bankName':pos.bankName,
            'cardNumber':pos.cardNumber,
            'rateId':pos.rateId,
            'rateId':pos.rateId,
            'seg':pos.seg,
            'remark':pos.remark,
        });
    };












    $(function () {

        pageData.initBankList();

        pageData.getData();

        // 监听提交按钮 submit(btn_id)
        form.on('submit(formAdd)', function(data){
           pageData.submitAdd(data.field);
            return false;
        });
        // 点选资金账户
        //点选入账资金账户
        $("input[name=importAccountName]").click(function () {
            pageData.openSelectMode();
        });

    })

});
