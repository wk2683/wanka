//角色分配权限管理脚本


layui.use(['form','table','layer'],function () {


    var table = layui.table;
    var layer = layui.layer;
    var form = layui.form;
    var user = layui.sessionData('user');

    var pageData = {};

    //权限表头
    var tableHeader = [[ //表头
        {field: 'id',       title: 'ID', align:'center',width:'8%'},
        {field: 'name',       title: '权限名称', align:'center',width:'18%'},
        {field: 'action',       title: '操作', align:'center'},
        {field: 'optType',       title: '操作类型', align:'center',width:'8%'},
        {field: 'seg',       title: '排序值', align:'center',width:'8%'},
        {field: 'remark',       title: '备注', align:'center'},
        ,{fixed: 'right',  align:'center',width:120, toolbar: '#toolbarRight'} //这里的toolbar值是模板元素的选择器
    ]];

    //加载模块（包括 权限）数据，
    pageData.loadModelData = function(){
        common.sendOption.data = {page:1,limit: 1000,userId:user.id };//加载所有模块
        common.sendOption.url = common.url.web_root + common.url.model.model.action + common.url.opt.search;
        common.sendOption.type = common.sendMethod.POST;
        common.sendOption.completeCallBack =pageData.loadComplete;
        common.httpSend(common.sendOption);
    };
    //加载完成处理
    pageData.loadComplete = function(res){
        sessionStorage.modelData = res.responseText;//保存到会话

        var resData = JSON.parse(res.responseText);
        sessionStorage.modelData = resData.data;//保存到会话
        var modelData = JSON.parse(resData.data);

        pageData.initModelTableList(modelData);
    };

    pageData.initModelTableList = function(modelData){
        if(!modelData) return false;
        var modelPanels = '';
        var len = modelData.length;
        for(var i=0;i<len;i++){
            var model = modelData[i];
            modelPanels += '<div class="row">\n' +
                '    <div class="col-xs-12 col-md-12">\n' +
                '        <div class="widget">\n' +
                '            <div class="widget-header ">\n' +
                '                <span class="widget-caption">模块名称：<span class="model_name">'+model.name+'</span>'+
                '                   <button  class="layui-btn layui-btn-xs add_permission_btn" data-id="'+model.id+'" data-name="'+model.name+'">添加权限</button>\n' +
                '                   <button  class="layui-btn layui-btn-normal layui-btn-xs update_model_btn" data-id="'+model.id+'">修改模块</button>\n' +
                '                   <button  class="layui-btn layui-btn-danger layui-btn-xs delete_model_btn" data-id="'+model.id+'" data-name="'+model.name+'">删除模块</button>' +
                '               </span>\n' +
                '                <div class="widget-buttons">\n' +
                '                    <a href="#" data-toggle="maximize"><i class="fa fa-expand"></i></a>\n' +
                '                    <a href="#" data-toggle="collapse"><i class="fa fa-minus"></i></a>\n' +
                '                    <a href="#" data-toggle="dispose"><i class="fa fa-times"></i></a>\n' +
                '                </div>\n' +
                '            </div>\n' +
                '            <div class="widget-body">\n' +
                '                <table id="permission_'+model.id+'" lay-filter="permission_'+model.id+'Event"></table>\n' +
                '            </div>\n' +
                '        </div>\n' +
                '    </div>\n' +
                '</div>';
        }
        $("div.page-body").html(modelPanels);

        for(var i=0;i<len;i++) {
            var model = modelData[i];
            var permissions = model.permissionList;
            var tableId = 'permission_'+model.id;
            pageData.showPermissionData(permissions,tableId);
        }

    };

    pageData.showPermissionData = function(pdata,tableId){
        if(!pdata){
            pdata = [];
        }
        //执行渲染
        table.render({
            elem: '#'+tableId //指定原始表格元素选择器（推荐id选择器）
            ,cols:tableHeader
            // toolbar: '#toolbarDemo' //指向自定义工具栏模板选择器
            // toolbar: '<div>xxx</div>' //直接传入工具栏模板字符
            // toolbar: true //仅开启工具栏，不显示左侧模板
            // toolbar: 'default' //让工具栏左侧显示默认的内置模板
            , toolbar: '#toolbarBase'// 'default'  //开启表格头部工具栏区域，该参数支持四种类型值：
            , defaultToolbar:['filter', 'print', 'exports']// 选择显示字段，打印，导出
            ,data:pdata //  把已经数据给表格，不用表格自己请求后台取数据
            , skin: 'row' //行边框风格 line | row | nob
            , even: true  //隔行背景 true | false
            // , size: 'sm'  //小尺寸 sm | lg
        });


        table.on('tool('+tableId+'Event)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            pageData.listenerRowClick(obj);
        });

    };

    pageData.listenerRowClick = function(obj){
        var data = obj.data; //获得当前行数据
        var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
        // var tr = obj.tr; //获得当前行 tr 的DOM对象
        console.log("点击事件......"+layEvent);
        if(layEvent === 'delete'){ //删除
            pageData.deleteConfirm(obj);
        } else if(layEvent === 'update'){ //编辑
            var modelId = obj.data.modelId;
            var modelName = $(obj.tr).closest("div.widget").find(".model_name").text();
            pageData.openAddModel(modelId,modelName,obj);

        }
    };

    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>添加操作的方法<<<<<<<<<<<<<<<<<<<<<<<<<<<
    //加载角色下的模块和权限的ID集合
    pageData.loadModelAndPermissionOfRole = function(){
        common.sendOption.data = {page:1,limit: 1000,userId:user.id };//加载所有模块
        common.sendOption.url = common.url.web_root + common.url.model.role.action + common.url.opt.search;
        common.sendOption.type = common.sendMethod.GET;
        common.sendOption.completeCallBack =pageData.loadModelIdAndPermissionIdComplete;
        common.httpSend(common.sendOption);
    };

    pageData.loadModelIdAndPermissionIdComplete = function(res){
        var resData = JSON.parse(res.responseText);
        if(resData.code == common.code.RESPONSE_CODE_SUCCESS) {
            var id2role = resData.data;//角色下的模块与权限数组字符串
            pageData.id2role = id2role;
            pageData.loadModelData();
        }else{

        }
    };


    $(function () {
        //加载角色下的模块和权限ID [模块ID和权限ID混合为一个数组返回]
        pageData.loadModelAndPermissionOfRole();

        // pageData.loadModelData();//回调执行

        //删除模块按钮事件
        $(document.body).on('click','.delete_model_btn',function () {
            var id = $(this).data('id');
            var name = $(this).data('name');
            pageData.deleteModelConfirm(id,name);

        });

    });
});