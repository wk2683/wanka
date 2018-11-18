//待还款 管理脚本


layui.use(['form','table','layer','laydate'],function () {


    var table = layui.table;
    var layer = layui.layer;
    var form = layui.form;
    var laydate = layui.laydate;
    var user = layui.sessionData('user');

    var pageData = {};

    var tableHeader = [[ //表头
        {field: 'id',        title: 'ID', align:'center',width:100},
        {field: 'cardName',title: '信用卡名', align:'center',width:150},
        {field: 'cardNumber',title: '卡号', align:'center',width:250},
        {field: 'billDate',title: '账单日', align:'center',width:100},
        {field: 'replayDate',title: '还款日期', align:'center',width:100},
        {field: 'remainDate',title: '剩余天数', align:'center',width:100 ,templet:'#remainTemplate'},
        // {field: 'customerId',title: '下单人ID', align:'center'},
        {field: 'customerName',title: '下单人', align:'center',width:150},
        {field: 'type',      title: '订单类型', align:'center',templet:'#orderTypeTemplate',width:100},
        {field: 'total',     title: '订单总额', align:'center',width:100},
        {field: 'rate',      title: '手续费率', align:'center',width:100},
        {field: 'fee',       title: '手续费', align:'center',width:100},
        {field: 'discount',  title: '优惠金额', align:'center',width:100},
        {field: 'realFee',   title: '实收手续费', align:'center',width:100},
        {field: 'status',    title: '订单状态', align:'center',templet:'#statusTemplate',width:100},
        {field: 'remark',    title: '备注', align:'center',width:100},
        {fixed: 'right',  align:'center',width:100, toolbar: '#toolbarRight'} //这里的toolbar值是模板元素的选择器
    ]];

    pageData.initTableData = function(data,tableId) {
        table.render({
            elem: '#'+tableId //指定原始表格元素选择器（推荐id选择器）
            , cols: tableHeader //表头
            , page: true // boolean | object  -----单独生成分页并接收点击分页事件 laypage 组件
            , limit: 30 //每页显示数量
            , limits: [10,  30, 50,100,200] //可选择设定每页数量
            , loading: true //true | false 是否显示加载条
            , title: '待还款订单表' //定义table大标题（比如导出时则为文件名）
            , text: {none: '无数据'} //空数据时提示信息
            , skin: 'row' //行边框风格 line | row | nob
            ,data:data
            , even: true  //隔行背景 true | false
            , size: 'sm'  //小尺寸 sm | lg
        });


        //监听工具条
        table.on('tool('+ tableId +'Event)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            // var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            // var tr = obj.tr; //获得当前行 tr 的DOM对象
            console.log("点击事件......"+layEvent);
            if(layEvent === 'repayment'){ //还款
                var imexport_url = common.url.page_root + common.url.model.order.page.imexport + '?id='+obj.data.id;
                window.open(imexport_url);
            }
        });

    };
    //渲染表格方法结束

    pageData.loadRepayment = function(){
        common.sendOption.data = {
            status:3 //业务中的订单
        };
        common.sendOption.url = common.url.web_root + common.url.model.order.action + common.url.opt.search;
        common.sendOption.type = common.sendMethod.GET;
        common.sendOption.completeCallBack =pageData.loadComplete;

        common.httpSend(common.sendOption);
    };

    pageData.loadComplete = function(res){
        var resData = JSON.parse(res.responseText);
        var data = JSON.parse(resData.data);

        var data0 = new Array();
        var data1 = new Array();
        var data3 = new Array();
        var data8 = new Array();
        var data9 = new Array();
        if(data && data.length>0) {
            var len = data.length;
            var date = new Date();
            var nowDate = date.getDate();
            var days = common.util.getMonthDays(date);
            for(var i=0; i<len; i++ ){
                var order = data[i];
                var billDate = order.billDate;//账单日
                var replayDate = order.replayDate;//还款日
                var remainDate = 0;
                //一、 billDate > repayDate  账单日大于还款日
                //     repayDate billDate nowDate   > repayDate     过了账单日，但没到还款日期，
                //     repayDate nowDate  billDate  > repayDate     过了还款日，未到账单日，则***已经超期
                //     nowDate  repayDate billDate  > repayDate     出账单了，未到还款日期，

                //二、 billDate < repayDate  账单日 小于 还款日
                //     billDate  repayDate nowDate   过了还款日期，又未出账。则超期
                //     billDate  nowDate repayDate   还有repayDate-nowDate
                //     nowDate billDate  repayDate   未出账，但在业务中，则超期
                if(billDate>replayDate){
                    if(  nowDate > billDate ){
                        remainDate = days - nowDate + replayDate;
                    }else if(billDate>nowDate && nowDate>replayDate){
                        remainDate = replayDate - nowDate;//超期天数
                    }else if( replayDate > nowDate ){
                        remainDate = replayDate - nowDate;
                    }
                }else {
                    if(nowDate > replayDate ){
                        remainDate = replayDate - nowDate;//超期天数
                    }else  if(billDate < nowDate && nowDate < replayDate ){
                        remainDate = replayDate - nowDate;
                    }else  if(nowDate < billDate){
                        remainDate = -( days - replayDate + nowDate);//超期天数
                    }
                }

                order.remainDate = remainDate;

                if(remainDate < 0 ){
                    data0.push(order);
                }else if(remainDate <= 1 ){
                    data1.push(order);
                }else if(remainDate <= 3 ){
                    data3.push(order);
                }else if(remainDate <= 8 ){
                    data8.push(order);
                }else {
                    data9.push(order);
                }
            }
        }
        if(data0.length>0) {
            pageData.initTableData(data0, 'orderList0');
        }else{
            $("#t0").hide();
        }
        if(data1.length>0) {
            pageData.initTableData(data1, 'orderList1');
        }else{
            $("#t1").hide();
        }
        if(data3.length>0) {
            pageData.initTableData(data3, 'orderList30');
        }else{
            $("#t3").hide();
        }
        if(data8.length>0) {
            pageData.initTableData(data8, 'orderList8');
        }else{
            $("#t8").hide();
        }

    };

    $(function () {
        pageData.loadRepayment();
    });
});