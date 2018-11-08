//角色管理脚本


layui.use(['form','table','layer'],function () {


    var table = layui.table;
    var layer = layui.layer;
    var form = layui.form;
    var user = layui.sessionData('user');

    var pageData = {};


    var tableHeader = [[ //表头
        {field: 'id',           title: '序号', align:'center',templet:'#indexTemplate'},
        {field: 'self',         title: '本人卡', align:'center',templet:'#selfTemplate'},
        {field: 'customerId',   title: '所属客户', align:'center'},
        {field: 'cardName',     title: '密码', align:'center'},
        {field: 'name',         title: '姓名',     align:'center'},
        {field: 'idNumber',     title: '身份证号', align:'center'},
        {field: 'phone',        title: '手机号', align:'center'},
        {field: 'bankName',     title: '发卡银行', align:'center'},
        {field: 'cardNumber',   title: '卡号', align:'center'},
        {field: 'password',     title: '密码', align:'center'},
        {field: 'billDate',     title: '账单日', align:'center'},
        {field: 'replayDate',   title: '还款日', align:'center'},
        {field: 'validDate',   title: '有效期', align:'center'},
        {field: 'total',        title: '总额', align:'center'},
        {field: 'bill',         title: '账单金额', align:'center'},
        {field: 'replayRate',   title: '还款费率',     align:'center'},
        {field: 'miniFee',      title: '最低手续费', align:'center'},
        {field: 'cashRate',     title: '取现费率', align:'center'},
        {field: 'income',       title: '公司持卡', align:'center',templet:'#incomeTemplate'},
        // {field: 'remark',       title: '备注',     align:'center'},

        {fixed: 'right',  align:'center',width:150, toolbar: '#toolbarRight'} //这里的toolbar值是模板元素的选择器
    ]];

    pageData.getTableData = function(searchKey) {
        //执行渲染
        table.render({
            elem: '#card_list' //指定原始表格元素选择器（推荐id选择器）
            , cols: tableHeader //表头
            , url: common.url.web_root + common.url.model.card.action + common.url.opt.search  //数据源url
            , where: { userId: user.id, userName: user.name, searchKey:searchKey} //如果无需传递额外参数，可不加该参数
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
                console.log(res);

                //得到当前页码
                console.log(curr);

                //得到数据总量
                console.log(count);

                //生成分页条(无特别处理，则不用额外写分页条代码)
                if(curr==1 ) {
                    pageData.totalCount = count;
                }
            }
            //data:[{}{}{}],  把已经数据给表格，不用表格自己请求后台取数据
            , page: true // boolean | object  -----单独生成分页并接收点击分页事件 laypage 组件
            , limit: 10 //每页显示数量
            , limits: [10,  30, 50,100,200] //可选择设定每页数量
            , loading: true //true | false 是否显示加载条
            , title: '角色表' //定义table大标题（比如导出时则为文件名）
            , text: {none: '无数据'} //空数据时提示信息
            // ,initSort:'' //默认排序字段
            // ,id:'table tag id' //设置table 标签的id值  （因为正常也没有id而可以通过class渲染表格）
            , skin: 'row' //行边框风格 line | row | nob


            //request: {} //如果无需自定义请求参数，可不加该参数
            ,request: {
                pageName: 'page' //页码的参数名称，默认：page
                ,limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }

            // ,response: {//如果无需自定义数据响应名称，可不加该参数
            //     statusName: 'status' //规定数据状态的字段名称，默认：code
            //     ,statusCode: 200 //规定成功的状态码，默认：0
            //     ,msgName: 'hint' //规定状态信息的字段名称，默认：msg
            //     ,countName: 'total' //规定数据总数的字段名称，默认：count
            //     ,dataName: 'rows' //规定数据列表的字段名称，默认：data
            // }
            , parseData: function (res) { //res 即为原始返回的数据  为 layui 2.4.0 开始新增
                var data = JSON.parse(res.data);
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
        //《《《《《《《《《《《《《《表格初始化完成

        //监听工具条
        table.on('tool(cardTableEvent)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象
            console.log("点击事件......"+layEvent);
            if(layEvent === 'add'){
                //添加
               console.log("add event ");
            }else if(layEvent === 'detail'){ //查看
                //详情
                var detail_url = common.url.page_root + common.url.model.card.page.detail + '?id='+data.id;
                window.open(detail_url);
            } else if(layEvent === 'delete'){ //删除
                pageData.deleteConfirm(obj);
            } else if(layEvent === 'update'){ //编辑
                //修改
                var update_url = common.url.page_root + common.url.model.card.page.update + '?id='+data.id;
                window.open(update_url);
            }
        });
        //监听 增 删 改

    };
    //渲染表格方法结束


    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>删除操作的方法<<<<<<<<<<<<<<<<<<<<<<<<<<<

    //确认删除
    pageData.deleteConfirm = function(obj){
        layer.confirm('真的删除行么', function(index){

            layer.close(index);
            //向服务端发送删除指令
            console.log("删除 id  =  "+obj.data.id);
            pageData.deleteRole(obj);
            obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
        });
    };
    //提交删除
    pageData.deleteRole = function(obj){
        common.sendOption.data = { id:obj.data.id };
        common.sendOption.url = common.url.web_root + common.url.model.card.action + common.url.opt.delete;
        common.sendOption.type = common.sendMethod.GET;
        common.sendOption.completeCallBack =pageData.deleteComplete;
        common.httpSend(common.sendOption);
    };
    //删除返回后处理
    pageData.deleteComplete = function(res){
        common.noDataResponse(res,common.optName.CONTROLLER_OPT_DELETE);
    };

    $(function () {


        //初始化第一页数据
        pageData.getTableData('');
        //添加按钮事件
        $(document.body).on('click','#add_card_btn',function () {
            var add_url = common.url.page_root + common.url.model.card.page.add;
            window.open(add_url);
        });

        //添加按钮事件
        $(document.body).on('click','#searchBtn',function () {
            var searchKey = $("input[name=searchKey]").val();
            if(!searchKey){
                return false;
            }
            pageData.getTableData(searchKey);
        });
    });
});