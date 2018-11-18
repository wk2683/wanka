//信用卡选择管理脚本


layui.use(['form','table','layer'],function () {


    var table = layui.table;
    var layer = layui.layer;
    var form = layui.form;
    var user = layui.sessionData('user');

    var pageData = {};

    var tableHeader = [[ //表头
        {field: 'id',       title: '序号',        align:'center',width:100,templet:'#indexTemplate'},

        {field: 'self',         title: '本人卡', align:'center',width:100,templet:'#selfTemplate'},
        // {field: 'customerId',   title: '所属客户', align:'center'},
        {field: 'customerName',   title: '所属客户',width:100, align:'center'},
        {field: 'cardName',     title: '卡名称',width:150, align:'center'},
        {field: 'name',         title: '姓名',width:150,     align:'center'},
        {field: 'idNumber',     title: '身份证号',width:200, align:'center'},
        {field: 'phone',        title: '手机号',width:150, align:'center'},
        {field: 'bankName',     title: '发卡银行',width:150, align:'center'},
        {field: 'cardNumber',   title: '卡号',width:200, align:'center'},
        {field: 'password',     title: '密码',width:150, align:'center'},
        {field: 'billDate',     title: '账单日',width:100, align:'center'},
        {field: 'replayDate',   title: '还款日',width:100, align:'center'},
        {field: 'validDate',   title: '有效期',width:100, align:'center'},
        {field: 'total',        title: '总额',width:100, align:'center'},
        {field: 'bill',         title: '账单金额',width:100, align:'center'},
        {field: 'replayRate',   title: '还款费率',width:100,     align:'center'},
        {field: 'miniFee',      title: '最低手续费',width:100, align:'center'},
        {field: 'cashRate',     title: '取现费率',width:100, align:'center'},

    ]];

    pageData.getTableData = function(searchKey,customerId) {
        var data = { userId: user.id, userName: user.name ,searchKey:searchKey};
        if(customerId){
            data.customerId = customerId;
        }
        //执行渲染
        table.render({
            elem: '#role_list' //指定原始表格元素选择器（推荐id选择器）
            , cols: tableHeader //表头
            , url: common.url.web_root + common.url.model.card.action + common.url.opt.search  //数据源url
            , where: data //如果无需传递额外参数，可不加该参数
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

            , parseData: function (res) { //res 即为原始返回的数据  为 layui 2.4.0 开始新增
                var data = JSON.parse(res.data);
                return {
                    "code": 0,// res.status, //解析接口状态
                    "msg": '',// res.message, //解析提示文本
                    "count": res.total?res.total:pageData.totalCount,// res.total, //解析数据长度
                    "data": data // res.data.item //解析数据列表
                };
            }
            , even: true  //隔行背景 true | false
            // , size: 'lg'  //小尺寸 sm | lg
        });


    };
    //渲染表格方法结束



    $(function () {

        var customerId = '';
        var p = common.util.getHrefParam();
        if(p.customerId){
            customerId = p.customerId;
        }
        //初始化第一页数据
        pageData.getTableData('',customerId);

        //搜索按钮事件
        $(document.body).on('click','#searchBtn',function () {

            var searchKey = $("input[name=searchKey]").val();
            if(!searchKey){
                return false;
            }
            pageData.getTableData(searchKey)
        });

    });
});
