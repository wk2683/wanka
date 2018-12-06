//新增客户信息


layui.use(['form','layer','upload'],function () {


    var upload = layui.upload;
    var layer = layui.layer;
    var form = layui.form;
    var user = layui.sessionData('user');


    var pageData = {};

    pageData.worker = {};

    pageData.worker.id = '';//初始化

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
        common.sendOption.url = common.url.web_root + common.url.model.customer.action + common.url.opt.add;
        common.sendOption.type = common.sendMethod.POST;
        common.sendOption.completeCallBack =pageData.addComplete;

        common.httpSend(common.sendOption);
    }

    pageData.addComplete = function(res){
        common.noDataResponse(res,common.optName.CONTROLLER_OPT_ADD,common.url.model.customer.page.manager);
    };

    $(function () {
        $("input[name=workerName]").val(user.name);
        $("input[name=workerId]").val(user.id);


        //初始化上传图片控件（3个）
        pageData.initUploadImg(1);
        pageData.initUploadImg(2);
        pageData.initUploadImg(3);

        //监听提交按钮 submit(btn_id)
        form.on('submit(formAdd)', function(data){
           pageData.submitAdd(data.field);
            return false;
        });


        //选择员工
        $(document.body).on('click','input[name=workerName]',function () {
            pageData.openWorkerSelectModel();
        });
    });
});
