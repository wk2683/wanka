//新增POS机信息


layui.use(['form','layer','upload'],function () {



    var layer = layui.layer;
    var form = layui.form;
    var user = layui.sessionData('user');


    var pageData = {};


    //加载数据
    pageData.getData = function(){
        var p = common.util.getHrefParam();//地址参数
        common.sendOption.data = { id:p.id };
        common.sendOption.url = common.url.web_root + common.url.model.account.action + common.url.opt.get;
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
    pageData.initDetail = function (card) {

        //查找员工名
        var workerName = common.util.initNameById(card.customerId,common.url.model.customer.action,$("input[name=customerName]"));


        form.val('account_detail_form',{
            // ,{field: 'name',     title: '资金账户名称', align:'center'}
            // ,{field: 'userName',     title: '姓名', align:'center'}
            // ,{field: 'bankName',     title: '银行名称', align:'center'}
            // ,{field: 'cardNumber',     title: '卡号', align:'center'}
            // ,{field: 'webUserName',     title: '网银登录称', align:'center'}
            // ,{field: 'webPassword',     title: '网银登录密码', align:'center'}
            // ,{field: 'seg',      title: '排序', align:'center'}
            // ,{field: 'remark',   title: '备注', align:'center'}
            id:card.id,
            name:card.name,
            userName:card.userName,
            bankName:card.bankName,
            cardNumber:card.cardNumber,
            webUserName:card.webUserName,
            webPassword:card.webPassword,
            seg:card.seg,
            remark:card.remark
        });
    };



    pageData.submitAdd = function(param){
        common.sendOption.data = param;
        common.sendOption.url = common.url.web_root + common.url.model.account.action + common.url.opt.update;
        common.sendOption.type = common.sendMethod.POST;
        common.sendOption.completeCallBack =pageData.addComplete;

        common.httpSend(common.sendOption);
    }

    pageData.addComplete = function(res){
        common.noDataResponse(res,common.optName.CONTROLLER_OPT_UPDATE,common.url.model.account.page.manager);
    };
    //弹出选择用户模态框
    pageData.openSelectUserMode = function(){
        var ww = $(window).width();
        ww = ww*0.8;
        var hh = $(window).height();
        hh = hh*0.8;
        layer.open({
            type:2,
            title:'选择用户',
            content: common.url.page_root + common.url.model.worker.page.selectList,
            area:[ ww+'px',hh+'px'],
            btn:['确定'],
            yes:function (index, layero) {
                console.log("点击了确定");
                pageData.showSelectUsers();
                layer.close(index);//关掉自己
            }
        })
    };
//显示选中的用户
    pageData.showSelectUsers = function(){
        var len = window.frames.length;
        var selectUsers = 0;
        for(var i=0;i<len;i++){
            if(window.frames[i].getSelectUsers && typeof  window.frames[i].getSelectUsers == "function"){
                selectUsers = window.frames[i].getSelectUsers();    //[{id,name},...]
                break;
            }
        }
        if(selectUsers.length>1){
            layer.msg('只能选择一个用户哦~',{anim:6},function () {
                pageData.openSelectUserMode();
            });

            return false;
        }
        var selectUser = selectUsers[0];
        $("input[name=userId]").val(selectUser.id);
        $("input[name=userName]").val(selectUser.name);
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

    $(function () {

        pageData.getData();

        pageData.initBankList();

        //监听提交按钮 submit(btn_id)
        form.on('submit(formAdd)', function(data){
           pageData.submitAdd(data.field);
            return false;
        });
        //点选用户（入账人）
        $("input[name=userName]").click(function () {
            pageData.openSelectUserMode();
        });
    });
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<初始化表单 结束<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


});
