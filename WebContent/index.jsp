<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>VB资源平台</title>
<%@ page import="com.reg.bean.Logon" %>
<link rel="stylesheet" type="text/css" href="styles.css">
<link rel="stylesheet" href="slider.css" type="text/css" media="screen" />
<script type="text/javascript" src="scripts/jquery-1.6.4.min.js"></script>
</head>

<body>
<div id="head">
  <div id="logo">
    <img src="img/logo.png" width="200" height="130"/>
  </div>
  <div id="login">
     <a href="#LoginForm"><img src="img/login.png" onmouseover="this.src='img/loginh.png'" onmouseout="this.src='img/loginh.png'" onmousedown="this.src='img/logina.png'"/></a>
     <div id="LoginForm" class="form">
       <a href="#"><img src="img/loginX.png" style="float:right;"/></a>
       <label>用户名</label><br />
       <input name="$TextBoxUserName" type="text" id="TextBoxUserName" class="inputText" value="username" onfocus="if (this.value==this.defaultValue) this.value='';" onblur="if (this.value=='') this.value=this.defaultValue;" /><br />
       <label>密码</label><br />
       <input name="$TextBoxPassword" type="password" id="TextBoxPassword" class="inputText" onfocus="if (this.value==this.defaultValue) this.value='';" onblur="if (this.value=='') this.value=this.defaultValue;" /><br />
<input src="img/loginbtnl.png" name="$ButtonLogin" type="image" id="ButtonLogin" class="inputButton" onmouseover="this.src='img/loginbtnl2.png'" onmouseout="this.src='img/loginbtnl.png'" value="submit"  />
</div>
  <script type="text/javascript">
  $(document).ready(function(){
	  $("#login a").click(function(){
		  $("#LoginForm").show();
		  	  return false;
	  });
	  $("#LoginForm a").click(function(){
		  $("#LoginForm").hide();
		  	  return false;
	  });
  });
</script>
  </div>
  <div id="nav">
    <ul id="mainlist">
      <li style="padding-left:none;"><a href="#">课程简介</a></li>
      <li id="jc"><a href="#sub1">网络教材</a>
        <ul id="sub1" class="sublist">
          <li><a href="#">电子教材</a></li>
          <li><a href="#">配套课件</a></li>
          <li><a href="#">教材源码</a></li>
          <li><a href="#">习题与答案</a></li>
        </ul>
      </li>
      <li><a href="#">作品展示</a></li>
      <li id="tz"><a href="#sub2">拓展学习</a>
        <ul id="sub2" class="sublist">
          <li><a href="#">难点热点</a></li>
          <li><a href="#">发展方向</a></li>
        </ul>
      </li>
      <li><a href="#">概念汇总</a></li>
      <li><a href="#">FAQ</a></li>
      <li><a href="#">考试系统</a></li>
      <li style="border:none;"><a href="#">答疑系统</a></li>
    </ul>
  </div>
<script type="text/javascript">
  $(document).ready(function(){
	  $("#jc a").click(function(){
		  var $this= $(this),
				$parent = $this.parent(),
				$next = $this.next("ul"),
				_idx = $parent.index();//取得索引
		  if($next.length>0){
				if($next.is(":visible")){//判斷顯示與否
					$next.slideUp();
				}else{
					//先將父層兄弟的ul標籤關閉
					$parent.siblings().find("ul").slideUp();
					$next.slideDown();
				}
				//關閉連結
				return false;
			}
	  });
  });
  $(document).ready(function(){
	  $("#tz a").click(function(){
		  var $this= $(this),
				$parent = $this.parent(),
				$next = $this.next("ul"),
				_idx = $parent.index();//取得索引
		  if($next.length>0){
				if($next.is(":visible")){//判斷顯示與否
					$next.slideUp();
				}else{
					//先將父層兄弟的ul標籤關閉
					$parent.siblings().find("ul").slideUp();
					$next.slideDown();
				}
				//關閉連結
				return false;
			}
	  });
  });
</script>

</div>
<div id="body">
  <div id="content1">
    <div id="album">
    <script type="text/javascript" src="scripts/jquery.nivo.slider.pack.js"></script>
    <script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
    </script>
    <div id="slider" class="nivoSlider">
       <img src="img/visual_basic_73847.png" alt="" />
       <img src="img/STATISTICA_Visual_Basic_program.png" alt="" title="" />
       <img src="img/courses_vb20082.png" alt="" data-transition="slideInLeft" />
       
    </div>
    </div>
    <div id="overview">
      <img src="img/intro.png" />
    </div>
  </div>
  <div id="content2">
    <div id="left-bar">
      <div class="btn">
      <a href="#"><img src="img/answerb.png"/></a>
      </div>
      <div class="btn">
      <a href="#"><img src="img/examb.png"/></a>
      </div>
      <div class="btn">
      <a href="#"><img src="img/faqb.png"/></a>
      </div>
      <div class="btn">
      <a href="#"><img src="img/dicb.png"/></a>
      </div>
    </div>
    <div id="teacher">
      <img src="img/t-icon.png" style="margin:0 0 5px 0;"/>
      <div style="width:120px; margin:0 auto;">
        <img src="img/photo.png"/>
      </div>
        <p>在这里写老师的介绍</p>
    </div>
    <div id="resources">
      <div id="ebook">
        <img src="img/eb-icon.png"/>
        <a href="#"><img src="img/more2.png" style="float:right; margin: 15px 40px 0 0;" /></a>
        <ul>
          <li><a href="#">1.1　程序设计语言</a></li>
          <li><a href="#">1.2　VB发展过程</a></li>
          <li><a href="#">1.3　VB的版本</a></li>
          <li><a href="#">1.4　VB的特点</a></li>
        </ul>
      </div>
      <div id="extra">
        <img src="img/extra-icon.png" />
        <a href="#"><img src="img/more2.png" style="float:right; margin: 15px 40px 0 0;" /></a>
      </div>
    </div>
  </div>
</div>
<div id="foot">
</div>
</body>
</html>
