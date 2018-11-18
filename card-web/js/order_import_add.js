//新增订单入账


layui.use(['form','layer','upload','laydate'],function () {

    var laydate = layui.laydate;
    var upload = layui.upload;
    var layer = layui.layer;
    var form = layui.form;
    var user = layui.sessionData('user');


    var pageData = {};



    pageData.submitAdd = function(param){
        if(param.exportDate){
            var d = new Date(param.exportDate);
            param.exportDate = d.getTime();
        }
        if(!param.mallName ){
            if(param.mallName2){
                param.mallName = param.mallName2;
                common.util.addMall(param.mallName2);
            }else{
                layer.alert('选择或输入商户名称',{anim: 6},function () {
                    layer.closeAll();
                });
                return false;
            }
        }


        common.sendOption.data = param;
        common.sendOption.url = common.url.web_root + common.url.model.orderImport.action + common.url.opt.add;
        common.sendOption.type = common.sendMethod.POST;
        common.sendOption.completeCallBack =pageData.addComplete;
        common.httpSend(common.sendOption);
    }

    pageData.addComplete = function(res){
        var p = common.util.getHrefParam();
        var order_export_url = common.url.model.order.page.imexport + '?id=' + p.orderId;
        common.noDataResponse(res,common.optName.CONTROLLER_OPT_ADD,order_export_url);
    };


    //打开选择资金账户
    pageData.openSelectModel = function(prev){
        var model  =  'account';
        if(prev=='pos'){
            model = 'pos';
        }
        var ww = $(window).width();
        ww = ww*0.8;
        var hh = $(window).height();
        hh = hh*0.8;
        layer.open({
            type:2,
            title:'选择用户',
            content: common.url.page_root + common.url.model[model].page.selectList,
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
                pageData.openSelectModel(prev);
            });

            return false;
        }
        var selectUser = selectUsers[0];

        $("input[name="+prev+"Id]").val(selectUser.id);
        $("input[name="+prev+"Name]").val(selectUser.name + ' ' + selectUser.cardNumber);

        if(prev=='pos'){
            pageData.pos = selectUser;//记住选择的POS信息
            $("input[name=rate]").val(selectUser.rate1);
        }
    };

    pageData.computerFee = function(){
        var bill = $("input[name=bill]").val();//消费金额
        var rate = $("input[name=rate]").val();//费率
        bill = parseFloat(bill);
        rate = parseFloat(rate);
        var fee =  bill * rate / 100 ;
        var importBill = bill - fee ;
        $("input[name=fee]").val( fee.toFixed(2));//成本手续费
        $("input[name=importBill]").val( importBill.toFixed(2));//成本手续费

        var result = $("select[name=result]").val();
        if(result == 1){
            var shouldDom = $("input[name=shouldBill]");
            var shouldBill  = pageData.shouldBill - bill;
            shouldDom.val(shouldBill.toFixed(2));
            if(shouldBill<0){
                $("#shouldBillWarm").text("刷出金额超量");
            }else {
                $("#shouldBillWarm").text("");
            }
        }
    };

    pageData.initShouldBill = function(){
        var orderImport = JSON.parse(sessionStorage.orderImport);
        var shouldBill = 0;
        if(orderImport) {
            var len = orderImport.length;
            var bill = 0;
            for (var i = 0; i < len; i++) {
                var imp = orderImport[i];
                if (imp.result == 1) {
                    bill += imp.bill;
                }
            }
            shouldBill
        }else{//如果是第一条入账记录
            var order = JSON.parse(sessionStorage.order);
            shouldBill = order.total;//订单总额
        }
        pageData.shouldBill = shouldBill;
        $("input[name=shouldBill]").val(shouldBill);
    };

    //监听选择消费方式
    form.on('select(consumeTypeSelect)', function(data){
        // console.log(data.elem); //得到select原始DOM对象
        // console.log(data.value); //得到被选中的值
        // console.log(data.othis); //得到美化后的DOM对象
        //显示费率
        if(data.value == 1){
            $("input[name=rate]").val(pageData.pos.rate1);
        }else if(data.value == 2 ){
            $("input[name=rate]").val(pageData.pos.rate2);
        }
        //显示手续费
        pageData.computerFee();
    });

    //监听选择操作（只有选择失败才执行处理）
    form.on('select(resultSelect)', function(data){
        // console.log(data.elem); //得到select原始DOM对象
        // console.log(data.value); //得到被选中的值
        // console.log(data.othis); //得到美化后的DOM对象
        //显示费率
        if(data.value == 2){
            $("input[name=fee]").val(0);
            $("input[name=importBill]").val(0);
            $("input[name=shouldBill]").val(pageData.shouldBill);
            $("#shouldBillWarm").text("");
        }else{
            pageData.computerFee();
        }

    });

    pageData.initShowMallName = function(){
        var mallList = JSON.parse(sessionStorage.mallList);
        if(mallList && mallList.length>0){
            var options = '<option value="">选择商户名称</option>';
            var len = mallList.length;
            for(var i=0;i<len;i++){
                var mall = mallList[i];
                options += '<option value="'+ mall.name +'" data-nickname="'+ mall.nickName +'">'+ mall.name +'</option>'
            }
            $("select[name=mallName]").html(options);
            form.render('select');
        }
    };



    $(function () {
        pageData.initShouldBill();//应该刷余额计算并显示

        var p = common.util.getHrefParam();
        $("input[name=orderId]").val(p.orderId);
        //初始化日期控件
        common.util.initSelectDate(laydate,'exportDate',common.formatDateType.datetime);
        //初始化操作类型
        // common.util.getOrderTypeOptions('type');
        common.util.getOrderImportTypeOptions('type',p.type);

        //商户名称
        common.util.loadMallList(pageData.initShowMallName);
        //消费方式
        common.util.getConsumeTypeOptions('consumeType',1)


        //点选POS机
        $("input[name=posName]").click(function () {
            pageData.openSelectModel('pos');
        });

        //点选消费账户（下单时固定了）
        // $("input[name=consumeAccountName]").click(function () {
        //     pageData.openSelectModel('consumeAccount');
        // });

        var card = JSON.parse(sessionStorage.orderCard);
        $("input[name=consumeAccountName]").val(card.name);
        $("input[name=consumeAccountId]").val(card.id);
        $("#consumeAccountText").text('信用卡号：' + card.cardNumber);

        // //初始化手续费率选择 由选择POS机时自动计算
        // common.util.getRatesOptions('rate');
        form.render('select');

        //监听输入完消费金额
        $("input[name=bill]").blur(function () {
            pageData.computerFee();
        });


        $("#addMall").click(function () {
            // $(this).hide();
            event.preventDefault();
            event.stopPropagation();

            var mall2 = document.getElementById('mallName2');


            mall2.style.display= !!mall2.style.display ?'':'none';//显示输入框
            var inputValue = $("select[name=mallName]").next().find("input").val();

            if(inputValue){
                inputValue = $.trim(inputValue);
                if(inputValue && inputValue.indexOf("选择")<0){
                    mall2.value=inputValue;
                }
            }
            return false;
        });

        //监听提交按钮 submit(btn_id)
        form.on('submit(formAdd)', function(data){

            pageData.submitAdd(data.field);
            return false;
        });

    })




});
