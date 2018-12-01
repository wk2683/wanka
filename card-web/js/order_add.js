//新增订单


layui.use(['form','layer','upload'],function () {


    var upload = layui.upload;
    var layer = layui.layer;
    var form = layui.form;
    var user = layui.sessionData('user');


    var pageData = {};

    //订单检测
    pageData.checkOrder = function(param,submitAdd){

        common.sendOption.data = {customerId:param.customerId,cardId:param.cardId};
        common.sendOption.url = common.url.web_root + common.url.model.order.action + common.url.opt.model.order.orderCheck;
        common.sendOption.type = common.sendMethod.GET;
        common.sendOption.completeCallBack = function (res) {
            var resData = JSON.parse(res.responseText);
            if(resData.code = common.code.RESPONSE_CODE_SUCCESS){
                var data = JSON.parse(resData.data);
                if(data && data.length>0 ){    //订单已经存在

                    var content = '';
                    var ilen = data.length;
                    for(var ii = 0;ii<ilen;ii++){
                        var o = data[ii];
                        var detail_url = common.url.page_root + common.url.model.order.page.detail + '?id='+ o.id;
                        content += '已存在 客户 和 信用卡 相同的订单  [<a href="'+detail_url+'">查看详情</a>]<br/><br/>';
                    }
                    content = '<div style="text-align: center;">' + content + '</div>';
                    layer.open({
                        area: ['500px', '300px'],
                        type:1,
                        title:'订单检测结果',
                        content:content,
                        yes:function (index,layro) {
                            layer.close(index);
                        }
                    });
                    return false;
                }else{
                    submitAdd(param);
                }
            }
        };
        common.httpSend(common.sendOption);
    };


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
    //显示选择的信息
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
        pageData.orderCard = selectUser;//保存选择的信用卡
        if(modelName=='card'){//显示卡号
            $("."+modelName+"Text").text(  !!selectUser.cardNumber?'信用卡号：' + (selectUser.cardNumber):'');
            var type = $("#type").val();
            if(type == '1'){
                $("input[name=rate]").val(selectUser.replayRate);//还款费率
            }else if(type == '2'){
                $("input[name=rate]").val(selectUser.cashRate);//取现费率
            }
            //显示账单日，还款日，总额
            $("input[name=billDate]").val(selectUser.billDate);
            $("input[name=replayDate]").val(selectUser.replayDate);
            $("input[name=total2]").val(selectUser.total);
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
            var customerId = $("input[name=customerId]").val();
            if(!customerId){
                layer.msg("先选择客户");
                return false;
            }
            pageData.openSelectModel('card',customerId);
        });

        form.on("select(typeChange)",function () {
            var type = $("#type").val();
            var card = pageData.orderCard;
            if(type == '1'){
                $("input[name=rate]").val(card.replayRate);//还款费率
            }else if(type == '2'){
                $("input[name=rate]").val(card.cashRate);//取现费率
            }
            pageData.initCount();
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

            pageData.checkOrder(data.field,pageData.submitAdd);

            return false;
        });

    })




});
