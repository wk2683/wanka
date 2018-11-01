//员工列表-专用 于选择


layui.use(['form','table','layer'],function () {


    var table = layui.table;
    var layer = layui.layer;
    var form = layui.form;
    var user = layui.sessionData('user');

    var pageData = {};

    var tableHeader = [[ //表头
        {field: 'id',       title: 'ID', align:'center',width:'8%',templet:'#indexTemplate'},
        {field: 'orgId',       title: '组织ID', align:'center'},
        {field: 'roleId',       title: '角色ID', align:'center'},
        {field: 'name',       title: '姓名', align:'center'},
        {field: 'idNumber',       title: '身份证号', align:'center'},
        {field: 'phone',       title: '手机', align:'center'},
        {field: 'weixin',       title: '微信号', align:'center'},
        // {field: 'fontImg',       title: '身份证正面', align:'center',width:'8%'},
        // {field: 'afterImg',       title: '身份证背面', align:'center',width:'8%'},
        // {field: 'homeImg',       title: '全身照', align:'center',width:'8%'}
        // ,{fixed: 'right',  align:'center', toolbar: '#toolbarRight'} //这里的toolbar值是模板元素的选择器
    ]];

    pageData.getTableData = function(orgId,searchKey) {
        //执行渲染
        table.render({
            elem: '#role_list' //指定原始表格元素选择器（推荐id选择器）
            , cols: tableHeader //表头
            , url: common.url.web_root + common.url.model.worker.acttion + common.url.opt.search  //数据源url
            , where: { userId: user.id, userName: user.name,orgId:orgId,searchKey:searchKey } //如果无需传递额外参数，可不加该参数
            , method: common.sendMethod.POST // get | post 如果无需自定义HTTP类型，可不加该参数
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
            , text: {none: '<button class="layui-btn  layui-btn-fluid" lay-event="add">添加第一个角色</button>'} //空数据时提示信息
            // ,initSort:'' //默认排序字段
            // ,id:'table tag id' //设置table 标签的id值  （因为正常也没有id而可以通过class渲染表格）
            , skin: 'row' //行边框风格 line | row | nob
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
            // , size: 'sm'  //小尺寸 sm | lg
        });



    };
    //渲染表格方法结束

    //初始化组织树
    pageData.initOrgTree = function() {
        var orgTree = sessionStorage.getItem(common.session.key.orgTree);
        var data = JSON.parse(orgTree);
        if(!data) {
            return false;
        }
        layui.tree({
            elem: '#org_tree' //传入元素选择器
            , nodes: data
            ,click: function (node) {//节点数据
                event.stopPropagation();
                event.preventDefault();
                $("input[name=orgId]").val(node.id);
                $("input[name=orgName]").val(node.name);
                layer.closeAll();
            }
        });
    };
    //打开选择组织弹出框
    pageData.openOrgSelectModel = function(){
        layer.open({
            title:'选择组织',
            type:1,
            content:$('#org_tree'),
            area:['500px'],
            btn:['确定'],
            yes:function () {
                console.log("点击确定");
                layer.closeAll();
            }
        });
    };






    $(function () {

        //初始化第一页数据
        pageData.getTableData('','');//参数 orgId,searchKey.初始化加载时都为空
        //搜索按钮事件
        $(document.body).on('click','#searchBtn',function () {
            var orgId = $("input[name=orgId]").val();
            var searchKey = $("input[name=searchKey]").val();
            if((!orgId) && (!searchKey)){
                return false;
            }
            pageData.getTableData(orgId,searchKey)
        });

        //选择组织
        $(document.body).on('click','input[name=orgName]',function () {
            pageData.openOrgSelectModel();
        });

        pageData.initOrgTree();
    });
});