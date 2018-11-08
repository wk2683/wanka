//修改订单出账


layui.use(['form','layer','upload'],function () {


    var upload = layui.upload;
    var layer = layui.layer;
    var form = layui.form;
    var user = layui.sessionData('user');


    var pageData = {};



    pageData.submitAdd = function(param){
        common.sendOption.data = param;
        common.sendOption.url = common.url.web_root + common.url.model.orderExport.action + common.url.opt.add;
        common.sendOption.type = common.sendMethod.POST;
        common.sendOption.completeCallBack =pageData.addComplete;
        common.httpSend(common.sendOption);
    }

    pageData.addComplete = function(res){
        common.noDataResponse(res,common.optName.CONTROLLER_OPT_ADD,common.url.model.order.page.manager);
    };
    //打开选择客户
    pageData.openCustomerSelectModel = function(){
        var ww = $(window).width();
        ww = ww*0.8;
        var hh = $(window).height();
        hh = hh*0.8;
        layer.open({
            type:2,
            title:'选择用户',
            content: common.url.page_root + common.url.model.customer.page.selectList,
            area:[ ww+'px',hh+'px'],
            btn:['确定'],
            yes:function (index, layero) {
                console.log("点击了确定");
                pageData.showSelectCustomers();
                layer.close(index);//关掉自己
            }
        })
    };
    //显示选择的客户
    pageData.showSelectCustomers = function(){
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
        $("input[name=customerId]").val(selectUser.id);
        $("input[name=customerName]").val(selectUser.name);
    };
    //打开选择资金账户
    pageData.openAccountSelectModel = function(prev){

        var ww = $(window).width();
        ww = ww*0.8;
        var hh = $(window).height();
        hh = hh*0.8;
        layer.open({
            type:2,
            title:'选择用户',
            content: common.url.page_root + common.url.model.account.page.selectList,
            area:[ ww+'px',hh+'px'],
            btn:['确定'],
            yes:function (index, layero) {
                console.log("点击了确定");
                pageData.showSelecteds(prev);
                layer.close(index);//关掉自己
            }
        })
    };
    //显示选择资金账户结果
    pageData.showSelecteds = function(prev){
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
        $("input[name="+prev+"Id]").val(selectUser.id);
        $("input[name="+prev+"Name]").val(selectUser.name);
    };



    //加载数据
    pageData.getData = function(){
        var p = common.util.getHrefParam();//地址参数
        common.sendOption.data = { id:p.id };
        common.sendOption.url = common.url.web_root + common.url.model.orderExport.action + common.url.opt.get;
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
    pageData.initDetail = function (item) {

        form.val('export_form',{
            id:item.id,
            orderId:item.orderId,
            exportDate:item.exportDate,
            type:item.type,
            exportAccountId:item.exportAccountId,
            importAccountId:item.importAccountId,
            cardPassword:item.cardPassword,
            name:item.name,
            cardNumber:item.cardNumber,
            importBill:item.importBill,
            rate:item.rate,
            fee:item.fee,
            remark:item.remark
        });
        //获取一些id对应的名称
    };




    $(function () {

        //初始化日期控件
        common.util.initSelectDate(laydate,'exportDate',common.formatDateType.datetime);
        //初始化操作类型
        common.util.getOrderTypeOptions('type');
        form.render('select');

        //点选客户
        $("input[name=customerName]").click(function () {
            pageData.openCustomerSelectModel();
        });

        //点选转出
        $("input[name=exportAccountName]").click(function () {
            pageData.openAccountSelectModel('exportAccount');
        });

        //点选转入
        $("input[name=importAccountName]").click(function () {
            pageData.openAccountSelectModel('importAccount');
        });

        //初始化手续费率选择
        common.util.getRatesOptions('rate');

        //监听提交按钮 submit(btn_id)
        form.on('submit(formAdd)', function(data){
            pageData.submitAdd(data.field);
            return false;
        });

    })




});
