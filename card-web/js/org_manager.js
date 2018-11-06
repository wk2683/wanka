//组织管理js

layui.use(['tree','form','table','layer'],function () {

    var table = layui.table;
    var layer = layui.layer;
    var form = layui.form;
    var user = layui.sessionData('user');

    var pageData = {};


    //节点操作
    var toolbtn = '<span><button class="layui-btn layui-btn-xs" name="add">添加下级</button><button class="layui-btn layui-btn-xs layui-btn-danger" name="delete">删除</button><button class="layui-btn layui-btn-xs" name="update">编辑</button></span>';

    //初始化组织树
    pageData.initOrgTree = function(data) {
        if(!data) {
            return false;
        }

        layui.tree({
            elem: '#org_tree' //传入元素选择器
            , nodes: data
            ,click: function (node) {//节点数据
                event.stopPropagation();
                event.preventDefault();
                var tag = event.target;
                var optName = tag.name;//dom 上的name属性的值
                console.log(tag.name);

                var name = node.name.split("<span")[0];

                var info = 'id='+node.id + ', parentId='+node.parentId +', parents = '+ node.parents + ', name='+name;
                console.log(info);

                var org = {
                    id:node.id,
                    parentId:node.parentId,
                    parents:node.parents,
                    name:name,
                    seg:node.seg,
                    remark:node.remark
                };

                if (optName == 'add') {
                    console.log("添加子组织");
                    pageData.openAddModel(org);
                } else if (optName == 'delete') {
                    console.log("删除组织");
                    pageData.deleteConfirm(org);
                } else if (optName == 'update') {
                    console.log("修改组织");
                    pageData.openUpdateModel(org);

                }
            }
        });
    };
    //<<<<<<<<<<<<<<<<<<<<<<<<<<<组织树初始化完成<<<<<<<<<<<<<<<<<<<<<
    //打开添加模态框表单
    pageData.openAddModel = function(org){

        $('#add_form').find("input[name=parentId]").val(org?org.id:0);
        $('#add_form').find("input[name=parents]").val(org?(org.parents+','+org.id):0);
        $('#add_form').find("input[name=pname]").val(org?org.name:'无上级组织');
        // $('#add_form').find("input[name=seg]").val(org.seg);
        // $('#add_form').find("textarea[name=remark]").val(org.remark);


        layer.open({
            title: common.optName.CONTROLLER_OPT_ADD + common.url.model.org.name,
            type:1,//页面类型
            content:$('#add_form'),
            area:['600px'],
            btn:['提交'],
            yes: function(index, layero){//当前层索引、当前层DOM对象
                //提交
                var parentId = $(layero).find("input[name=parentId]").val();
                var parents = $(layero).find("input[name=parents]").val();


                var name = $(layero).find("input[name=name]").val();
                var seg = $(layero).find("input[name=seg]").val();
                var remark = $(layero).find("textarea[name=remark]").val();

                name = $.trim(name);
                seg = $.trim(seg);
                remark = $.trim(remark);
                if(!name || !seg || !remark){
                    layer.alert('所有都有填写的，亲');
                    return false;
                }

                layer.closeAll();
                console.log(name + "," + seg + "," + remark);
                pageData.submitAdd(parentId,parents,name,seg,remark);

            },
            cancel: function(){
                //右上角关闭回调

                //return false 开启该代码可禁止点击该按钮关闭
            }
        });
    };
    //添加提交数据
    pageData.submitAdd = function(parentId,parents,name,seg,remark){
        common.sendOption.data = {
            parentId:parentId,
            parents:parents,
            name:name,
            seg:seg,
            remark:remark,
        };
        common.sendOption.url = common.url.web_root + common.url.model.org.action + common.url.opt.add;
        common.sendOption.type = common.sendMethod.POST;
        common.sendOption.completeCallBack =pageData.addComplete;

        common.httpSend(common.sendOption);
    };
    //添加完成后动作
    pageData.addComplete = function(res){
        common.noDataResponse(res,common.optName.CONTROLLER_OPT_ADD);
    };

    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>更新操作的方法<<<<<<<<<<<<<<<<<<<<<<<<<<<

    //打开更新模态框表单 modelObj:当前数据行对象，数据为modelObj.data 为一行的数据
    pageData.openUpdateModel = function(org){
        $('#add_form').find("input[name=parentId]").val(org.parentId);
        $('#add_form').find("input[name=parents]").val(org.parents);
        $('#add_form').find("input[name=pname]").closest('div.layui-form-item').hide();

        $('#add_form').find("input[name=name]").val(org.name);
        $('#add_form').find("input[name=seg]").val(org.seg);
        $('#add_form').find("textarea[name=remark]").val(org.remark);

        layer.open({
            title:common.optName.CONTROLLER_OPT_UPDATE + common.url.model.org.name,
            type:1,//页面类型
            content:$('#add_form'),
            area:['600px'],
            btn:['提交'],
            yes: function(index, layero){//当前层索引、当前层DOM对象
                //提交
                var parentId = $(layero).find("input[name=parentId]").val();
                var parents = $(layero).find("input[name=parents]").val();

                var name = $(layero).find("input[name=name]").val();
                var seg = $(layero).find("input[name=seg]").val();
                var remark = $(layero).find("textarea[name=remark]").val();

                name = $.trim(name);
                seg = $.trim(seg);
                remark = $.trim(remark);
                if(!name || !seg || !remark){
                    layer.alert('所有都有填写的，亲');
                    return false;
                }

                layer.closeAll();
                console.log(name + "," + seg + "," + remark);
                pageData.submitUpdate(org.id,parentId,parents,name,seg,remark);

            },
            cancel: function(){
                //右上角关闭回调

                //return false 开启该代码可禁止点击该按钮关闭
            }
        });
    };
    //更新提交数据
    pageData.submitUpdate = function(id,parentId,parents,name,seg,remark){
        common.sendOption.data = {
            id:id,
            parentId:parentId,
            parents:parents,
            name:name,
            seg:seg,
            remark:remark,
        };
        common.sendOption.url = common.url.web_root + common.url.model.org.action + common.url.opt.update;
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
    pageData.deleteConfirm = function(org){
        layer.confirm('真的删除行么', function(index){

            layer.close(index);
            //向服务端发送删除指令
            console.log("删除 id  =  "+org.id);
            pageData.submitDelete(org);
            obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
        });
    };
    //提交删除
    pageData.submitDelete = function(org){
        common.sendOption.data = { id:org.id };
        common.sendOption.url = common.url.web_root + common.url.model.org.action + common.url.opt.delete;
        common.sendOption.type = common.sendMethod.GET;
        common.sendOption.completeCallBack =pageData.deleteComplete;
        common.httpSend(common.sendOption);
    };
    //删除返回后处理
    pageData.deleteComplete = function(res){
        common.noDataResponse(res,common.optName.CONTROLLER_OPT_DELETE);
    };
    //加载数据
    pageData.getData = function(){
        common.sendOption.data = { page:1,pageSize:10000 };//加载所有组织
        common.sendOption.url = common.url.web_root + common.url.model.org.action + common.url.opt.search;
        common.sendOption.type = common.sendMethod.POST;
        common.sendOption.completeCallBack =pageData.searchComplete;
        common.httpSend(common.sendOption);
    };

    pageData.searchComplete = function(res){//
        var resData = JSON.parse(res.responseText);
        if(resData.code == common.code.RESPONSE_CODE_SUCCESS && resData.total > 0 ){
            var data = JSON.parse(resData.data);
            var orginTree = common.util.covert2TreeJSON(data,0);
            //暂时在这里保存，事实上应该在登录时保存这些数据
            // sessionStorage.setItem(common.session.key.orgData,resData.data);
            // sessionStorage.setItem(common.session.key.orgTree,JSON.stringify(orginTree));

            var len = data.length;
            for(var i=0;i<len;i++){
                data[i].name += toolbtn;
            }
            var treeJson = common.util.covert2TreeJSON(data,0);

            pageData.initOrgTree(treeJson);
        }else{
            var data = [{name:'还没有组织数据'}];
            pageData.initOrgTree(data);
        }
    };

    pageData.getData();

    $("#add_org_btn").click(function () {
        var org = 0;
        pageData.openAddModel(org);
    })
});