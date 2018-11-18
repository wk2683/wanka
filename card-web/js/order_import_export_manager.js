//订单出入账管理


layui.use(['form','layer','table','util'],function () {
    var util = layui.util;
    var layer = layui.layer;
    var form = layui.form;
    var table = layui.table;
    var user = layui.sessionData('user');

    var pageData = {};

    //出账表头
    var exportTableHeader = [[
        {field: 'id',title: 'ID', align:'center'},
        {field: 'exportDate',title: '日期', align:'center',width:150},
        {field: 'type',title: '操作类型', align:'center',width:150},
        // {field: 'exportAccountId',title: '转出账户', align:'center'},
        {field: 'exportAccountName',title: '转出账户', align:'center',width:150},
        // {field: 'importAccountId',title: '转入账户', align:'center',width:150},
        {field: 'importAccountName',title: '转入账户', align:'center',width:150},
        // {field: 'cardPassword',title: '卡密码', align:'center',width:150},
        {field: 'cardNumber',title: '输入卡号', align:'center',width:150},
        {field: 'name',title: '姓名', align:'center',width:100},
        {field: 'importBill',title: '还入金额', align:'center',width:150},
        // {field: 'rate',title: '费率', align:'center',width:150},
        {field: 'fee',title: '手续费', align:'center',width:150},
        {field: 'remark',title: '备注', align:'center',width:150},
        {fixed: 'right',  align:'center',width:100, toolbar: '#toolbarRight'} //这里的toolbar值是模板元素的选择器
    ]];
    //入账表头
    var importTableHeader = [[
        {field: 'id',title: 'ID', align:'center'},
        {field: 'exportDate',title: '日期', align:'center',width:150},
        {field: 'type',title: '操作类型', align:'center',width:100},
        // {field: 'posId',title: 'POS机名称', align:'center'},
        {field: 'posName',title: 'POS机名称', align:'center',width:150},
        {field: 'mallName',title: '商户名称', align:'center',width:150},
        // {field: 'consumeAccountId',title: '消费账户', align:'center'},
        {field: 'consumeAccountName',title: '消费信用卡号', align:'center',width:150},
        {field: 'bill',title: '消费金额', align:'center',width:100},
        {field: 'consumeType',title: '消费方式', align:'center',width:100,templet:'#consumeTemplate'},
        {field: 'result',title: '操作结果', align:'center',width:100,templet:'#resultTemplate'},
        {field: 'rate',title: '手续费率', align:'center',width:150},
        {field: 'fee',title: '成本手续费', align:'center',width:150},
        {field: 'importBill',title: '到账金额', align:'center',width:150},
        {field: 'shouldBill',title: '应刷余额', align:'center',width:150},
        {field: 'remark',title: '备注', align:'center',width:150},
        {fixed: 'right',  align:'center',width:100, toolbar: '#toolbarRight'} //这里的toolbar值是模板元素的选择器
    ]];

    //获取详情
    pageData.getData = function(){
        var param = common.util.getHrefParam();
        common.sendOption.data = {id:param.id};
        common.sendOption.url = common.url.web_root + common.url.model.order.action + common.url.opt.get;
        common.sendOption.type = common.sendMethod.GET;
        common.sendOption.completeCallBack =pageData.getComplete;

        common.httpSend(common.sendOption);
    };
    //获取订单信息完成处理
    pageData.getComplete = function(res){
        var resData = JSON.parse(res.responseText);

        if(resData.code == common.code.RESPONSE_CODE_SUCCESS){

        }else{
            layer.alert('查询订单失败',{anim:6},function () {
                history.back();
            });
            return false;
        }

        sessionStorage.order = resData.data;
        var data = JSON.parse(resData.data);
        pageData.order = data;//保存为全局

        form.val('order_form',{
            id:data.id,
            customerId:data.customerId,
            customerName:data.customerName,
            cardId:data.cardId,
            cardName:data.cardName,
            type: common.opt.orderTypes[data.type],
            total:data.total,
            rate:data.rate,
            fee:data.fee,
            discount:data.discount,
            realFee:data.realFee,
            status:common.opt.status[data.status],
            remark:data.remark,
        });
        form.render();
        //显示下单客户名（已经修改为关联查询出相应名称）
        // common.util.initNameById(data.customerId,common.url.model.customer.action,$("input[name=customerName]"));
        //查询出卡的信息并锁定
        pageData.getCard(data.cardId);
    };
    //获取信用卡信息
    pageData.getCard = function(id){
        common.sendOption.data = { id:id };
        common.sendOption.url = common.url.web_root + common.url.model.card.action + common.url.opt.get;
        common.sendOption.type = common.sendMethod.GET;
        common.sendOption.completeCallBack = function (res) {
            var resData = JSON.parse(res.responseText);
            if(resData.code == common.code.RESPONSE_CODE_SUCCESS ){
                sessionStorage.orderCard = resData.data;//保存到会话，多页面使用
                var card =  JSON.parse(resData.data);
                pageData.card = card;//保存信用卡信息
                pageData.initCardInfo(card);
            }
        };
        common.httpSend(common.sendOption);
    };
    //初始化信用卡信息（判断是否锁定，是否是自己锁定）
    pageData.initCardInfo = function(card){
        if(card.lock && card.lock==1){
            if(card.lockWorkerId == user.id){//自己曾经编辑

            }else{//他人编辑，您不能操作
                var info = '此订单的信用卡:\n' +
                    '信用卡名称：'+ card.cardName +' \n ' +
                    '卡号：'+ card.cardNumber +'\n' +
                    '持卡人：'+ card.name +' \n' +
                    '正在被[ '+ card.lockWorkerName +' ]操作，\n一张卡不可以被同时操作，\n确定返回上一步选择其它订单.';
                layer.alert(info,function () {
                    history.back();
                })
            }
        }else{
            //无人操作，则先去锁定卡
            pageData.lockCard(card);
        }
        //显示信用卡信息

    };
    //锁上与放卡 参数card为卡信息，lock=1为锁卡，其它为放卡
    pageData.lockCard = function(card,lock){
        if(!lock){
            lock = 1;
        }
        var param = {
            id:card.id,
            lock:lock,
            lockWorkerId:user.id,
        };
        common.sendOption.data = param;
        common.sendOption.url = common.url.web_root + common.url.model.card.action + common.url.opt.model.card.lock;
        common.sendOption.type = common.sendMethod.GET;
        common.sendOption.completeCallBack = function(res){
            var resData = JSON.parse(res.responseText);
            if( resData.code == common.code.RESPONSE_CODE_SUCCESS ){
                if(lock==1) {//锁卡
                    layer.msg('锁定卡成功！');
                }else{//放卡
                    layer.alert('信用卡已经释放,即将返回上一步',function () {
                        history.back();
                    });
                }
            }else{
                if(lock==1) {//锁卡
                    layer.alert('锁定卡失败,即将返回上一步', function () {
                        history.back();
                    });
                }else{//放卡
                    layer.alert('释放卡失败,确定后自动刷新再试', function () {
                        location.href = location.href;
                    });
                }
            }
            if(pageData.card){
                pageData.card.lock = lock;
            }
        };
        common.httpSend(common.sendOption);
    };

    //表格加载数据
    pageData.bindData2Table = function(tableId,tableHeader,searchObj,url){
        //执行渲染
        table.render({
            elem: '#'+tableId //指定原始表格元素选择器（推荐id选择器）
            , cols: tableHeader //表头
            , url: url  //数据源url
            , where: searchObj //如果无需传递额外参数，可不加该参数
            , method: common.sendMethod.GET // get | post 如果无需自定义HTTP类型，可不加该参数
            , contentType: common.sendDataType.JSON//	发送到服务端的内容编码类型。如果你要发送 json 内容，可以设置：contentType: 'application/json'
            , headers: {} //	接口的请求头。如：headers: {token: 'sasasas'}
                          // toolbar: '#toolbarDemo' //指向自定义工具栏模板选择器
                          // toolbar: '<div>xxx</div>' //直接传入工具栏模板字符
                          // toolbar: true //仅开启工具栏，不显示左侧模板
                          // toolbar: 'default' //让工具栏左侧显示默认的内置模板
            , toolbar: '#toolbarSearch'// 'default'  //开启表格头部工具栏区域，该参数支持四种类型值：
            // filter: 显示筛选显示表头图标
            // exports: 显示导出图标
            // print: 显示打印图标
            , defaultToolbar: ['filter', 'print', 'exports'] //自由配置头部工具栏右侧的图标
            // cellMinWidth:int   最小单元格宽
            , done: function (res, curr, count) {//表格渲染完成回调

                //如果是异步请求数据方式，res即为你接口返回的信息。
                //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
                //console.log(res);

                //得到当前页码
                //console.log(curr);

                //得到数据总量
                //console.log(count);

                //生成分页条(无特别处理，则不用额外写分页条代码)
                if(curr==1 ) {
                    pageData.totalCount = count;
                }
            }
            //data:[{}{}{}],  把已经数据给表格，不用表格自己请求后台取数据
            , page: true // boolean | object  -----单独生成分页并接收点击分页事件 laypage 组件
            , limit: 100 //每页显示数量
            , limits: [10,  30, 50,100,200] //可选择设定每页数量
            , loading: true //true | false 是否显示加载条
            , title: '出账表' //定义table大标题（比如导出时则为文件名）
            , text: {none: '无数据'} //空数据时提示信息
            // ,initSort:'' //默认排序字段
            // ,id:'table tag id' //设置table 标签的id值  （因为正常也没有id而可以通过class渲染表格）
            , skin: 'row' //行边框风格 line | row | nob


            //request: {} //如果无需自定义请求参数，可不加该参数
            ,request: {
                pageName: 'page' //页码的参数名称，默认：page
                ,limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }

            , parseData: function (res) { //res 即为原始返回的数据  为 layui 2.4.0 开始新增
                var data = JSON.parse(res.data);

                if(tableId == 'order_import_list'){
                    sessionStorage.orderImport = res.data;
                }
                if(data && data.length>0){
                    var len = data.length;
                    for(var i=0;i<len;i++){
                        var item = data[i];
                        if(item.exportDate){
                            item.exportDate = util.toDateString(new Date(item.exportDate),'yyyy-MM-dd HH:mm')
                        }
                        item.type = common.opt.orderTypes[item.type];

                    }
                }

                return {
                    "code": 0,// res.status, //解析接口状态
                    "msg": '',// res.message, //解析提示文本
                    "count": res.total?res.total:pageData.totalCount,// res.total, //解析数据长度
                    "data": data // res.data.item //解析数据列表
                };
            }
            // ,data:{"code":200,"msg":"abcdefg","count":1000,"data":[{"id":10000,"username":"user-0","sex":"女","city":"城市-0","sign":"签名-0","experience":255,"logins":24,"wealth":82830700,"classify":"作家","score":57},{"id":10001,"username":"user-1","sex":"男","city":"城市-1","sign":"签名-1","experience":884,"logins":58,"wealth":64928690,"classify":"词人","score":27},{"id":10002,"username":"user-2","sex":"女","city":"城市-2","sign":"签名-2","experience":650,"logins":77,"wealth":6298078,"classify":"酱油","score":31},{"id":10003,"username":"user-3","sex":"女","city":"城市-3","sign":"签名-3","experience":362,"logins":157,"wealth":37117017,"classify":"诗人","score":68},{"id":10004,"username":"user-4","sex":"男","city":"城市-4","sign":"签名-4","experience":807,"logins":51,"wealth":76263262,"classify":"作家","score":6},{"id":10005,"username":"user-5","sex":"女","city":"城市-5","sign":"签名-5","experience":173,"logins":68,"wealth":60344147,"classify":"作家","score":87},{"id":10006,"username":"user-6","sex":"女","city":"城市-6","sign":"签名-6","experience":982,"logins":37,"wealth":57768166,"classify":"作家","score":34},{"id":10007,"username":"user-7","sex":"男","city":"城市-7","sign":"签名-7","experience":727,"logins":150,"wealth":82030578,"classify":"作家","score":28},{"id":10008,"username":"user-8","sex":"男","city":"城市-8","sign":"签名-8","experience":951,"logins":133,"wealth":16503371,"classify":"词人","score":14},{"id":10009,"username":"user-9","sex":"女","city":"城市-9","sign":"签名-9","experience":484,"logins":25,"wealth":86801934,"classify":"词人","score":75},{"id":10010,"username":"user-10","sex":"女","city":"城市-10","sign":"签名-10","experience":1016,"logins":182,"wealth":71294671,"classify":"诗人","score":34},{"id":10011,"username":"user-11","sex":"女","city":"城市-11","sign":"签名-11","experience":492,"logins":107,"wealth":8062783,"classify":"诗人","score":6},{"id":10012,"username":"user-12","sex":"女","city":"城市-12","sign":"签名-12","experience":106,"logins":176,"wealth":42622704,"classify":"词人","score":54},{"id":10013,"username":"user-13","sex":"男","city":"城市-13","sign":"签名-13","experience":1047,"logins":94,"wealth":59508583,"classify":"诗人","score":63},{"id":10014,"username":"user-14","sex":"男","city":"城市-14","sign":"签名-14","experience":873,"logins":116,"wealth":72549912,"classify":"词人","score":8},{"id":10015,"username":"user-15","sex":"女","city":"城市-15","sign":"签名-15","experience":1068,"logins":27,"wealth":52737025,"classify":"作家","score":28},{"id":10016,"username":"user-16","sex":"女","city":"城市-16","sign":"签名-16","experience":862,"logins":168,"wealth":37069775,"classify":"酱油","score":86},{"id":10017,"username":"user-17","sex":"女","city":"城市-17","sign":"签名-17","experience":1060,"logins":187,"wealth":66099525,"classify":"作家","score":69},{"id":10018,"username":"user-18","sex":"女","city":"城市-18","sign":"签名-18","experience":866,"logins":88,"wealth":81722326,"classify":"词人","score":74},{"id":10019,"username":"user-19","sex":"女","city":"城市-19","sign":"签名-19","experience":682,"logins":106,"wealth":68647362,"classify":"词人","score":51},{"id":10020,"username":"user-20","sex":"男","city":"城市-20","sign":"签名-20","experience":770,"logins":24,"wealth":92420248,"classify":"诗人","score":87},{"id":10021,"username":"user-21","sex":"男","city":"城市-21","sign":"签名-21","experience":184,"logins":131,"wealth":71566045,"classify":"词人","score":99},{"id":10022,"username":"user-22","sex":"男","city":"城市-22","sign":"签名-22","experience":739,"logins":152,"wealth":60907929,"classify":"作家","score":18},{"id":10023,"username":"user-23","sex":"女","city":"城市-23","sign":"签名-23","experience":127,"logins":82,"wealth":14765943,"classify":"作家","score":30},{"id":10024,"username":"user-24","sex":"女","city":"城市-24","sign":"签名-24","experience":212,"logins":133,"wealth":59011052,"classify":"词人","score":76},{"id":10025,"username":"user-25","sex":"女","city":"城市-25","sign":"签名-25","experience":938,"logins":182,"wealth":91183097,"classify":"作家","score":69},{"id":10026,"username":"user-26","sex":"男","city":"城市-26","sign":"签名-26","experience":978,"logins":7,"wealth":48008413,"classify":"作家","score":65},{"id":10027,"username":"user-27","sex":"女","city":"城市-27","sign":"签名-27","experience":371,"logins":44,"wealth":64419691,"classify":"诗人","score":60},{"id":10028,"username":"user-28","sex":"女","city":"城市-28","sign":"签名-28","experience":977,"logins":21,"wealth":75935022,"classify":"作家","score":37},{"id":10029,"username":"user-29","sex":"男","city":"城市-29","sign":"签名-29","experience":647,"logins":107,"wealth":97450636,"classify":"酱油","score":27}]}
            , even: true  //隔行背景 true | false
            , size: 'sm'  //小尺寸 sm | lg
        });

        var filterTable = 'orderExportTableEvent';
        if(tableId.indexOf('import')>0){
            filterTable = 'orderImportTableEvent';
        }
        //监听工具条
        table.on('tool('+filterTable+')', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象
            console.log("点击事件......"+layEvent);
            if(layEvent === 'delete'){ //删除
                pageData.deleteConfirm(obj,tableId);
            } else if(layEvent === 'update'){ //编辑
                //修改
                var update_url = common.url.page_root + common.url.model.orderExport.page.update ;
                if(tableId.indexOf('import')>0){
                    update_url = common.url.page_root + common.url.model.orderImport.page.update ;
                }
                location.href = update_url+ '?id='+obj.data.id + '&orderId='+obj.data.orderId + '&type='+pageData.order.type;
            }
        });


    };

    //确认删除
    pageData.deleteConfirm = function(obj,tableId){
        layer.confirm('确定删除吗？', function(index){

            layer.close(index);
            //向服务端发送删除指令
            console.log("删除 id  =  "+obj.data.id);
            pageData.deleteSubmit(obj,tableId);
            obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
        });
    };
    //提交删除
    pageData.deleteSubmit = function(obj,tableId){
        common.sendOption.data = { id:obj.data.id };
        common.sendOption.url = common.url.web_root + common.url.model.orderExport.action + common.url.opt.delete;
        if(tableId.indexOf('import')>0){
            common.sendOption.url = common.url.web_root + common.url.model.orderImport.action + common.url.opt.delete;
        }
        common.sendOption.type = common.sendMethod.GET;
        common.sendOption.completeCallBack =pageData.deleteComplete;
        common.httpSend(common.sendOption);
    };
    //删除返回后处理
    pageData.deleteComplete = function(res){
        common.noDataResponse(res,common.optName.CONTROLLER_OPT_DELETE);
    };








    //获取出账
    pageData.getExport = function(searchObj){
        var param = common.util.getHrefParam();
        if(!searchObj){
            searchObj = {};
        }
        searchObj.orderId=param.id;
        var url = common.url.web_root + common.url.model.orderExport.action + common.url.opt.search;
        pageData.bindData2Table('order_export_list',exportTableHeader,searchObj,url);
    };

    //获取入账
    pageData.getImport = function(searchObj){
        var param = common.util.getHrefParam();
        if(!searchObj){
            searchObj = {};
        }
        searchObj.orderId=param.id;
        var url = common.url.web_root + common.url.model.orderImport.action + common.url.opt.search;
        pageData.bindData2Table('order_import_list',importTableHeader,searchObj,url);
    };

    $(function () {

        //加载订单信息
        pageData.getData();
        //加载出账信息
        pageData.getExport();
        //加载入账信息
        pageData.getImport();

        //添加按钮事件
        $(document.body).on('click','.addBtn',function () {
            var exportTable = $(this).closest(".widget-body").find("#order_export_list");
            var p = common.util.getHrefParam();
            var add_url = common.url.page_root + common.url.model.orderExport.page.add ;
            if(exportTable.length>0){

            }else {
                add_url = common.url.page_root + common.url.model.orderImport.page.add ;
            }
            window.open(add_url+ '?orderId='+p.id + '&type='+ pageData.order.type );
        });


        //搜索按钮事件（区分于出入账的搜索）
        $(document.body).on('click','.searchBtn',function () {

            var mainDom = $(this).closest(".layui-form");
            var searchInput = mainDom.find("input[name=searchKey]");
            var searchKey = searchInput.val();
            if(!searchKey){
                return false;
            }
            var searchObj = {searchKey:searchKey};

            var exportTable = mainDom.find("#order_export_list");
            if(exportTable.length>0){
                pageData.getExport(searchObj)
            }else {
                pageData.getImport(searchObj);
            }

        });

        $(".unlock-btn").click(function () {
            pageData.lockCard(pageData.card,2);//解锁卡
        });

    })

//保存到会话的信息
    //sessionStorage.order 订单信息
    // sessionStorage.orderCard 订单对应信用卡信息
    // sessionStorage.orderImport 订单入账记录表（可能为空）


});
