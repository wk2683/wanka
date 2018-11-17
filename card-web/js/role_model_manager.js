//角色分配权限管理脚本


layui.use(['form','table','layer'],function () {


    var table = layui.table;
    var layer = layui.layer;
    var form = layui.form;
    var user = layui.sessionData('user');

    var pageData = {};

    //权限表头
    var tableHeader = [[ //表头
        {field: 'id',       title: '选择', align:'center',width:'8%',templet:'#indexTemplate'},
        {field: 'name',       title: '权限名称', align:'center',width:'18%'},
        {field: 'action',       title: '操作', align:'left'},
        {field: 'optType',       title: '操作类型', align:'center',width:'8%'},
        {field: 'seg',       title: '排序值', align:'center',width:'8%'},
        {field: 'remark',       title: '备注', align:'center'},
        // ,{fixed: 'right',  align:'center',width:120, toolbar: '#toolbarRight'} //这里的toolbar值是模板元素的选择器
    ]];

    //加载模块（包括 权限）数据，
    pageData.loadModelData = function(){
        common.sendOption.data = {page:1,pageSize:1000,limit: 1000,userId:user.id };//加载所有模块
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
            var checkedAttr = '';
            if(pageData.permissionIds2role.indexOf(model.id)>=0){
                checkedAttr = 'checked';
            }
            var modelSelect = '<input type="checkbox" id="'+model.id+'" class="select_model" style="opacity:1;position:static;margin-top: 7px; margin-right: 10px;float: left;" '+checkedAttr+' />'
            modelPanels += '<div class="row">\n' +
                '    <div class="col-xs-12 col-md-12">\n' +
                '        <div class="widget">\n' +
                '            <div class="widget-header ">\n' +
                '                <span class="widget-caption">' + modelSelect + '模块名称：<span class="model_name">'+model.name+'</span>'+
                '               </span>\n' +
                '                <div class="widget-buttons">\n' +
                '                    <a href="#" data-toggle="maximize"><i class="fa fa-expand"></i></a>\n' +
                '                    <a href="#" data-toggle="collapse"><i class="fa fa-minus"></i></a>\n' +
                '                    <a href="#" data-toggle="dispose"><i class="fa fa-times"></i></a>\n' +
                '                </div>\n' +
                '            </div>\n' +
                '            <div class="widget-body">' +
                // '<form class="layui-form">\n' +
                '                <table id="permission_'+model.id+'" lay-filter="permission_'+model.id+'Event"></table>' +
                // '</form>\n' +
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
            if(permissions && permissions.length>0){
                var plen = permissions.length;
                for(var k=0; k<plen;k++){
                    var perm = permissions[k];
                    if(pageData.permissionIds2role.indexOf(perm.id)>=0){
                        permissions[k].checked = true;
                    }
                }
            }

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
            ,data:pdata //  把已经数据给表格，不用表格自己请求后台取数据
            , limit: 100 //每页显示数量
            , skin: 'row' //行边框风格 line | row | nob
            , even: true  //隔行背景 true | false
        });
    };




    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>添加操作的方法<<<<<<<<<<<<<<<<<<<<<<<<<<<
    //加载角色下的模块和权限的ID集合
    pageData.loadModelAndPermissionOfRole = function(){
        var p = common.util.getHrefParam();
        var roleId = p.roleId;
        pageData.roleId = roleId;//保存全局
        common.sendOption.data = {page:1,limit: 1000,userId:user.id ,roleId:roleId};//加载角色下的所有模块和权限ID
        common.sendOption.url = common.url.web_root + common.url.model.role.action + common.url.opt.model.role.getModelPermission;
        common.sendOption.type = common.sendMethod.GET;
        common.sendOption.completeCallBack =pageData.loadModelIdAndPermissionIdComplete;
        common.httpSend(common.sendOption);
    };

    pageData.loadModelIdAndPermissionIdComplete = function(res){
        var resData = JSON.parse(res.responseText);
        if(resData.code == common.code.RESPONSE_CODE_SUCCESS) {
            var permissionIds2role = resData.data;//角色下的模块与权限数组字符串
            pageData.permissionIds2role = permissionIds2role;

        }else{
            pageData.permissionIds2role = '[]';
            // layer.alert('读取角色信息失败',{anim:6},function () {
            //     if(window.close){
            //         window.close();
            //     }
            //     history.back();
            // })
        }
        pageData.loadModelData();
    };
    //选择与取消选择权限点击处理
    pageData.checkPermission = function(tag){
        // var tag = $(this);
        var className = $(tag).attr("class");
        var checked = false;
        if(className.indexOf("layui-form-checked")>0){
            checked = true;
        }
        var inputDom = $(tag).prev();
        var id = $(inputDom).attr('id');

        //console.log("id="+id);
        //console.log("checked="+checked);

        if(checked){
            pageData.selectPermission(pageData.roleId,id);//选中
        }else{
            pageData.unselectPermission(pageData.roleId,id);//取消选中
        }
        // common.util.loadPermissions();//重新加载登录人员的权限 （没必要，会自己设死自己 ）
    };
    //提交选择权限
    pageData.selectPermission = function(roleId,permissionId){
        common.sendOption.data = {roleId:roleId,permissionId:permissionId};
        common.sendOption.url = common.url.web_root + common.url.model.role.action + common.url.opt.model.role.selectPermission;
        common.sendOption.type = common.sendMethod.GET;
        common.sendOption.completeCallBack =pageData.selectComplete;
        common.httpSend(common.sendOption);
    };
    //提交取消选择权限
    pageData.unselectPermission = function(roleId,permissionId){
        common.sendOption.data = {roleId:roleId,permissionId:permissionId};
        common.sendOption.url = common.url.web_root + common.url.model.role.action + common.url.opt.model.role.unselectPermission;
        common.sendOption.type = common.sendMethod.GET;
        common.sendOption.completeCallBack =pageData.selectComplete;
        common.httpSend(common.sendOption);
    };

    //选择与取消选择模块点击处理
    pageData.checkModel = function(tag){

        var checked = tag.checked;


        var id = $(tag).attr('id');

        //console.log("id="+id);
        //console.log("checked="+checked);

        if(checked){
            pageData.selectModel(pageData.roleId,id);//选中
        }else{
            pageData.unselectModel(pageData.roleId,id);//取消选中
        }
    };
    //提交选择模块
    pageData.selectModel = function(roleId,modelId){
        common.sendOption.data = {roleId:roleId,modelId:modelId};
        common.sendOption.url = common.url.web_root + common.url.model.role.action + common.url.opt.model.role.selectModel;
        common.sendOption.type = common.sendMethod.GET;
        common.sendOption.completeCallBack =pageData.selectComplete;
        common.httpSend(common.sendOption);
    };
    //提交取消选择模块
    pageData.unselectModel = function(roleId,modelId){
        common.sendOption.data = {roleId:roleId,modelId:modelId};
        common.sendOption.url = common.url.web_root + common.url.model.role.action + common.url.opt.model.role.unselectModel;
        common.sendOption.type = common.sendMethod.GET;
        common.sendOption.completeCallBack =pageData.selectComplete;
        common.httpSend(common.sendOption);
    };


    //选择与取消选择完成处理
    pageData.selectComplete = function(res){
      console.log("选择或取消选择模块权限返回："+res.responseText);
    };


    $(function () {
        //加载角色下的模块和权限ID [模块ID和权限ID混合为一个数组返回]
        pageData.loadModelAndPermissionOfRole();

        // pageData.loadModelData();//回调执行

        //点选权限事件  layui-form-checkbox layui-form-checked
        $(document.body).on('click','.layui-form-checkbox',function (event) {
            pageData.checkPermission(this);
        });

        //点选权限事件  layui-form-checkbox layui-form-checked
        $(document.body).on('click','.select_model',function (event) {
            pageData.checkModel(this);
        });

    });
});
