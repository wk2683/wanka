//新增订单


layui.use(['form','layer','upload'],function () {


    var upload = layui.upload;
    var layer = layui.layer;
    var form = layui.form;
    var user = layui.sessionData('user');


    var pageData = {};



    pageData.submitAdd = function(param){
        common.sendOption.data = param;
        common.sendOption.url = common.url.web_root + common.url.model.order.action + common.url.opt.add;
        common.sendOption.type = common.sendMethod.POST;
        common.sendOption.completeCallBack =pageData.addComplete;

        common.httpSend(common.sendOption);
    }

    pageData.addComplete = function(res){

        common.noDataResponse(res,common.optName.CONTROLLER_OPT_ADD,common.url.model.order.page.manager);
    };
    //打开选择客户
    pageData.openSelectModel = function(modelName){
        var ww = $(window).width();
        ww = ww*0.8;
        var hh = $(window).height();
        hh = hh*0.8;
        var url = common.url.page_root + common.url.model.customer.page.selectList;
        if(modelName=='customer'){

        }else if(modelName=='card'){
            url = common.url.page_root + common.url.model.card.page.selectList;
        }
        layer.open({
            type:2,
            title:'选择用户',
            content: url,
            area:[ ww+'px',hh+'px'],
            btn:['确定'],
            yes:function (index, layero) {
                console.log("点击了确定");
                pageData.showSelect(modelName);
                layer.close(index);//关掉自己
            }
        })
    };
    //显示选择的客户
    pageData.showSelect = function(modelName){
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
                // pageData.openSelectUserMode();
                pageData.openSelectModel(modelName);
            });

            return false;
        }
        var selectUser = selectUsers[0];

        $("input[name="+modelName+"Id]").val(selectUser.id);
        $("input[name="+modelName+"Name]").val(selectUser.name);
    };



    $(function () {

        common.util.getOrderTypeOptions('type');
        form.render('select');

        //点选下单的客户
        $("input[name=customerName]").click(function () {
            pageData.openSelectModel('customer');
        });

        //点选下单的信用卡
        $("input[name=cardName]").click(function () {
            pageData.openSelectModel('card');
        });

        //监听提交按钮 submit(btn_id)
        form.on('submit(formAdd)', function(data){
            pageData.submitAdd(data.field);
            return false;
        });

    })




});