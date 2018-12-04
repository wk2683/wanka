//修改订单入账


layui.use(['form','layer','util','laydate'],function () {
    var util = layui.util;
    var laydate = layui.laydate;
    var layer = layui.layer;
    var form = layui.form;
    var user = layui.sessionData('user');


    var pageData = {};



    pageData.submitAdd = function(param){
        if(param.exportDate){
            var d = new Date(param.exportDate);
            param.exportDate = d.getTime();
        }
        common.sendOption.data = param;
        common.sendOption.url = common.url.web_root + common.url.model.orderImport.action + common.url.opt.update;
        common.sendOption.type = common.sendMethod.POST;
        common.sendOption.completeCallBack =pageData.addComplete;
        common.httpSend(common.sendOption);
    }

    pageData.addComplete = function(res){
        var p = common.util.getHrefParam();
        var order_export_url = common.url.model.order.page.imexport + '?id=' + p.orderId;
        common.noDataResponse(res,common.optName.CONTROLLER_OPT_UPDATE,order_export_url);
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
        $("input[name="+prev+"Name]").val(selectUser.name);
    };



    pageData.getData = function(id){
        common.sendOption.data = {id:id};
        common.sendOption.url = common.url.web_root + common.url.model.orderImport.action + common.url.opt.get;
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
            if(pageData.importOrder){
                $("select[name=mallName]").val(pageData.importOrder.mallName);
            }
            form.render('select');
        }
    };
    pageData.renderData = function(data){
        pageData.importOrder = data;
        //初始化日期控件
        common.util.initSelectDate(laydate,'exportDate',common.formatDateType.datetime);

        //初始化操作类型
        var p = common.util.getHrefParam();
        common.util.getOrderImportTypeOptions('type',p.type);

        common.util.getConsumeTypeOptions('consumeType')

        //商户名称
        common.util.loadMallList(pageData.initShowMallName);

        form.val('import_form',{
            id:data.id,
            exportDate:util.toDateString(data.exportDate,'yyyy-MM-dd HH:mm:ss'),
            type:data.type,
            posId:data.posId,
            posName:data.posName,
            mallName:data.mallName,
            consumeAccountId:data.consumeAccountId,
            consumeAccountName:data.consumeAccountName,
            bill:data.bill,
            consumeType:data.consumeType,
            result:data.result,
            rate:data.rate,
            fee:data.fee,
            importBill:data.importBill,
            shouldBill:data.shouldBill,
            rate:data.rate ,
            fee:data.fee,
            seg:data.seg,
            remark:data.remark
        })

        form.render();
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
        var order = JSON.parse(sessionStorage.order);
        var shouldBill = 0;
        if(orderImport && orderImport.length>0 ) {
            var len = orderImport.length;
            var bill = 0;
            for (var i = 0; i < len; i++) {
                var imp = orderImport[i];
                if (imp.result == 1) {
                    bill += imp.bill;
                }
            }
            shouldBill = order.total - bill;
        }else{//如果是第一条入账记录

            shouldBill = order.total;//订单总额
        }
        pageData.shouldBill = shouldBill;
        // $("input[name=shouldBill]").val(shouldBill);
    };

    $(function () {
        pageData.initShouldBill();
        //保存地址上的参数
        var p = common.util.getHrefParam();
        $("input[name=id]").val(p.id);
        $("input[name=orderId]").val(p.orderId);




        //点选POS机
        $("input[name=posName]").click(function () {
            pageData.openSelectModel('pos');
        });


        //监听输入完消费金额
        $("input[name=bill]").blur(function () {
            pageData.computerFee();
        });

        //添加商户
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

        pageData.getData(p.id);

    })




});
