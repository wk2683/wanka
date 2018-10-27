// bootstrap-treeview 的使用参考  https://www.cnblogs.com/tangzeqi/p/8021637.html
//
var UITree = function () {

    return {
        //main function to initiate the module
        init: function () {

            var DataSourceTree = function (options) {
                this._data = options.data;
                this._delay = options.delay;
            };

            DataSourceTree.prototype = {

                data: function (options, callback) {
                    var self = this;

                    setTimeout(function () {
                        var data = $.extend(true, [], self._data);

                        callback({ data: data });

                    }, this._delay)
                }
            };

            var addBtn = '<i class="fa fa-plus green"></i>';
            var editBtn = '<i class="fa fa-trash-o danger"></i>';
            var deleteBtn = '<i class="fa fa-rotate-right blizzard"></i>';
            var itemIcon = '<i class="fa fa-user yellow"></i>';//<i class="fa fa-calendar sky"></i>  //<i class="fa fa-suitcase magenta"></i>
            var treeItemAction = '<div class="tree-actions">'+ addBtn + editBtn + deleteBtn +'</div>';

            var treeDataSource4 = new DataSourceTree({
                data: [
                    {
                        name: '组织名称1' + treeItemAction,
                        type: 'folder',
                        additionalParameters: { id: 'F11' }
                    },
                    { name: '组织名称2' + treeItemAction, type: 'folder', additionalParameters: { id: 'F12' } },
                    { name: itemIcon + 'Member ' + treeItemAction, type: 'item', additionalParameters: { id: 'I11' } },
                    { name: itemIcon + 'Events ' + treeItemAction, type: 'item', additionalParameters: { id: 'I12' } },
                    { name: itemIcon + 'Portfolio ' + treeItemAction, type: 'item', additionalParameters: { id: 'I12' }}
                ],
                delay: 400
            });

            $('#org_tree').tree({
                selectable: true,
                dataSource: treeDataSource4,
                loadingHTML: '<div class="tree-loading"><i class="fa fa-rotate-right fa-spin"></i></div>',
                multiSelect:false,
                folderSelect:false,
                cacheItems:true,
                'open-icon':'ace-icon tree-minus',
                'close-icon':'ace-icon tree-plus',
                'selectable':true,
                'selected-icon':'ace-icon fa fa-check',
                'unselected-icon':'ace-icon fa fa-times'
            }).on('selected.fu.tree',function (e) {
                console.log('selected.fu.tree');
            }).on('loaded.fu.tree',function (e) {
                console.log('loaded.fu.tree');
            }).on('deselected.fu.tree',function (e) {
                console.log('deselected.fu.tree');
            });
        }
    };
}();

//查询所有组织
function loadOrgs(org) {
    var options = {
        url:common.web_root + common.url.model.org + common.url.opt.search,
        data:org,
        type:"GET",
        dataType:"JSON",
        success:searchCompelte,
    };
    common.httpSend(options);
}

function searchCompelte(response) {

}

//弹出添加组织表单
//porg 父级组织对象{id,name,parentId,parents}
//clickObj 点击的DOM节点，如果porg为0或者判断为false时，则用clickObj获取相应的参数
function openAddOrgModel(porg,clickObj) {
    /**
     * porg={id,name,parentId,parents}
     */


    var pid_name = porg.name?porg.name:'根组织';
    var parentId = porg.id?porg.id:'0';
    var parents = porg.parents?porg.parents:'0';
    $("#pid_name").val(pid_name).attr("placeHolder",pid_name);
    $("#parentId").val(parentId);
    $("#parents").val(parents);
    $("#name").val();
    //自动引入父组织信息
    var form_model = $("#org_add_form");

    bootbox.dialog({
        message: form_model.html(),
        title: "添加组织",
        className: "modal-darkorange",
        buttons: {
            success: {
                label: "提交",
                className: "btn-blue",
                callback: function () {
                    console.log("提交信息");
                    var org = {
                        parentId:porg.id,
                        parents:porg.parents+','+porg.id,
                        name:$("#name").val(),
                        seg:$("#seg").val(),
                        remark:$("#remark").val()
                    };
                    submitOrg(org);
                }
            }
        }
    });
}
//新增组织提交
function submitOrg(org) {
    var options = {
        url: common.url.web_root + common.url.model.org + common.url.opt.add,
        type:"POST",
        data:org,
        dataType:'json',
        successCallBack:addCompelte
    };
     common.httpSend(options);
    // $.ajax({
    //     url:options.url,
    //     type:options.type,
    //     data:options.data,
    //     dataType:options.dataType,
    //     success:addSuccess,
    //     error:common.errorCallBack
    // })
}
//返回完成处理
function addCompelte(response) {
    var resData = response.responseText;
    if(typeof resData == 'string'){
        resData = JSON.parse(resData);
    }
    if(resData.code && resData.code == common.code.RESPONSE_CODE_SUCCESS){
        // bootbox.alert(
        //     common.opt.CONTROLLER_OPT_ADD+common.msg.RESPONSE_MSG_SUCCESS,
        //     function () {
        //         // window.reload();
        //         window.location.href = window.location.href;//刷新
        //
        //     });

        bootbox.dialog({
            message:common.opt.CONTROLLER_OPT_ADD+common.msg.RESPONSE_MSG_SUCCESS,
            title:"操作提示",
            className:"bs-example-modal-sm",
            buttons: {
                success: {
                    label: "确定",
                    className: "btn-blue",
                    callback: function () {
                        window.location.href = window.location.href;//刷新
                    }
                }
            }
        });
    }else{
        bootbox.alert(
            common.opt.CONTROLLER_OPT_ADD+common.msg.RESPONSE_MSG_FAILE,
            function () {
                console.log(resData.msg);
            });
    }
}

