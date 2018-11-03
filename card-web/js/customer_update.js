//修改客户信息


layui.use(['form','layer','upload'],function () {


    var upload = layui.upload;
    var layer = layui.layer;
    var form = layui.form;
    var user = layui.sessionData('user');


    var pageData = {};

    pageData.customer = {id:''};



    var uploadUrl = common.url.web_root + common.url.model.customer.action + common.url.opt.model.customer.uploadImg

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

                if(pageData.customer.id){
                    this.data.id = pageData.customer.id;
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
                    pageData.customer.fontImg = path;
                    $("#fontImg").val(path);
                }else if(n==2){
                    pageData.customer.afterImg = path;
                    $("#afterImg").val(path);
                }else if(n==3){
                    pageData.customer.homeImg = path;
                    $("#homeImg").val(path);
                }
                //ID为空则保存起来(更新本来就有ID)
                // if(!pageData.customer.id){
                //     var id = path.split("/")[0];
                //     pageData.customer.id = id;
                //     $("#id").val(id);
                // }
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


    //打开选择组织弹出框
    pageData.openWorkerSelectModel = function(){

        var ww = $(window).width();
        ww = ww*0.8;
        var hh = $(window).height();
        hh = hh*0.8;
        layer.open({
            type:2,
            title:'选择用户',
            content: common.url.page_root + common.url.model.worker.page.selectList ,
            area:[ ww+'px',hh+'px'],
            btn:['确定'],
            yes:function (index, layero) {
                console.log("点击了确定");
                pageData.showSelectUsers();
                layer.close(index);//关掉自己
            }
        })


    };

    //显示选中的用户
    pageData.showSelectUsers = function(){
        var len = window.frames.length;
        var selectUsers = 0;
        for(var i=0;i<len;i++){
            if(window.frames[i].getSelectUsers && typeof  window.frames[i].getSelectUsers == "function"){
                selectUsers = window.frames[i].getSelectUsers();    //[{id,name},...]
                break;
            }
        }
        console.log(selectUsers);
        // if(selectUsers){
        //     len = selectUsers.length;
        //     var userNames = '';
        //     var userIds = '';
        //     for( var k=0;k<len;k++){
        //         var user = selectUsers[k];
        //         userNames += ','+user.name;
        //         userIds += ','+user.id;
        //     }
        //     $("input[name=workerId]").val(userIds.substring(1));
        //     $("input[name=workerName]").val(userNames.substring(1));
        // }
        if(selectUsers.length>1){
            layer.alert('只能选择一个员工',function () {
                layer.closeAll();
                $('input[name=workerName]').click();
            });
        }else {
            $("input[name=workerId]").val(selectUsers[0].id);
            $("input[name=workerName]").val(selectUsers[0].name);
        }

    };
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>初始化表单 开始>>>>>>>>>>>>>>>>>>>>>>>>>>>>>



    pageData.submitAdd = function(param){
        common.sendOption.data = param;
        common.sendOption.url = common.url.web_root + common.url.model.customer.action + common.url.opt.update;
        common.sendOption.type = common.sendMethod.POST;
        common.sendOption.completeCallBack =pageData.addComplete;

        common.httpSend(common.sendOption);
    }

    pageData.addComplete = function(res){
        common.noDataResponse(res,common.optName.CONTROLLER_OPT_UPDATE,common.url.model.customer.page.manager);
    };



    pageData.initCustomerInfo = function () {
        var p = common.util.getHrefParam();
        pageData.customer.id = p.id;
        common.sendOption.data = {id:p.id};
        common.sendOption.url = common.url.web_root + common.url.model.customer.action + common.url.opt.get;
        common.sendOption.type = common.sendMethod.GET;
        common.sendOption.completeCallBack =pageData.getComplete;

        common.httpSend(common.sendOption);
    };
    pageData.getComplete = function (res) {
        var data  = JSON.parse(res.responseText);
        var item  = JSON.parse(data.data);


        //查找员工名
        var workerName = common.util.initNameById(item.workerId,common.url.model.worker.action,$("input[name=workerName]"));

        form.val("customer_form", {
            "id": pageData.customer.id
            ,"workerName":workerName
            ,"workerId":item.workerId
            ,"name": item.name
            ,"idNumber": item.idNumber
            ,"phone": item.phone
            // ,"weixin": item.weixin
            ,"seg": item.seg
            ,"fontImg": item.fontImg
            ,"afterImg": item.afterImg
            ,"homeImg": item.homeImg
            ,"remark": item.remark
        });

        var imgrooturl = common.url.web_root + common.url.model.customer.action + common.url.opt.model.customer.readImg+ '?path=';
        $("#fontImgTag").attr("src",imgrooturl +item.fontImg);
        $("#afterImgTag").attr("src",imgrooturl +item.afterImg);
        $("#homeImgTag").attr("src",imgrooturl +item.homeImg);
    };



    //初始化上传图片控件（3个）
    pageData.initUploadImg(1);
    pageData.initUploadImg(2);
    pageData.initUploadImg(3);

    pageData.initCustomerInfo();//读取数据


    //监听提交按钮 submit(btn_id)
    form.on('submit(formAdd)', function(data){
       pageData.submitAdd(data.field);
        return false;
    });
//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<初始化表单 结束<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<



    //选择组织
    $(document.body).on('click','input[name=workerName]',function () {
        pageData.openWorkerSelectModel();
    });

});