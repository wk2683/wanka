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

    /**
     * 打开选择客户 或者选择信用卡
     * @param modelName  模块名，选择客户时为 customer ,选择信用卡时为 card
     * @param customerId 客户ID，选择信用卡时才会有
     */
    pageData.openSelectModel = function(modelName,customerId){
        var ww = $(window).width();
        ww = ww*0.8;
        var hh = $(window).height();
        hh = hh*0.8;
        var url = common.url.page_root + common.url.model.customer.page.selectList;
        if(modelName=='customer'){

        }else if(modelName=='card'){
            url = common.url.page_root + common.url.model.card.page.selectList+'?customerId='+customerId;
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
        if(modelName=='card'){//显示卡号
            $("."+modelName+"Text").text(  !!selectUser.cardNumber?'信用卡号：' + (selectUser.cardNumber):'');
        }
    };
    //自动填写手续费，实收手续费
    pageData.initCount = function () {
        var total = $("input[name=total]").val();
        total = parseFloat(total);
        var rate = $("input[name=rate]").val();
        rate = parseFloat(rate);
        var fee= total * rate / 100;
        $("input[name=fee]").val(fee.toFixed(2));
        var discountDom = $("input[name=discount]");
        var discount = discountDom.val();
        discount = parseFloat(discount);
        var realFee = fee - discount;
        $("input[name=realFee]").val(realFee.toFixed(2));
    }


    $(function () {

        common.util.getOrderTypeOptions('type');
        form.render('select');

        //点选下单的客户
        $("input[name=customerName]").click(function () {
            pageData.openSelectModel('customer');
        });

        //点选下单的信用卡
        $("input[name=cardName]").click(function () {
            var customerId = $("input[name=customerId]").val();
            if(!customerId){
                layer.msg("先选择客户");
                return false;
            }
            pageData.openSelectModel('card',customerId);
        });

        //监控手续费率自动填写手续费
        $("input[name=total]").blur(function () {
            pageData.initCount();
        });

        //监控手续费率自动填写手续费
        $("input[name=rate]").blur(function () {
            pageData.initCount();
        });

        //监控优惠金额后自动填写实收
        $("input[name=discount]").blur(function () {
            pageData.initCount();
        });

        //监听提交按钮 submit(btn_id)
        form.on('submit(formAdd)', function(data){
            pageData.submitAdd(data.field);
            return false;
        });

    })




});
