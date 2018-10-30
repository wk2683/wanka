var common = {};//公共体
common.web_logo = '../common/image/logo.png';

common.sendMethod = {GET :'GET',POST:'POST'};
common.sendDataType = {
    JSON:'json',
    STRING:'string',
};
common.sendContentType = {
    postContentTyppe:'application/json;charset=UTF-8' //POST 提交要设置contentType，不然后台接收异常
};
//调用公共请求方法应该要设置的参数
common.sendOption = {
    url:'',
    type:common.sendMethod.GET,
    data:null,
    completeCallBack:''
};
common.url = {
    web_root:'http://localhost:8002/',
    model:{
        account:    {acttion:'account/',    name:'账户'},
        card:       {acttion:'card/',       name:'信用卡'},
        customer:   {acttion:'customer/',   name:'客户'},
        model:      {
            acttion:'model/',
            name:'模块',
            page:{
                manager:'page/model_manager.html',
                add:'page/model_add.html'
            }
        },
        optType:    {acttion:'optType/',    name:'操作类型'},
        order:      {acttion:'order/',      name:'订单'},
        orderType:  {acttion:'orderType/',  name:'订单类型'},
        org:        {acttion:'org/',        name:'组织'},
        permission: {acttion:'permission/', name:'权限'},
        pos:        {acttion:'pos/',        name:'POS机'},
        rate:       {acttion:'rate/',       name:'费率'},
        role:       {acttion:'role/',       name:'角色'},
        worker:     {
            acttion:'worker/',
            name:'员工',
            page:{
                manager:'page/worker_manager.html',
                add:'page/worker_add.html'
            }
        }
    },
    opt:{
        add:'add',
        delete:'delete',
        get:'get',
        update:'update',
        search:'search',
        model:{
            worker:{
                uploadImg:'uploadImg',
                readImg:'readImg'
            }
        }
    }
};

//已经定义在一起
// common.name = {
//     model: {
//         account:'账户信息',
//         card:'信用卡信息',
//         customer:'客户信息',
//         model:'模块信息',
//         optType:'操作类型',
//         order:'订单',
//         orderType:'订单类型',
//         org:'组织',
//         permission:'权限',
//         pos:'POS机',
//         rate:'费率',
//         role:'角色',
//         worker:'员工信息'
//     }
// };

common.code = {
    RESPONSE_CODE_SUCCESS:8001,
    RESPONSE_CODE_FAILE:8002,
    RESPONSE_CODE_NODATA:8004,
    RESPONSE_CODE_ERROR:8005
};
common.msg = {
    RESPONSE_MSG_SUCCESS:"成功",
    RESPONSE_MSG_FAILE:"失败",
    RESPONSE_MSG_NODATA:"无数据",
    RESPONSE_MSG_ERROR:"错误"
};
common.optName = {
    CONTROLLER_OPT_ADD:"新增",
    CONTROLLER_OPT_DELETE:"删除",
    CONTROLLER_OPT_UPDATE:"更新",
    CONTROLLER_OPT_GET:"查询",
    CONTROLLER_OPT_SEARCH:"搜索"
};

common.util = {};

// sessionStorage 操作
// 保存数据到sessionStorage
//sessionStorage.setItem('key', 'value');

// 从sessionStorage获取数据
//var data = sessionStorage.getItem('key');

// 从sessionStorage删除保存的数据
//sessionStorage.removeItem('key');

// 从sessionStorage删除所有保存的数据
//sessionStorage.clear();
//系统会话保存的数据
common.session = {
    key:{
        orgData:'orgData',//一维组织数组
        orgTree:'orgTree',//树形结构数组
        roleData:'roleData',//角色数组
        modelData:'modelData',//模块
        permissionData: 'permissionData',//所有权限
        modelTree:'modelTree',//模块与权限的组合树
    }
};

common.menu = [
                {
                    id:"1",
                    name:"模块管理",
                    pid:"-1",
                    children:[
                        {
                            id:"101",
                            name:"新增模块",
                            pid:"1",
                            type:"page",
                            url:"model_add.html"
                        },
                        {
                            id:"101",
                            name:"模块管理",
                            pid:"1",
                            type:"page",
                            url:"model_manager.html"
                        }
                    ]
                },
                {
                    id:"1",
                    name:"组织管理",
                    pid:"-1",
                    children:[
                        {
                            id:"101",
                            name:"组织管理",
                            pid:"1",
                            type:"page",
                            url:"org_manager.html"
                        }
                    ]
                },
                {
                    id:"1",
                    name:"角色管理",
                    pid:"-1",
                    children:[
                        {
                            id:"101",
                            name:"角色管理",
                            pid:"1",
                            type:"page",
                            url:"role_manager.html"
                        }
                    ]
                },
                {
                    id:"1",
                    name:"用户管理",
                    pid:"-1",
                    children:[
                        {
                            id:"101",
                            name:"用户列表",
                            pid:"1",
                            type:"page",
                            url:"worker_manager.html"
                        },
                        {
                            id:"101",
                            name:"新增用户",
                            pid:"1",
                            type:"page",
                            url:"worker_add.html"
                        }
                    ]
                },
                {
                    id:"1",
                    name:"订单管理",
                    pid:"-1",
                    children:[
                        {
                            id:"101",
                            name:"订单列表",
                            pid:"1",
                            type:"page",
                            url:"order_manager.html"
                        }
                    ]
                },
                {
                    id:"1",
                    name:"客户信息管理",
                    pid:"-1",
                    children:[
                        {
                            id:"101",
                            name:"客户列表",
                            pid:"1",
                            type:"page",
                            url:"customer_manager.html"
                        },
                        {
                            id:"101",
                            name:"新增客户信息",
                            pid:"1",
                            type:"page",
                            url:"customer_add.html"
                        }
                    ]
                },
                {
                    id:"1",
                    name:"POS信息管理",
                    pid:"-1",
                    children:[
                        {
                            id:"101",
                            name:"POS机信息管理",
                            pid:"1",
                            type:"page",
                            url:"pos_manager.html"
                        },
                        {
                            id:"101",
                            name:"新增POS机信息",
                            pid:"1",
                            type:"page",
                            url:"pos_add.html"
                        }
                    ]
                },
                {
                    id:"1",
                    name:"信用卡管理",
                    pid:"-1",
                    children:[
                        {
                            id:"101",
                            name:"信用卡管理",
                            pid:"1",
                            type:"page",
                            url:"card_manager.html"
                        },
                        {
                            id:"101",
                            name:"新增信用卡",
                            pid:"1",
                            type:"page",
                            url:"card_add.html"
                        }
                    ]
                }
            ];




//初始化加载过程展示的dom节点
common.initLoadingDom = function () {
    var loadingDom = '<div class="loading-container">\n' +
                        '        <div class="loading-progress">\n' +
                        '            <div class="rotator">\n' +
                        '                <div class="rotator">\n' +
                        '                    <div class="rotator colored">\n' +
                        '                        <div class="rotator">\n' +
                        '                            <div class="rotator colored">\n' +
                        '                                <div class="rotator colored"></div>\n' +
                        '                                <div class="rotator"></div>\n' +
                        '                            </div>\n' +
                        '                            <div class="rotator colored"></div>\n' +
                        '                        </div>\n' +
                        '                        <div class="rotator"></div>\n' +
                        '                    </div>\n' +
                        '                    <div class="rotator"></div>\n' +
                        '                </div>\n' +
                        '                <div class="rotator"></div>\n' +
                        '            </div>\n' +
                        '            <div class="rotator"></div>\n' +
                        '        </div>\n' +
                        '    </div>';
    $(document.body).prepend(loadingDom);
};
//初始化模态框使用到的dom
common.initModelDom = function () {
    var miniModelHtml = '<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">\n' +
        '        <div class="modal-dialog modal-sm">\n' +
        '            <div class="modal-content">\n' +
        '                <div class="modal-header">\n' +
        '                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>\n' +
        '                    <h4 class="modal-title" id="mySmallModalLabel">提示标题</h4>\n' +
        '                </div>\n' +
        '                <div class="modal-body">提示内容</div>\n' +
        '            </div><!-- /.modal-content -->\n' +
        '        </div><!-- /.modal-dialog -->' +
        '    </div>';

    var largeModelHtml = '<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">\n' +
        '        <div class="modal-dialog modal-lg">\n' +
        '            <div class="modal-content">\n' +
        '                <div class="modal-header">\n' +
        '                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>\n' +
        '                    <h4 class="modal-title" id="myLargeModalLabel">提示标题</h4>\n' +
        '                </div>\n' +
        '                <div class="modal-body">提示内容</div>\n' +
        '            </div><!-- /.modal-content -->\n' +
        '        </div><!-- /.modal-dialog -->\n' +
        '    </div>\n';
    var modelHtml = '';
    $(document.body).prepend(modelHtml);
};
//初始化头条
common.initTopNav = function () {

    var emailList =    '                                <ul class="pull-right dropdown-menu dropdown-arrow dropdown-messages">\n' +
        '                                    <li>\n' +
        '                                        <a href="#">\n' +
        '                                            <img src="assets/img/avatars/divyia.jpg" class="message-avatar" alt="Divyia Austin">\n' +
        '                                            <div class="message">\n' +
        '                                                <span class="message-sender">\n' +
        '                                                    Divyia Austin\n' +
        '                                                </span>\n' +
        '                                                <span class="message-time">\n' +
        '                                                    2 minutes ago\n' +
        '                                                </span>\n' +
        '                                                <span class="message-subject">\n' +
        '                                                    Here\'s the recipe for apple pie\n' +
        '                                                </span>\n' +
        '                                                <span class="message-body">\n' +
        '                                                    to identify the sending application when the senders image is shown for the main icon\n' +
        '                                                </span>\n' +
        '                                            </div>\n' +
        '                                        </a>\n' +
        '                                    </li>\n' +
        '                                    <li>\n' +
        '                                        <a href="#">\n' +
        '                                            <img src="assets/img/avatars/bing.png" class="message-avatar" alt="Microsoft Bing">\n' +
        '                                            <div class="message">\n' +
        '                                                <span class="message-sender">\n' +
        '                                                    Bing.com\n' +
        '                                                </span>\n' +
        '                                                <span class="message-time">\n' +
        '                                                    Yesterday\n' +
        '                                                </span>\n' +
        '                                                <span class="message-subject">\n' +
        '                                                    Bing Newsletter: The January Issue‏\n' +
        '                                                </span>\n' +
        '                                                <span class="message-body">\n' +
        '                                                    Discover new music just in time for the Grammy® Awards.\n' +
        '                                                </span>\n' +
        '                                            </div>\n' +
        '                                        </a>\n' +
        '                                    </li>\n' +
        '                                    <li>\n' +
        '                                        <a href="#">\n' +
        '                                            <img src="assets/img/avatars/adam-jansen.jpg" class="message-avatar" alt="Divyia Austin">\n' +
        '                                            <div class="message">\n' +
        '                                                <span class="message-sender">\n' +
        '                                                    Nicolas\n' +
        '                                                </span>\n' +
        '                                                <span class="message-time">\n' +
        '                                                    Friday, September 22\n' +
        '                                                </span>\n' +
        '                                                <span class="message-subject">\n' +
        '                                                    New 4K Cameras\n' +
        '                                                </span>\n' +
        '                                                <span class="message-body">\n' +
        '                                                    The 4K revolution has come over the horizon and is reaching the general populous\n' +
        '                                                </span>\n' +
        '                                            </div>\n' +
        '                                        </a>\n' +
        '                                    </li>\n' +
        '                                </ul>\n' +
        '                                <!--/Messages Dropdown-->\n' ;

    var taskList  =  '                                <!--Tasks Dropdown-->\n' +
    '                                <ul class="pull-right dropdown-menu dropdown-tasks dropdown-arrow ">\n' +
    '                                    <li class="dropdown-header bordered-darkorange">\n' +
    '                                        <i class="fa fa-tasks"></i>\n' +
    '                                        4 Tasks In Progress\n' +
    '                                    </li>\n' +
    '                                    <li>\n' +
    '                                        <a href="#">\n' +
    '                                            <div class="clearfix">\n' +
    '                                                <span class="pull-left">Account Creation</span>\n' +
    '                                                <span class="pull-right">65%</span>\n' +
    '                                            </div>\n' +
    '\n' +
    '                                            <div class="progress progress-xs">\n' +
    '                                                <div style="width:65%" class="progress-bar"></div>\n' +
    '                                            </div>\n' +
    '                                        </a>\n' +
    '                                    </li>\n' +
    '                                    <li>\n' +
    '                                        <a href="#">\n' +
    '                                            <div class="clearfix">\n' +
    '                                                <span class="pull-left">Profile Data</span>\n' +
    '                                                <span class="pull-right">35%</span>\n' +
    '                                            </div>\n' +
    '\n' +
    '                                            <div class="progress progress-xs">\n' +
    '                                                <div style="width:35%" class="progress-bar progress-bar-success"></div>\n' +
    '                                            </div>\n' +
    '                                        </a>\n' +
    '                                    </li>\n' +
    '                                    <li>\n' +
    '                                        <a href="#">\n' +
    '                                            <div class="clearfix">\n' +
    '                                                <span class="pull-left">Updating Resume</span>\n' +
    '                                                <span class="pull-right">75%</span>\n' +
    '                                            </div>\n' +
    '\n' +
    '                                            <div class="progress progress-xs">\n' +
    '                                                <div style="width:75%" class="progress-bar progress-bar-darkorange"></div>\n' +
    '                                            </div>\n' +
    '                                        </a>\n' +
    '                                    </li>\n' +
    '                                    <li>\n' +
    '                                        <a href="#">\n' +
    '                                            <div class="clearfix">\n' +
    '                                                <span class="pull-left">Adding Contacts</span>\n' +
    '                                                <span class="pull-right">10%</span>\n' +
    '                                            </div>\n' +
    '\n' +
    '                                            <div class="progress progress-xs">\n' +
    '                                                <div style="width:10%" class="progress-bar progress-bar-warning"></div>\n' +
    '                                            </div>\n' +
    '                                        </a>\n' +
    '                                    </li>\n' +
    '                                    <li class="dropdown-footer">\n' +
    '                                        <a href="#">\n' +
    '                                            See All Tasks\n' +
    '                                        </a>\n' +
    '                                        <button class="btn btn-xs btn-default shiny darkorange icon-only pull-right"><i class="fa fa-check"></i></button>\n' +
    '                                    </li>\n' +
    '                                </ul>\n' +
    '                                <!--/Tasks Dropdown-->\n' ;


    emailList = '';
    taskList = '';

    var topNavHtml = '<div class="navbar">\n' +
                        '        <div class="navbar-inner">\n' +
                        '            <div class="navbar-container">\n' +
                        '                <!-- Navbar Barnd -->\n' +
                        '                <div class="navbar-header pull-left">\n' +
                        '                    <a href="#" class="navbar-brand">\n' +
                        '                        <small>\n' +
                        '                            <img src="'+common.web_logo+'" alt="" />\n' +
                        '                        </small>\n' +
                        '                    </a>\n' +
                        '                </div>\n' +
                        '                <!-- /Navbar Barnd -->\n' +
                        '\n' +
                        '                <!-- Sidebar Collapse -->\n' +
                        '                <div class="sidebar-collapse" id="sidebar-collapse">\n' +
                        '                    <i class="collapse-icon fa fa-bars"></i>\n' +
                        '                </div>\n' +
                        '                <!-- /Sidebar Collapse -->\n' +
                        '                <!-- Account Area and Settings --->\n' +
                        '                <div class="navbar-header pull-right">\n' +
                        '                    <div class="navbar-account">\n' +
                        '                        <ul class="account-area">\n' +
                        '                            <li>\n' +
                        '                                <a class=" dropdown-toggle" data-toggle="dropdown" title="Help" href="#">\n' +
                        '                                    <i class="icon fa fa-warning"></i>\n' +
                        '                                </a>\n' +
                        '                                <!--Notification Dropdown-->\n' +
                        '                                <ul class="pull-right dropdown-menu dropdown-arrow dropdown-notifications">\n' +
                        '                                    <li>\n' +
                        '                                        <a href="#">\n' +
                        '                                            <div class="clearfix">\n' +
                        '                                                <div class="notification-icon">\n' +
                        '                                                    <i class="fa fa-phone bg-themeprimary white"></i>\n' +
                        '                                                </div>\n' +
                        '                                                <div class="notification-body">\n' +
                        '                                                    <span class="title">Skype meeting with Patty</span>\n' +
                        '                                                    <span class="description">01:00 pm</span>\n' +
                        '                                                </div>\n' +
                        '                                                <div class="notification-extra">\n' +
                        '                                                    <i class="fa fa-clock-o themeprimary"></i>\n' +
                        '                                                    <span class="description">office</span>\n' +
                        '                                                </div>\n' +
                        '                                            </div>\n' +
                        '                                        </a>\n' +
                        '                                    </li>\n' +
                        '                                    <li>\n' +
                        '                                        <a href="#">\n' +
                        '                                            <div class="clearfix">\n' +
                        '                                                <div class="notification-icon">\n' +
                        '                                                    <i class="fa fa-check bg-darkorange white"></i>\n' +
                        '                                                </div>\n' +
                        '                                                <div class="notification-body">\n' +
                        '                                                    <span class="title">Uncharted break</span>\n' +
                        '                                                    <span class="description">03:30 pm - 05:15 pm</span>\n' +
                        '                                                </div>\n' +
                        '                                                <div class="notification-extra">\n' +
                        '                                                    <i class="fa fa-clock-o darkorange"></i>\n' +
                        '                                                </div>\n' +
                        '                                            </div>\n' +
                        '                                        </a>\n' +
                        '                                    </li>\n' +
                        '                                    <li>\n' +
                        '                                        <a href="#">\n' +
                        '                                            <div class="clearfix">\n' +
                        '                                                <div class="notification-icon">\n' +
                        '                                                    <i class="fa fa-gift bg-warning white"></i>\n' +
                        '                                                </div>\n' +
                        '                                                <div class="notification-body">\n' +
                        '                                                    <span class="title">Kate birthday party</span>\n' +
                        '                                                    <span class="description">08:30 pm</span>\n' +
                        '                                                </div>\n' +
                        '                                                <div class="notification-extra">\n' +
                        '                                                    <i class="fa fa-calendar warning"></i>\n' +
                        '                                                    <i class="fa fa-clock-o warning"></i>\n' +
                        '                                                    <span class="description">at home</span>\n' +
                        '                                                </div>\n' +
                        '                                            </div>\n' +
                        '                                        </a>\n' +
                        '                                    </li>\n' +
                        '                                    <li>\n' +
                        '                                        <a href="#">\n' +
                        '                                            <div class="clearfix">\n' +
                        '                                                <div class="notification-icon">\n' +
                        '                                                    <i class="fa fa-glass bg-success white"></i>\n' +
                        '                                                </div>\n' +
                        '                                                <div class="notification-body">\n' +
                        '                                                    <span class="title">Dinner with friends</span>\n' +
                        '                                                    <span class="description">10:30 pm</span>\n' +
                        '                                                </div>\n' +
                        '                                            </div>\n' +
                        '                                        </a>\n' +
                        '                                    </li>\n' +
                        '                                    <li class="dropdown-footer ">\n' +
                        '                                        <span>\n' +
                        '                                            Today, March 28\n' +
                        '                                        </span>\n' +
                        '                                        <span class="pull-right">\n' +
                        '                                            10°c\n' +
                        '                                            <i class="wi wi-cloudy"></i>\n' +
                        '                                        </span>\n' +
                        '                                    </li>\n' +
                        '                                </ul>\n' +
                        '                                <!--/Notification Dropdown-->\n' +
                        '                            </li>\n' +
                        '                            <li>\n' +
                        '                                <a class="wave in dropdown-toggle" data-toggle="dropdown" title="今日新增客户" href="#">\n' +
                        '                                    <i class="icon fa fa-envelope"></i>\n' +
                        '                                    <span class="badge">3</span>\n' +
                        '                                </a>\n' +
                        '                                <!--Messages Dropdown-->\n' +
                emailList+
                        '                            </li>\n' +
                        '\n' +
                        '                            <li>\n' +
                        '                                <a class="dropdown-toggle" data-toggle="dropdown" title="未完成订单" href="#">\n' +
                        '                                    <i class="icon fa fa-tasks"></i>\n' +
                        '                                    <span class="badge">4</span>\n' +
                        '                                </a>\n' +
                 taskList +
                        '                            </li>\n' +
                        '                            <li>\n' +
                        '                                <a class="login-area dropdown-toggle" data-toggle="dropdown">\n' +
                        '                                    <div class="avatar" title="View your public profile">\n' +
                        '                                        <img src="../common/image/default_user.jpg">\n' +
                        '                                    </div>\n' +
                        '                                    <section>\n' +
                        '                                        <h2><span class="profile"><span>用户名</span></span></h2>\n' +
                        '                                    </section>\n' +
                        '                                </a>\n' +
                        '                                <!--Login Area Dropdown-->\n' +
                        '                                <ul class="pull-right dropdown-menu dropdown-arrow dropdown-login-area">\n' +
                        '                                    <li class="username"><a>David Stevenson</a></li>\n' +
                        '                                    <li class="email"><a>David.Stevenson@live.com</a></li>\n' +
                        '                                    <!--Avatar Area-->\n' +
                        '                                    <li>\n' +
                        '                                        <div class="avatar-area">\n' +
                        '                                            <img src="assets/img/avatars/adam-jansen.jpg" class="avatar">\n' +
                        '                                            <span class="caption">Change Photo</span>\n' +
                        '                                        </div>\n' +
                        '                                    </li>\n' +
                        '                                    <!--Avatar Area-->\n' +
                        '                                    <li class="edit">\n' +
                        '                                        <a href="profile.html" class="pull-left">Profile</a>\n' +
                        '                                        <a href="#" class="pull-right">Setting</a>\n' +
                        '                                    </li>\n' +
                        '                                    <!--Theme Selector Area-->\n' +
                        '                                    <li class="theme-area">\n' +
                        '                                        <ul class="colorpicker" id="skin-changer">\n' +
                        '                                            <li><a class="colorpick-btn" href="#" style="background-color:#5DB2FF;" rel="assets/css/skins/blue.min.css"></a></li>\n' +
                        '                                            <li><a class="colorpick-btn" href="#" style="background-color:#2dc3e8;" rel="assets/css/skins/azure.min.css"></a></li>\n' +
                        '                                            <li><a class="colorpick-btn" href="#" style="background-color:#03B3B2;" rel="assets/css/skins/teal.min.css"></a></li>\n' +
                        '                                            <li><a class="colorpick-btn" href="#" style="background-color:#53a93f;" rel="assets/css/skins/green.min.css"></a></li>\n' +
                        '                                            <li><a class="colorpick-btn" href="#" style="background-color:#FF8F32;" rel="assets/css/skins/orange.min.css"></a></li>\n' +
                        '                                            <li><a class="colorpick-btn" href="#" style="background-color:#cc324b;" rel="assets/css/skins/pink.min.css"></a></li>\n' +
                        '                                            <li><a class="colorpick-btn" href="#" style="background-color:#AC193D;" rel="assets/css/skins/darkred.min.css"></a></li>\n' +
                        '                                            <li><a class="colorpick-btn" href="#" style="background-color:#8C0095;" rel="assets/css/skins/purple.min.css"></a></li>\n' +
                        '                                            <li><a class="colorpick-btn" href="#" style="background-color:#0072C6;" rel="assets/css/skins/darkblue.min.css"></a></li>\n' +
                        '                                            <li><a class="colorpick-btn" href="#" style="background-color:#585858;" rel="assets/css/skins/gray.min.css"></a></li>\n' +
                        '                                            <li><a class="colorpick-btn" href="#" style="background-color:#474544;" rel="assets/css/skins/black.min.css"></a></li>\n' +
                        '                                            <li><a class="colorpick-btn" href="#" style="background-color:#001940;" rel="assets/css/skins/deepblue.min.css"></a></li>\n' +
                        '                                        </ul>\n' +
                        '                                    </li>\n' +
                        '                                    <!--/Theme Selector Area-->\n' +
                        '                                    <li class="dropdown-footer">\n' +
                        '                                        <a href="login.html">\n' +
                        '                                            Sign out\n' +
                        '                                        </a>\n' +
                        '                                    </li>\n' +
                        '                                </ul>\n' +
                        '                                <!--/Login Area Dropdown-->\n' +
                        '                            </li>\n' +
                        '                            <!-- /Account Area -->\n' +
                        '                            <!--Note: notice that setting div must start right after account area list.\n' +
                        '                            no space must be between these elements-->\n' +
                        '                            <!-- Settings -->\n' +
                        '                        </ul><div class="setting">\n' +
                        '                            <a id="btn-setting" title="Setting" href="#">\n' +
                        '                                <i class="icon glyphicon glyphicon-cog"></i>\n' +
                        '                            </a>\n' +
                        '                        </div><div class="setting-container">\n' +
                        '                            <label>\n' +
                        '                                <input type="checkbox" id="checkbox_fixednavbar">\n' +
                        '                                <span class="text">固定头条</span>\n' +
                        '                            </label>\n' +
                        '                            <label>\n' +
                        '                                <input type="checkbox" id="checkbox_fixedsidebar">\n' +
                        '                                <span class="text">固定左边栏</span>\n' +
                        '                            </label>\n' +
                        '                            <label>\n' +
                        '                                <input type="checkbox" id="checkbox_fixedbreadcrumbs">\n' +
                        '                                <span class="text">固定导航图</span>\n' +
                        '                            </label>\n' +
                        '                            <label>\n' +
                        '                                <input type="checkbox" id="checkbox_fixedheader">\n' +
                        '                                <span class="text">固定导航工具</span>\n' +
                        '                            </label>\n' +
                        '                        </div>\n' +
                        '                        <!-- Settings -->\n' +
                        '                    </div>\n' +
                        '                </div>\n' +
                        '                <!-- /Account Area and Settings -->\n' +
                        '            </div>\n' +
                        '        </div>\n' +
                        '    </div>';
    $(document.body).prepend(topNavHtml);
};

//初始化左边导航
common.initLeftSilder = function () {
    var topNavSearch = '<div class="sidebar-header-wrapper">\n' +
        '                    <input type="text" class="searchinput" />\n' +
        '                    <i class="searchicon fa fa-search"></i>\n' +
        '                    <div class="searchhelper">关键字搜索菜单</div>\n' +
        '                </div>';


    var meun = common.renderLeftMeun(common.menu );
    var leftSilderHtml = '<div class="page-sidebar" id="sidebar">' + topNavSearch + meun + '</div>';
    $("div.page-container").prepend(leftSilderHtml);
};

//初始化地图导航
common.initMapNav = function () {
    var mapNavHtml = '<div class="page-breadcrumbs">\n' +
                        '                    <ul class="breadcrumb">\n' +
                        '                        <li>\n' +
                        '                            <i class="fa fa-home"></i>\n' +
                        '                            <a href="#">Home</a>\n' +
                        '                        </li>\n' +
                        '                        <li class="active">Dashboard</li>\n' +
                        '                    </ul>\n' +
                        '                </div>';
    $("div.page-content").prepend(mapNavHtml);
};

//初始化细分导航和页面控制工具
common.initMiniNavTool = function () {
    var miniNavToolHtml = '<div class="page-header position-relative">\n' +
                            '                    <div class="header-title">\n' +
                            '                        <h1>\n' +
                            '                            Dashboard\n' +
                            '                        </h1>\n' +
                            '                    </div>\n' +
                            '                    <!--Header Buttons-->\n' +
                            '                    <div class="header-buttons">\n' +
                            '                        <a class="sidebar-toggler" href="#">\n' +
                            '                            <i class="fa fa-arrows-h"></i>\n' +
                            '                        </a>\n' +
                            '                        <a class="refresh" id="refresh-toggler" href="">\n' +
                            '                            <i class="glyphicon glyphicon-refresh"></i>\n' +
                            '                        </a>\n' +
                            '                        <a class="fullscreen" id="fullscreen-toggler" href="#">\n' +
                            '                            <i class="glyphicon glyphicon-fullscreen"></i>\n' +
                            '                        </a>\n' +
                            '                    </div>\n' +
                            '                    <!--Header Buttons End-->\n' +
                            '                </div>';
    $("div.page-content").prepend(miniNavToolHtml);
};
//统一初始化
common.initCom = function () {
    common.initTopNav();//body 第二个子节点 顶部导航
    common.initLoadingDom();//body 第一个子节点 加载提示节点
    common.initModelDom();//body 最前面加载模态框节点

    common.initLeftSilder();//div.page-container 第一个子节点 侧边菜单

    common.initMiniNavTool();//div.page-content 第二个子节点
    common.initMapNav();//div.page-content 第一个子节点
};
common.renderLeftMeun = function (navArrayData) {
    var navLeftMeun = '';
    if(!navArrayData){
        bootbox.dialog({
            title:'系统提示',
            message:'加载菜单失败'
        });
        return;
    }
    var len = navArrayData.length;
    navLeftMeun = '<ul class="nav sidebar-menu">';
    for(var i=0;i<len;i++){
        var item = navArrayData[i];
        var submeun = common.getSubMeun(item);
        navLeftMeun += '<li>' +
                        '   <a href="#" class="menu-dropdown">\n' +
                        '       <i class="menu-icon glyphicon glyphicon-tasks"></i>\n' +
                        '       <span class="menu-text"> '+item.name+' </span>\n' +
                        '       <i class="menu-expand"></i>\n' +
                        '   </a>' +submeun+
                        '</li>';
    }
    navLeftMeun += '</ul>';
    return navLeftMeun;
};
//获取子菜单-侧边栏
common.getSubMeun = function (meunItem) {
    if(!meunItem.children){
        var page_blank =   '<ul class="submenu">\n' +
                        '   <li>\n' +
                        '       <a href="blank.html">\n' +
                        '           <span class="menu-text"> '+meunItem.name+' </span>' +
                        '       </a>\n' +
                        '   </li>' +
                        '</ul>';
        return page_blank;//空白页面
    }
    var itemList = meunItem.children;
    var sublen = itemList.length;
    var li_list = '';
    for(var i=0;i<sublen;i++){
        var item = itemList[i];
        if(item.type=='page'){
            li_list += '<li>\n' +
                        '   <a href="'+item.url+'" class="menu-dropdown">\n' +
                        '       <span class="menu-text">'+item.name+'</span>\n' +
                        '   </a>' +
                        '</li>';
        }
    }
    var ul_html = '<ul class="submenu">' + li_list + '</ul>';
    return ul_html;
}
//
//内部参照 http://jquery.cuishifeng.cn/jQuery.Ajax.html
//options = {url,data,success,error}
/**
 * 请求方法
 * @param options 必填的 {url,completeCallBack}
 */
common.httpSend = function (options) {
    //设置一些默认值
    if(!options.errorCallBack){
        options.errorCallBack = common.errorCallBack;
    }
    if(!options.compelteCallBack){
        options.compelteCallBack = common.compelteCallBack;
    }
    if(!options.type){
        options.type = 'GET';
    }
    if(!options.dataType){
        options.dataType = 'json';
    }
    if(!options.data){
        options.data = {};
    }
    if(!options.data.userId ) {
        options.data.userId = "uesr_id";//从sessionStage里提取
    }
    if(!options.data.userName) {
        options.data.userName = "uesr_name";//从sessionStage里提取
    }

    var ajaxOption = {
        url:options.url,
        type:options.type,
        data:options.data,
        dataType:options.dataType,
        beforeSend:common.defaultBeforeSend,//发送前处理
        dataFilter:common.defaultDataFilter,//响应前处理
        // success:options.successCallBack,//成功返回处理
        // error:options.errorCallBack,//返回失败处理
        complete:options.completeCallBack,//请求完成处理
    };
    if(options.type==common.sendMethod.POST){
        ajaxOption.contentType = common.sendContentType.postContentTyppe;
        ajaxOption.data = JSON.stringify(ajaxOption.data);
    }
    $.ajax(ajaxOption);

}
/**
 * 默认发送前处理
 * @param xhr
 */
common.defaultBeforeSend = function (xhr) {
    console.log("请求之前");
    $(".loading-container").removeClass("loading-inactive");
};

/**
 *  请求成功回调
 * @param data data是Ajax返回的原始数据
 * @param type type是调用jQuery.ajax时提供的dataType参数
 */
common.defaultDataFilter = function (data, type) {
    $(".loading-container").addClass("loading-inactive");
    console.log("请求返回")
    console.log("请求返回数据"+data)
    console.log("数据类型="+type)
}
/**
 * 默认请求失败处理
 * @param xhr
 * @param status
 * @param ex
 */
common.errorCallBack = function (xhr,status,ex) {
    $(".loading-container").addClass("loading-inactive");
    console.log("请求失败");
    console.log("responseText="+xhr.responseText);
    console.log("status="+status);
    console.log("ex="+ex);
    bootbox.alert(
        '系统异常',
        function () {
            // console.log(xhr.responseText);
        });
};
/**
 * 默认请求完成处理
 * @param xhr
 * @param textStatus 一个描述成功请求类型的字符串
 */
common.compelteCallBack = function (xhr,textStatus) {
    $(".loading-container").addClass("loading-inactive");
    console.log("请求完成")
    console.log("responseText="+xhr.responseText);
    console.log("textStatus="+textStatus)
};

/**
 * 无数据返回操作通用处理，增，删，改 操作的响应处理
 * @param res 服务器返回数据
 * @param optName 操作名称，对应common.optName内的参数
 * @param redrectUrl  操作成功指定跳转页面，无此参数则刷新当前页面
 */
common.noDataResponse = function (res,optName,redrectUrl) {
    $(".loading-container").addClass("loading-inactive");
    var resData = JSON.parse(res.responseText);
    //提交完成返回处理
    console.log("提交完成返回处理");
    console.log(res.responseText);

    if(resData.code == common.code.RESPONSE_CODE_SUCCESS) {
        bootbox.dialog({
            title:'操作提示',
            message: optName + common.msg.RESPONSE_MSG_SUCCESS,
            buttons: {
                success:{
                    label:'确定',
                    className:'',
                    callback:function () {
                        if(redrectUrl){
                            location.href = location.origin +'/'+ redrectUrl;
                        }else {
                            location.href = location.href;
                        }
                    }
                },
               // cancel:{ label:'取消', className:'', callback:function () {  /*取消操作*/ } },
            }
        });
    }else{
        bootbox.dialog({
            title:'操作提示',
            message: optName + common.msg.RESPONSE_MSG_FAILE,
            buttons: {
                success:{ label:'确定', className:'', callback:function () { /*location.href = location.href;*/ } },
               // cancel:{ label:'取消', className:'', callback:function () {  /*取消操作*/ } },
            }
        });
    }
};

/**
 * 转换成树结构
 * @param data 要转换的数组对象
 * @param parentId  父ID
 * @returns {any[]}  返回多级子对象数组（树形）
 */
common.util.covert2TreeJSON = function (data,parentId) {
    var tree = new Array();
    var len = data.length;
    for(var i = 0 ; i < len ; i++ ){
        var item = data[i];
        if(item.parentId == parentId){
            var children = common.util.covert2TreeJSON(data,item.id);
            if(children && children.length>0) {
                item.children = children;
                item.spread = true;//节点为展开状态
            }
            tree.push(item);
        }
    }
    return tree;
};

common.util.getHrefParam = function () {
    var search  = location.search;
    if(!search){
        return false;
    }
    search = search.substring(1);
    var sx = search.split("&");
    var len = sx.length;
    var p = {};
    for(var i=0;i<len;i++){
        var item = sx[i].split("=");
        p[item[0]] = item[1];
    }
    return p;
};

common.util.findOrgNameFromSession = function (id) {
    var orgs = JSON.parse(sessionStorage.getItem(common.session.key.orgData));
    var len = orgs.length;
    for(var i=0 ;i<len ; i++ ){
        var org = orgs[i];
        if(org.id==id){
            return org.name;
        }
    }
};

