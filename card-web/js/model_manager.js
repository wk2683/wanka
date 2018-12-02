//角色管理脚本


layui.use(['form','table','layer'],function () {


    var table = layui.table;
    var layer = layui.layer;
    var form = layui.form;
    var user = layui.sessionData('user');

    var pageData = {};

    //权限表头
    var tableHeader = [[ //表头
        //{field: 'id,       title: 'ID', align:'center',width:'8%'},
        {field: 'name',       title: '权限名称', align:'center',width:'18%'},
        {field: 'action',       title: '操作', align:'left'},
        {field: 'optType',       title: '操作类型', align:'center',width:'8%'},
        {field: 'seg',       title: '排序值', align:'center',width:'8%'},
        {field: 'remark',       title: '备注', align:'center'},
        {fixed: 'right',  align:'center',width:120, toolbar: '#toolbarRight'} //这里的toolbar值是模板元素的选择器
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
            , limit: 100 //每页显示数量
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

    //打开添加(权限)模态框表单
    pageData.openAddModel = function(modelId,modelName,obj){


        if(obj && obj.data && obj.data.id){//更新操作

            form.val('permission_form',{
                'id':obj.data.id,
                'modelName':modelName,
                'modelId':obj.data.modelId,
                'name':obj.data.name,
                'optType':obj.data.optType,
                'action':obj.data.action,
                'seg':obj.data.seg,
                'remark':obj.data.remark
            });
            form.render();
        }else{
            $('#add_form').find("input[name=modelName]").val(modelName);
            $('#add_form').find("input[name=modelId]").val(modelId);
        }
        layer.open({
            title: common.optName.CONTROLLER_OPT_ADD + common.url.model.permission.name,
            type:1,//页面类型
            content:$('#add_form'),
            area:['600px'],
            btn:['提交'],
            yes: function(index, layero){//当前层索引、当前层DOM对象
                //提交
                var modelName = $(layero).find("input[name=modelName]").val();
                var modelId = $(layero).find("input[name=modelId]").val();
                var name = $(layero).find("input[name=name]").val();
                var optType = $(layero).find("select[name=optType]").val();
                var action = $(layero).find("input[name=action]").val();
                var seg = $(layero).find("input[name=seg]").val();
                var remark = $(layero).find("textarea[name=remark]").val();

                name = $.trim(name);
                seg = $.trim(seg);
                remark = $.trim(remark);
                if(!name || !seg || !remark){
                    layer.alert('所有都有填写的，亲');
                    return false;
                }

                layer.close(index);
                console.log(name + "," + seg + "," + remark);
                var p = {
                    modelId:modelId,
                    modelName:modelName,
                    name:name,
                    optType:optType,
                    action:action,
                    seg:seg,
                    remark:remark
                };
                if(obj && obj.data && obj.data.id) {//更新操作
                    p.id = obj.data.id;
                    pageData.submitUpdate(p);
                }else{
                    pageData.submitAdd(p);
                }

            },
            cancel: function(){
                //右上角关闭回调

                //return false 开启该代码可禁止点击该按钮关闭
            }
        });
    };
    //添加提交(权限)数据
    pageData.submitAdd = function(permission){
        common.sendOption.data = permission;
        common.sendOption.url = common.url.web_root + common.url.model.permission.action + common.url.opt.add;
        common.sendOption.type = common.sendMethod.POST;
        common.sendOption.completeCallBack =pageData.addComplete;

        common.httpSend(common.sendOption);
    };
    //添加(权限)完成后动作
    pageData.addComplete = function(res){
            common.noDataResponse(res,common.optName.CONTROLLER_OPT_ADD);
    };

    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>更新操作的方法<<<<<<<<<<<<<<<<<<<<<<<<<<<


    //更新提交数据
    pageData.submitUpdate = function(data){
        common.sendOption.data = data;
        common.sendOption.url = common.url.web_root + common.url.model.permission.action + common.url.opt.update;
        common.sendOption.type = common.sendMethod.POST;
        common.sendOption.completeCallBack =pageData.updateComplete;

        common.httpSend(common.sendOption);
    };
    //更新完成后动作
    pageData.updateComplete = function(res){
        common.noDataResponse(res,common.optName.CONTROLLER_OPT_UPDATE);
    };

    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>删除操作的方法<<<<<<<<<<<<<<<<<<<<<<<<<<<

    //确认删除
    pageData.deleteConfirm = function(obj){
        layer.confirm('真的删除行么', function(index){

            layer.close(index);
            //向服务端发送删除指令
            console.log("删除 id  =  "+obj.data.id);
            pageData.deletePermission(obj);
            obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
        });
    };
    //提交删除
    pageData.deletePermission = function(obj){
        common.sendOption.data = { id:obj.data.id };
        common.sendOption.url = common.url.web_root + common.url.model.permission.action + common.url.opt.delete;
        common.sendOption.type = common.sendMethod.GET;
        common.sendOption.completeCallBack =pageData.deleteComplete;
        common.httpSend(common.sendOption);
    };
    //删除返回后处理
    pageData.deleteComplete = function(res){
        common.noDataResponse(res,common.optName.CONTROLLER_OPT_DELETE);
    };

    //------------------------------------------------------------------------------------------------


    //确认删除 模块
    pageData.deleteModelConfirm = function(id,name){
        layer.confirm('删除模块会将模块下的所在权限一起删除，确定删除模块：'+name+'吗？', function(index){
            layer.close(index);
            pageData.deleteModel(id);
        });
    };

    pageData.deleteModel = function(id){
        common.sendOption.data = { id:id };
        common.sendOption.url = common.url.web_root + common.url.model.model.action + common.url.opt.delete;
        common.sendOption.type = common.sendMethod.GET;
        common.sendOption.completeCallBack =pageData.deleteComplete;
        common.httpSend(common.sendOption);
    };

    $(function () {



        pageData.loadModelData();
        //添加权限按钮事件
        $(document.body).on('click','.add_permission_btn',function () {
            var id = $(this).data('id');
            var name = $(this).data('name');
            pageData.openAddModel(id,name);
        });

        //新增模块按钮事件
        $(document.body).on('click','.add_model_btn',function () {
            var add_url = common.url.page_root + common.url.model.model.page.add;
            window.open(add_url);
        });

        //修改模块按钮事件
        $(document.body).on('click','.update_model_btn',function () {
            var id = $(this).data('id');
            // var update_url = location.origin + '/page/model_update.html?id='+id;
            var update_url = common.url.page_root + common.url.model.model.page.update + '?id='+id;
            window.open(update_url);
        });

        //删除模块按钮事件
        $(document.body).on('click','.delete_model_btn',function () {
            var id = $(this).data('id');
            var name = $(this).data('name');
            pageData.deleteModelConfirm(id,name);

        });

    });
});
