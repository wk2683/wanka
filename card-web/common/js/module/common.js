var common = {};//公共体
common.web_logo = '../common/image/logo.png';

common.url = {
    web_root:'http://localhost:8002/',
    model:{
        org:'org/',
        role:'role/'
    },
    opt:{
        add:'add',
        delete:'delete',
        get:'get',
        update:'update',
        search:'search'
    }
};

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
common.opt = {
    CONTROLLER_OPT_ADD:"新增",
    CONTROLLER_OPT_DELETE:"删除",
    CONTROLLER_OPT_UPDATE:"更新",
    CONTROLLER_OPT_GET:"查询",
    CONTROLLER_OPT_SEARCH:"搜索"
};








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
                        '                                <a class="wave in dropdown-toggle" data-toggle="dropdown" title="Help" href="#">\n' +
                        '                                    <i class="icon fa fa-envelope"></i>\n' +
                        '                                    <span class="badge">3</span>\n' +
                        '                                </a>\n' +
                        '                                <!--Messages Dropdown-->\n' +
                        '                                <ul class="pull-right dropdown-menu dropdown-arrow dropdown-messages">\n' +
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
                        '                                <!--/Messages Dropdown-->\n' +
                        '                            </li>\n' +
                        '\n' +
                        '                            <li>\n' +
                        '                                <a class="dropdown-toggle" data-toggle="dropdown" title="Tasks" href="#">\n' +
                        '                                    <i class="icon fa fa-tasks"></i>\n' +
                        '                                    <span class="badge">4</span>\n' +
                        '                                </a>\n' +
                        '                                <!--Tasks Dropdown-->\n' +
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
                        '                                <!--/Tasks Dropdown-->\n' +
                        '                            </li>\n' +
                        '                            <li>\n' +
                        '                                <a class="login-area dropdown-toggle" data-toggle="dropdown">\n' +
                        '                                    <div class="avatar" title="View your public profile">\n' +
                        '                                        <img src="assets/img/avatars/adam-jansen.jpg">\n' +
                        '                                    </div>\n' +
                        '                                    <section>\n' +
                        '                                        <h2><span class="profile"><span>David Stevenson</span></span></h2>\n' +
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

    var navData = [
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
                    name:"登录页面",
                    pid:"1",
                    type:"page",
                    url:"login.html"
                },
                {
                    id:"102",
                    name:"注册页面",
                    pid:"1",
                    type:"page",
                    url:"register.html"
                },
            ]
        }
    ];
    var meun = common.renderLeftMeun(navData);
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
 * @param options 必填的 {url,successCallBack}
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
    options.data.userId = 'uesr_id';//从sessionStage里提取
    $.ajax({
        url:options.url,
        type:options.type,
        data:options.data,
        dataType:options.dataType,
        beforeSend:common.defaultBeforeSend,//发送前处理
        dataFilter:common.defaultDataFilter,//响应前处理
        // success:options.successCallBack,//成功返回处理
        // error:options.errorCallBack,//返回失败处理
        complete:options.successCallBack,//请求完成处理
    });

}
/**
 * 默认发送前处理
 * @param xhr
 */
common.defaultBeforeSend = function (xhr) {
    console.log("请求之前")
};

/**
 *  请求成功回调
 * @param data data是Ajax返回的原始数据
 * @param type type是调用jQuery.ajax时提供的dataType参数
 */
common.defaultDataFilter = function (data, type) {
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
    console.log("请求失败");
    console.log("responseText="+xhr.responseText);
    console.log("status="+status);
    console.log("ex="+ex);
    bootbox.alert(
        '系统异常',
        function () {
            console.log(response.msg);
        });
};
/**
 * 默认请求完成处理
 * @param xhr
 * @param textStatus 一个描述成功请求类型的字符串
 */
common.compelteCallBack = function (xhr,textStatus) {
    console.log("请求完成")
    console.log("responseText="+xhr.responseText);
    console.log("textStatus="+textStatus)
};

