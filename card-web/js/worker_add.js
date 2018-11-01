//新增员工


layui.use(['form','layer','upload'],function () {


    var upload = layui.upload;
    var layer = layui.layer;
    var form = layui.form;
    var user = layui.sessionData('user');


    var pageData = {};

    pageData.worker = {};

    pageData.worker.id = '';//初始化

    var uploadUrl = common.url.web_root + common.url.model.worker.action + common.url.opt.model.worker.uploadImg;

    //初始化上传组件
    //n-1身份证正面图片上传
    //n-2身份证背面图片上传
    //n-3身份证全身图片上传
    pageData.initUploadImg = function (n) {
        var elemId = '#fontImgBtn';
        var imgTag= '#fontImgTag';
        var imgText = '#fontImgText';
        if(n==2){
            elemId = '#afterImgBtn';
            imgTag= '#afterImgTag';
            imgText = '#afterImgText';
        }else if(n==3){
            elemId = '#homeImgBtn';
            imgTag= '#homeImgTag';
            imgText = '#homeImgText';
        }

        var uploadfontImg = upload.render({
            elem: elemId
            ,url: uploadUrl
            ,exts:'png|jpg|jpeg'
            ,data:{}
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $(imgTag).attr('src', result); //图片链接（base64）
                });

                if(pageData.worker.id){
                    this.data.id = pageData.worker.id;
                }
                this.data.userId = user.id;

            }
            ,done: function(res){//res 服务商品响应的数据
                console.log("done="+res);
                //如果上传失败
                if(res.code != common.code.RESPONSE_CODE_SUCCESS){
                    return layer.msg('上传失败');
                }
                //上传成功
                var path = res.data;
                if(n==1){
                    pageData.worker.fontImg = path;
                    $("#fontImg").val(path);
                }else if(n==2){
                    pageData.worker.afterImg = path;
                    $("#afterImg").val(path);
                }else if(n==3){
                    pageData.worker.homeImg = path;
                    $("#homeImg").val(path);
                }
                //ID为空则保存起来
                if(!pageData.worker.id){
                    var id = path.split("/")[0];
                    pageData.worker.id = id;
                    $("#id").val(id);
                }
            }
            ,error: function(){
                //演示失败状态，并实现重传
                var demoText = $(imgText);
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadfontImg.upload();
                });
            }
        });
    };
    //初始化角色选择
    pageData.initRoleSelect = function(){

        var roleData = sessionStorage.getItem(common.session.key.roleData);
        var roles = JSON.parse(roleData);
        var roleOption = '';
        var len = roles.length;
        for(var i=0 ; i< len ; i++){
            var role = roles[i];
            roleOption += '<option value="'+role.id+'">'+role.name+'</option>';
        }
        $("#roleId").html(roleOption);
        form.render('select');
    };
    //初始化组织选择
    pageData.initOrgSelect = function(){
        //绑定点击事件
        $("#orgName").click(function (event) {
            pageData.openOrgSelectModel();
        });
    };
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
                $("#orgId").val(node.id);
                $("#orgName").val(node.name);
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
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>初始化表单 开始>>>>>>>>>>>>>>>>>>>>>>>>>>>>>



    pageData.submitAdd = function(param){
        common.sendOption.data = param;
        common.sendOption.url = common.url.web_root + common.url.model.worker.action + common.url.opt.add;
        common.sendOption.type = common.sendMethod.POST;
        common.sendOption.completeCallBack =pageData.addComplete;

        common.httpSend(common.sendOption);
    }

    pageData.addComplete = function(res){
        common.noDataResponse(res,common.optName.CONTROLLER_OPT_ADD,'page/worker_manager.html');
    };

    //初始化角色选择
    pageData.initRoleSelect();
    //初始化组织树DOM
    pageData.initOrgTree();//生成树
    //初始化组织选择监听
    pageData.initOrgSelect();
    //初始化上传图片控件（3个）
    pageData.initUploadImg(1);
    pageData.initUploadImg(2);
    pageData.initUploadImg(3);

    //监听提交按钮 submit(btn_id)
    form.on('submit(formAdd)', function(data){
       pageData.submitAdd(data.field);
        return false;
    });
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<初始化表单 结束<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


});