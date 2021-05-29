<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>top</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />



<style type="text/css">




</style>
</head>

<body onload="change()">

<div class="top">
<div class="top_logo" style="">
    Smart Camera</div>
    <div class="top_right"><ul>
        <li><i class="i_video"></i> <a href="video.jsp" target="iframe_con">实时监控</a> </li>
        <li><i class="i_play"></i><a href="back_play.jsp" target="iframe_con">录像回放</a> </li>
        <!--<li><i class="i_alam"></i><a href="back_play.jsp" target="iframe_con">报警管理</a> </li>-->
        <!--<li><i class="i_map"></i> <a href="map.jsp" target="iframe_con">电子地图</a> </li>-->
        <!--<li><i class="i_lgo"></i> <a href="log.jsp" target="iframe_con">日志管理</a> </li>-->
        <li><i class="i_set"></i> <a href="setting.jsp" target="iframe_con">系统设置</a> </li>
    </ul></div>
</div>
<div class="div_iframe">
    <iframe src="video.jsp" name="iframe_con" title="test" frameborder="0" width="100%" height="100%" scrolling="auto" allowtransparency="true" style="background-color:transparent; z-index:1;"> </iframe>
</div>
<div class="div_foot">
    <span class="foot_left"></span>
    <span class="foot_right"></span>
</div>



<script src="../js/jquery.js" ></script>
<script>
    function change() {
        var height01 = $(window).height();
        $(".div_iframe").css('height', height01 - 122+"px");
    }
</script>
</body>
</html>