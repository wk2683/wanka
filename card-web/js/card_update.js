//新增员工


layui.use(['form','layer'],function () {



    var layer = layui.layer;
    var form = layui.form;
    var user = layui.sessionData('user');


    var pageData = {};

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

    pageData.submitUpdate = function(param){
        common.sendOption.data = param;
        common.sendOption.url = common.url.web_root + common.url.model.card.action + common.url.opt.update;
        common.sendOption.type = common.sendMethod.POST;
        common.sendOption.completeCallBack =pageData.updateComplete;

        common.httpSend(common.sendOption);
    }

    pageData.updateComplete = function(res){
        common.noDataResponse(res,common.optName.CONTROLLER_OPT_UPDATE,common.url.model.card.page.manager);
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
            content: common.url.page_root + common.url.model.customer.page.selectList,
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
        $("input[name=customerId]").val(selectUser.id);
        $("input[name=customerName]").val(selectUser.name);
    };




    //加载数据
    pageData.getData = function(){
        var p = common.util.getHrefParam();//地址参数
        common.sendOption.data = { id:p.id };
        common.sendOption.url = common.url.web_root + common.url.model.card.action + common.url.opt.get;
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

        form.val('card_detail_form',{
            'id':card.id,
            'self':(card.self==1),
            'customerId':card.customerId,
            'customerName':card.customerId,
            'cardName':card.cardName,
            'name':card.name,
            'idNumber':card.idNumber,
            'phone':card.phone,
            'bankName':card.bankName,
            'cardNumber':card.cardNumber,
            'password':card.password,
            'billDate':card.billDate,
            'replayDate':card.replayDate,
            'total':card.total,
            'bill':card.bill,
            'replayRate':card.replayRate,
            'miniFee':card.miniFee,
            'cashRate':card.cashRate,
            'income':(card.income==1),
            'seg':card.seg,
            'remark':card.remark,
        });
    };





    //初始化 信息
    //初始化银行列表
    pageData.initBankList();




    pageData.getData();




    //监听提交按钮 submit(btn_id)
    form.on('submit(formAdd)', function(data){
       pageData.submitUpdate(data.field);
        return false;
    });

    //点击选择用户
    $("input[name=customerName]").click(function () {
        pageData.openSelectUserMode();
    });


});