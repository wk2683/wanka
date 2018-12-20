//新增员工


layui.use(['form','layer'],function () {



    var layer = layui.layer;
    var form = layui.form;
    var user = layui.sessionData('user');


    var pageData = {};
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
            'self':(card.self==1?'是':'否'),
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
            'validDate':card.validDate,
            'total':card.total,
            'bill':card.bill,
            'replayRate':card.replayRate,
            'miniFee':card.miniFee,
            'cashRate':card.cashRate,
            'income':(card.income==1?'是':'否'),
            'seg':card.seg,
            'remark':card.remark,
        });
        common.util.initNameById(card.customerId,common.url.model.customer.action,$('input[name=customerName]'));
    };


    //执行部分
    pageData.getData();

});
