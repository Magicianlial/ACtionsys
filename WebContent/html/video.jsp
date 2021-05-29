<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<link href="../css/style.css" rel="stylesheet" type="text/css" />
<link href="../css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css" />



</head>
<body>
<div class="allBox">
    <div class="video_left">
        <div class="right_up01">
            <div class="right_up">

                <p><input type="text" placeholder="输入名称或编号" class="input_video"/> </p>
                <div class="right_tree"> <ul id="tree" class="ztree"   ></ul></div>
            </div>

        </div>
        <div class="right_control">
            <div class="control01">
                <input type="button" value="识别监控" class="but3" id="contb1"/> 
                <!--<input type="button" value="警报处理" class="but01" id="contb2"/> 
                <input type="button" value="系统开关" class="but01" id="contb3"/>-->
            </div>
            
            <div class="control02" id="contr1" style="display :none;"> 
	            <label class="label_width">监控1：</label><label class="label_width">NULL</label><br/>
	            <label class="label_width">监控2：</label><label class="label_width">NULL</label><br/>
            </div>
            <div class="control02" id="contr2" style="display :none;"> 
	            <label class="label_width">监控1：</label><label class="label_width">行走</label><br/>
	            <label class="label_width">监控2：</label><label class="label_width">跳跃</label><br/>
            </div>
            
            <div class="menu_left_switch">
			<div class="switch_label">
				系统开关
			</div>
			<div class="toggle-button-wrapper">
			    <input type="checkbox" id="toggle-button1" class="toggle-button" name="SYSswitch" onchange="ConnectBotton()">
			    <label for="toggle-button1" class="button-label" >
			        <span class="circle"></span>
			        <span class="text on">ON</span>
			        <span class="text off">OFF</span>
			    </label>
			</div>
		</div>
      
        	
        </div>
    </div>
    <div class="video_right" style="display :none;">
        <div class="video_con"  >
            
            <video  controls preload="none" width="100%" height="100%"  data-setup="{}" autoplay="autoplay" loop="loop">
                <source src="..//video//3.mp4" type='video/mp4' />
            </video>
        </div>
        <div class="video_con" >
            <video  controls preload="none" width="100%" height="100%"  data-setup="{}" autoplay="autoplay" loop="loop">
                <source src="..//video//1.mp4" type='video/mp4' />
            </video>
        </div>
        

    </div>
</div>


<script src="../js/jquery.js" ></script>
<script src="../js/jquery.ztree.core-3.5.js" ></script>
<script src="../js/jquery.ztree.excheck-3.5.js" ></script>
<script src="../js/ztree_d.js" ></script>
<script type="text/javascript">

$(document).ready(function(){

  $("#contb1").click(function(){
	  

  	$("#contr1").show();
  	$("#contr2").hide();
  	$("#contr3").hide();
  	$("#contb1").attr("class","but3");
  	$("#contb2").attr("class","but01");
  	$("#contb3").attr("class","but01");

  });
  $("#contb2").click(function(){
	  

	  	$("#contr2").show();
	  	$("#contr1").hide();
	  	$("#contr3").hide();
	  	$("#contb1").attr("class","but01");
	  	$("#contb2").attr("class","but3");
	  	$("#contb3").attr("class","but01");

	  });
  $("#contb3").click(function(){
	  

	  	$("#contr3").show();
	  	$("#contr1").hide();
	  	$("#contr2").hide();
	  	$("#contb1").attr("class","but01");
	  	$("#contb2").attr("class","but01");
	  	$("#contb3").attr("class","but3");

	  });
  

});
var path = request.getContextPath();
var basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
function ConnectBotton() {
	if($("#toggle-button1").is(':checked')==true){
		setTimeout(function () {
			$(".video_right").show();
			$("#contr1").show();
			
		}, 2000);
		setTimeout(function () {
			$("#contr1").hide();
			$("#contr2").show();
			
		}, 4000);
		
	}else{
		$("#contr2").hide();
		$(".video_right").hide();
	}
}
// function ConnectBotton() {
// 	if($("#toggle-button1").is(':checked')==true){
// 		$.ajax({
// 		       type:"POST",
<%-- 		       url:"<%=basePath%>"+"connectServlet", --%>
// 		       data: { state: "on" },
// 		       statusCode: {404: function() {
// 		           alert('page not found'); }
// 		       },    
// 		       success:function(json){
// 		    	 //  $("#sp").html(json);
// 		 	       }
// 		       });
// 	}else{
// 		$.ajax({
// 		       type:"POST",
<%-- 		       url:"<%=basePath%>"+"connectServlet", --%>
// 		       data: { state: "off" },
// 		       statusCode: {404: function() {
// 		           alert('page not found'); }
// 		       },    
// 		       success:function(json){
// 		    	 //  $("#sp").html(json);
// 		 	       }
// 		       });
// 	}
// }
function firm()
{
   if(confirm("监控1（区域A）：发现人员走动！是否报警？"))
    {
	   setTimeout(3000);
    }
    else
    {
        alert("忽视相应");
    }
}
</script>
</body>
</html>