//修改员工


layui.use(['form','layer','upload'],function () {


    var upload = layui.upload;
    var layer = layui.layer;
    var form = layui.form;
    var user = layui.sessionData('user');


    var pageData = {};

    pageData.worker = {};

    pageData.worker.id = '';//初始化



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


//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>初始化表单 开始>>>>>>>>>>>>>>>>>>>>>>>>>>>>>






    pageData.initWorkerInfo = function () {
        var p = common.util.getHrefParam();
        common.sendOption.data = {id:p.id};
        common.sendOption.url = common.url.web_root + common.url.model.worker.action + common.url.opt.get;
        common.sendOption.type = common.sendMethod.GET;
        common.sendOption.completeCallBack =pageData.getComplete;

        common.httpSend(common.sendOption);
    };
    pageData.getComplete = function (res) {
        var data  = JSON.parse(res.responseText);
        var item  = JSON.parse(data.data);



        //初始化组织
        var orgName = common.util.findOrgNameFromSession(item.orgId);

        form.val("worker_form", {
            "id": item.id
            ,"name": item.name
            ,"userName": item.userName
            ,"password": ""
            ,"orgId": item.orgId
            ,"orgName": orgName
            ,"roleId": item.roleId
            ,"phone": item.phone
            ,"idNumber": item.idNumber
            ,"weixin": item.weixin
            ,"seg": item.seg
            ,"fontImg": item.fontImg
            ,"afterImg": item.afterImg
            ,"homeImg": item.homeImg
            ,"remark": item.remark
        });

        var imgrooturl = common.url.web_root + common.url.model.worker.action + common.url.opt.model.worker.readImg+ '?path=';
        $("#fontImgTag").attr("src",imgrooturl +item.fontImg);
        $("#afterImgTag").attr("src",imgrooturl +item.afterImg);
        $("#homeImgTag").attr("src",imgrooturl +item.homeImg);
    };
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<初始化表单 结束<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<



    //初始化角色选择
    pageData.initRoleSelect();


    pageData.initWorkerInfo();



});