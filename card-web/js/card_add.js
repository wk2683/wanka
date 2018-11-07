//新增员工


layui.use(['form','layer','laydate'],function () {


    var laydate = layui.laydate;
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

    pageData.submitAdd = function(param){
        common.sendOption.data = param;
        common.sendOption.url = common.url.web_root + common.url.model.card.action + common.url.opt.add;
        common.sendOption.type = common.sendMethod.POST;
        common.sendOption.completeCallBack =pageData.addComplete;

        common.httpSend(common.sendOption);
    }

    pageData.addComplete = function(res){
        common.noDataResponse(res,common.optName.CONTROLLER_OPT_ADD,common.url.model.card.page.manager);
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

    //初始化 信息
    //初始化银行列表
    pageData.initBankList();
    //监听提交按钮 submit(btn_id)
    form.on('submit(formAdd)', function(data){
       pageData.submitAdd(data.field);
        return false;
    });

    common.util.initSelectDate(laydate,'validDate',common.formatDateType.month);

    //点击选择用户
    $("input[name=customerName]").click(function () {
        pageData.openSelectUserMode();
    });


});