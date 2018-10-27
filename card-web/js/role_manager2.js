//角色管理脚本

var org = {
    page:1,
    pageSize:30,
    searchUrl:common.url.web_root + common.url.model.role + common.url.opt.search,
};//角色全局对象
/**
 * 分页查询
 * @param param
 * @returns {boolean}
 */
function searchOrg(param) {
    // param = {
    //     page:1,
    //     pageSize:30,
    //     searchKey:''
    // };
    if(!param){return false;}

    if(!param.page){
        param.page = org.page;
    }
    if(!param.pageSize){
        param.pageSize = org.pageSize;
    }

    var option = {
        url:org.searchUrl,
        data:param,
        successCallBack:searchSuccess
    };
    common.httpSend(option);

}

function searchSuccess(resData) {

}




















    //Datatable Initiating
    var oTable = $('#editabledatatable').dataTable({
        ajax:{
            url:common.url.web_root + common.url.model.role + common.url.opt.search,
            data:function () {
                //参数 参考 http://www.datatables.club/reference/option/ajax.data.html
                return {
                    id:'fwafweofjp',
                    page:1,
                    pageSize:30,
                    searchKey:''
                };
            },
            dataSrc:function (resData) {
                //处理返回值，再交给datatable插件处理
                return JSON.parse(resData.data);//正确返回时
            }
        },
        "aLengthMenu": [
            [5, 15, 20, 100, -1],
            [5, 15, 20, 100, "All"]
        ],
        "iDisplayLength": 15,
        "sPaginationType": "bootstrap",
        "sDom": "Tflt<'row DTTTFooter'<'col-sm-6'i><'col-sm-6'p>>",
        "oTableTools": {
            "aButtons": [
                // "copy",
                // "print",
                {
                    "sExtends": "text",
                    "sButtonText": "新增 <i class=\"glyphicon glyphicon-plus\"></i>",
                    // "aButtons": ["csv", "xls", "pdf"]
                },
                {
                    "sExtends": "text",
                    "sButtonText": "导出 <i class=\"glyphicon glyphicon-share-alt\"></i>",
                    // "aButtons": ["csv", "xls", "pdf"]
                }],
            // "sSwfPath": "assets/swf/copy_csv_xls_pdf.swf"
        },
        "language": {
            "search": "",
            "sLengthMenu": "_MENU_",
            "oPaginate": {
                "sPrevious": "上一页",
                "sNext": "下一页"
            },
            "info":"当前第 _START_ 到 _END_ 条记录， 共 _TOTAL_ 条记录 "
        },
        "paging":true,
        // "pagingType": "full_numbers",
        "processing": true,//显示处理状态
        "aoColumns": [
            null,
            null,
            null,
            null,
            { "bSortable": false }
        ]
    });

    var isEditing = null;

    //Add New Row
    $('#ToolTables_editabledatatable_0').click(function (e) {
        e.preventDefault();
        var aiNew = oTable.fnAddData(['', '', '', '',
            '<a href="#" class="btn btn-success btn-xs save"><i class="fa fa-edit"></i> Save</a> <a href="#" class="btn btn-warning btn-xs cancel"><i class="fa fa-times"></i> Cancel</a>'
        ]);
        var nRow = oTable.fnGetNodes(aiNew[0]);
        editRow(oTable, nRow);
        isEditing = nRow;
    });

    //Delete an Existing Row
    $('#editabledatatable').on("click", 'a.delete', function (e) {
        e.preventDefault();

        if (confirm("Are You Sure To Delete This Row?") == false) {
            return;
        }

        var nRow = $(this).parents('tr')[0];
        oTable.fnDeleteRow(nRow);
        alert("Row Has Been Deleted!");
    });

    //Cancel Editing or Adding a Row
    $('#editabledatatable').on("click", 'a.cancel', function (e) {
        e.preventDefault();
        if ($(this).attr("data-mode") == "new") {
            var nRow = $(this).parents('tr')[0];
            oTable.fnDeleteRow(nRow);
        } else {
            restoreRow(oTable, isEditing);
            isEditing = null;
        }
    });

    //Edit A Row
    $('#editabledatatable').on("click", 'a.edit', function (e) {
        e.preventDefault();

        var nRow = $(this).parents('tr')[0];

        if (isEditing !== null && isEditing != nRow) {
            restoreRow(oTable, isEditing);
            editRow(oTable, nRow);
            isEditing = nRow;
        } else {
            editRow(oTable, nRow);
            isEditing = nRow;
        }
    });

    //Save an Editing Row
    $('#editabledatatable').on("click", 'a.save', function (e) {
        e.preventDefault();
        if (this.innerHTML.indexOf("Save") >= 0) {
            saveRow(oTable, isEditing);
            isEditing = null;
            //Some Code to Highlight Updated Row
        }
    });


    function restoreRow(oTable, nRow) {
        var aData = oTable.fnGetData(nRow);
        var jqTds = $('>td', nRow);

        for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
            oTable.fnUpdate(aData[i], nRow, i, false);
        }

        oTable.fnDraw();
    }

    function editRow(oTable, nRow) {
        var aData = oTable.fnGetData(nRow);
        var jqTds = $('>td', nRow);
        jqTds[0].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[0] + '">';
        jqTds[1].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[1] + '">';
        jqTds[2].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[2] + '">';
        jqTds[3].innerHTML = '<input type="text" class="form-control input-small" value="' + aData[3] + '">';
        jqTds[4].innerHTML = '<a href="#" class="btn btn-success btn-xs save"><i class="fa fa-save"></i> Save</a> <a href="#" class="btn btn-warning btn-xs cancel"><i class="fa fa-times"></i> Cancel</a>';
    }

    function saveRow(oTable, nRow) {
        var jqInputs = $('input', nRow);
        oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
        oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
        oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
        oTable.fnUpdate(jqInputs[3].value, nRow, 3, false);
        oTable.fnUpdate('<a href="#" class="btn btn-info btn-xs edit"><i class="fa fa-edit"></i> Edit</a> <a href="#" class="btn btn-danger btn-xs delete"><i class="fa fa-trash-o"></i> Delete</a>', nRow, 4, false);
        oTable.fnDraw();
    }

    function cancelEditRow(oTable, nRow) {
        var jqInputs = $('input', nRow);
        oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
        oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
        oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
        oTable.fnUpdate(jqInputs[3].value, nRow, 3, false);
        oTable.fnUpdate('<a href="#" class="btn btn-info btn-xs edit"><i class="fa fa-edit"></i> Edit</a> <a href="#" class="btn btn-danger btn-xs delete"><i class="fa fa-trash-o"></i> Delete</a>', nRow, 4, false);
        oTable.fnDraw();
    }



    /*
    $('#role_list').dataTable( {
        "data": [
            {
                "name":       "Tiger Nixon",
                "position":   "System Architect",
                "salary":     "$3,120",
                "start_date": "2011/04/25",
                "office":     "Edinburgh",
                "extn":       5421
            },
            {
                "name": "Garrett Winters",
                "position": "Director",
                "salary": "5300",
                "start_date": "2011/07/25",
                "office": "Edinburgh",
                "extn": "8422"
            },
            // ...
        ],
        "columns": [
            { "data": "name" },
            { "data": "position" },
            { "data": "office" },
            { "data": "extn" },
            { "data": "start_date" },
            { "data": "salary" }
        ]
    } );

    */