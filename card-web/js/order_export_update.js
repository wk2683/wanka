//修改订单出账


layui.use(['form','layer','util','laydate'],function () {
    var util = layui.util;
    var laydate = layui.laydate;
    var layer = layui.layer;
    var form = layui.form;
    var user = layui.sessionData('user');


    var pageData = {};



    pageData.submitUpdate = function(param){
        if(param.exportDate){
            var d = new Date(param.exportDate);
            param.exportDate = d.getTime();
        }
        common.sendOption.data = param;
        common.sendOption.url = common.url.web_root + common.url.model.orderExport.action + common.url.opt.update;
        common.sendOption.type = common.sendMethod.POST;
        common.sendOption.completeCallBack =pageData.updateComplete;
        common.httpSend(common.sendOption);
    }

    pageData.updateComplete = function(res){
        var p = common.util.getHrefParam();
        var order_export_url = common.url.model.order.page.imexport + '?id=' + p.orderId;
        common.noDataResponse(res,common.optName.CONTROLLER_OPT_UPDATE,order_export_url);
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
            layer.msg('只能选择一个账户哦~',{anim:6},function () {
                pageData.openAccountSelectModel(prev);
            });

            return false;
        }
        var selectUser = selectUsers[0];
        $("input[name="+prev+"Id]").val(selectUser.id);
        $("input[name="+prev+"Name]").val(selectUser.name);// + ' ' + (selectUser.cardNumber?selectUser.cardNumber:''));
        // $("input[name="+prev+"Text]").text(selectUser.cardNumber);
    };


    pageData.getData = function(id){
        common.sendOption.data = {id:id};
        common.sendOption.url = common.url.web_root + common.url.model.orderExport.action + common.url.opt.get;
        common.sendOption.type = common.sendMethod.GET;
        common.sendOption.completeCallBack =pageData.getComplete;
        common.httpSend(common.sendOption);
    };

    pageData.getComplete = function(res){
        var resData = JSON.parse(res.responseText);
        if(resData.code == common.code.RESPONSE_CODE_SUCCESS){
            pageData.renderData(JSON.parse(resData.data));
        }else{
            layer.alert('加载数据失败',{anim: 6},function () {
                history.back()
            })
        }
    };
    pageData.renderData = function(data){

        form.val('export_form',{
            id:data.id,
            exportDate:util.toDateString(data.exportDate,'yyyy-MM-dd HH:mm:ss'),
            type:data.type,
            exportAccountId:data.exportAccountId,
            exportAccountName:data.exportAccountName + ' ' + data.exportAccountNumber,
            importAccountId:data.importAccountId ,
            importAccountName:data.importAccountName ,
            bankName:data.bankName,
            name:data.name ,
            cardNumber:data.cardNumber,
            importBill:data.importBill,
            rate:data.rate ,
            fee:data.fee,
            seg:data.seg,
            remark:data.remark
        });
        // $(".exportAccountText").text( '卡号：' + data.exportAccountNumber);
        //初始化日期控件
        common.util.initSelectDate(laydate,'exportDate',common.formatDateType.datetime);

        form.render();
    };


    $(function () {
        //保存地址上的参数
        var p = common.util.getHrefParam();
        $("input[name=id]").val(p.id);
        $("input[name=orderId]").val(p.orderId);
        //初始化操作类型
        common.util.getOrderExportTypeOptions('type',p.type);
        if(p.type==2){
            //取现，则隐藏入账字段
            var ian = $("input[name=importAccountName]");ian.val(0);ian.closest('.layui-form-item').hide();
            $("input[name=importAccountId]").remove();
            $(".card-number-text").text('取现转账，直接输入客户的银行卡号')
        }
        // var card = JSON.parse(sessionStorage.orderCard);
        // $("input[name=importAccountName]").val(card.cardName);
        // $("input[name=importAccountId]").val(card.id);
        // $("input[name=name]").val(card.name);
        // $("input[name=cardNumber]").val(card.cardNumber);
        // $("input[name=bankName]").val(card.bankName);


        //点选转出资金账户
        $("input[name=exportAccountName]").click(function () {
            pageData.openAccountSelectModel('exportAccount');
        });

        //监听提交按钮 submit(btn_id)
        form.on('submit(formUpdate)', function(data){
            pageData.submitUpdate(data.field);
            return false;
        });

        pageData.getData(p.id);

    })




});
