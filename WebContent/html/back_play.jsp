<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>top</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
    <link href="../js/bstable/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="../js/bstable/css/bootstrap-table.css" rel="stylesheet" type="text/css">




<style type="text/css">

/* 隔行样式 */
#table1 tr:nth-child(even){  
 background: #c3dde0;  

 } 
/*  首行样式 */
#table1 th{ 
 background: #c3dde0;  
 color:red；
 

} 


</style>
</head>

<body >
<div class="div_find">
    <p class="find_p">
       

        <label class="label_width">起始日期：</label>
        <input type="text" class="find_input" id="starTime" />
        <label class="label_width">终止日期：</label>
        <input type="text" class="find_input" id="endTime" />

        <label class="label_width">上传区域：</label>
        <select class="find_input">
            <option>全部</option>
            <option>区域A</option>
            <option>区域B</option>
            <option>区域C</option>
        </select>

        

        <input type="button" value="查找" class="find_but" id="searchBUT"/>


        <span class="find_span"><i class="i_open"></i> <a href="#" >展开</a> </span>
        <span class="find_span1"><i class="i_close"></i> <a href="#" >收起</a> </span>
    </p>

    <p class="find_p" id="open" style="display: none">

        <label class="label_width">视频编号：</label>
        <input type="text" class="find_input" />
    
        <label class="label_width">摄像头编号：</label>
        <input type="text" class="find_input" />

    </p>
</div>
<div class="div_table" style="display :none;">
    <p><span class="table_span"><i class="i_table"></i> <a href="#">下载</a> </span></p>
    <p>
        <table  id="table1" class="table_style" style="margin: 0 auto"></table>
    </p>
</div>


<script src="../js/jquery.js" ></script>
<script src="../js/date/js/laydate.js"></script>
<script src="../js/bstable/js/bootstrap.min.js"></script>
<script src="../js/bstable/js/bootstrap-table.js"></script>
<script src="../js/bstable/js/bootstrap-table-zh-CN.min.js"></script>

<script>
    !function () {
        laydate.skin('danlan');
        laydate({ elem: '#starTime' });
        laydate({ elem: '#endTime' });
    }();
    $(function () {
        $(".find_span").click(function () {
            $("#open").show();
            $(this).hide();
            $(".find_span1").show();

        })
        $(".find_span1").click(function () {
            $("#open").hide();
            $(this).hide();
            $(".find_span").show();

        })
        $("#searchBUT").click(function () {
            $(".div_table").show();

        })

    })
</script>
<script type="text/javascript">
    $(function () {

        $('#table1').bootstrapTable('destroy');
        $('#table1').bootstrapTable({
            method: "get",
            striped: true,
            singleSelect: false,
            url: "../json/warning.json",
            dataType: "json",
            pagination: true, //分页
            pageSize: 10,
            pageNumber: 1,
            search: false, //显示搜索框
            contentType: "application/json;charset=UTF-8",
            queryParams: null,
            columns: [
                {
                    checkbox: "true",
                    field: 'check',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: "编号",
                    field: 'id',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '警报类型',
                    field: 'type',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '是否救援',
                    field: 'rescue',
                    align: 'center'
                },
                {
                    title: '时间',
                    field: 'time',
                    align: 'center'
                },
                {
                    title: '原因',
                    field: 'reason',
                    align: 'center'
                },
                {
                    title: '区域',
                    field: 'area',
                    align: 'center'
                },
                {
                    title: '操作',
                    field: 'opear',
                    align: 'center',
                    formatter: function (value, row) {
                        var e = '<a  href="#" title="回放" onclick="handleEvent(\'' + row.id + '\')"><img src="../img/look.png"/> </a> ';
                        var d = '<a href="#" title="下载" onclick="edit(\'' + row.id + '\')"><img src="../img/9.png" /></a> ';

                        return e + d ;
                    }
                }
            ],
            onLoadSuccess: function () {
            },
            onLoadError: function () {
                showTips("数据加载失败！");
            },
            onDblClickRow: function (row, $element) {
                var id = row.ID;
                EditViewById(id, 'view');
            }
        });
    })
    function edits(id){

        $(".input_div2").show();

    }
</script>
</body>
</html>
