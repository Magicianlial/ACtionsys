<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html"; charset="utf-8" />
    <title></title>
    <link href="../js/bstable/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="../js/bstable/css/bootstrap-table.css" rel="stylesheet" type="text/css">
    <link href="../css/table.css" rel="stylesheet" type="text/css" />
    <link href="../css/jquery.treetable.css" rel="stylesheet" type="text/css">
    <link href="../css/jquery.treetable.theme.default.css" rel="stylesheet" type="text/css">

</head>
<body style="background-color: #ecf0f5;font-family: 微软雅黑;color: #475059;min-width: 1000px;overflow: auto">
<div class="notice_main">
    <h6>摄像头添加详情</h6>
    <div style="border-bottom: 1px #ccc solid;padding-bottom: 8px">
        <p style="line-height: 24px;font-size: 14px;padding: 4px 0 0 36px ;color:#bb8940;background-image: url(img/ts_03.png);background-repeat: no-repeat;background-position: 10px 8px;font-weight: bold">温馨提示</p>
        <ul class="ts">

            <li><span>*</span>该页面主要显示的是设置内页面。</li>
        </ul>
    </div>
    <div class="goods_main" >
        <div><label>摄像头编号：</label><input type="text"  class="goods_input"></div>
        
        <label class="label_width">区域：</label>
        <select class="find_input">
            <option>全部</option>
            <option>区域A</option>
            <option>区域B</option>
            <option>区域C</option>
        </select>

        <div class="clear"></div>
        <div style="font-size: 12px"><label>安装日期：</label><input type="text" class="goods_input1" style="margin-left: 0" id="starTime"></div>
        <div><label>生产厂商：</label><input type="text" class="goods_input"></div>
        <div><div class="l_left"><label>说明：</label></div><div class="l_left"><textarea></textarea></div></div>
        <div class="clear"></div>
        <div class="good_btn" id="addBUT"><button>配置</button></div>
    </div>
</div>

<script src="../js/jquery.js" ></script>
<script src="../js/date/js/laydate.js"></script>
<script>
    !function(){
        laydate.skin('danlan');
        laydate({elem: '#starTime'});
        laydate({elem: '#endTime'});
    }();
    $(function(){
        $(".pic_btn").each(function(){
            $(this).click(function(){
                $(this).parent().parent().hide();
            })
        })
        $("#addBUT").click(function(){
      	  
        	alert("摄像头配置成功！");
          	

          });
    })
</script>


  

</body>
</html>