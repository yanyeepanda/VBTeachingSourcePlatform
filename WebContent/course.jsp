<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>课程简介</title>
<link rel="stylesheet" type="text/css" href="styles.css"/>
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
       <input name="$TextBoxUserName" type="text" id="TextBoxUserName" class="inputText" value="" onfocus="if (this.value==this.defaultValue) this.value='';" onblur="if (this.value=='') this.value=this.defaultValue;" /><br />
       <label>密码</label><br />
       <input name="$TextBoxPassword" type="password" id="TextBoxPassword" class="inputText" onfocus="if (this.value==this.defaultValue) this.value='';" onblur="if (this.value=='') this.value=this.defaultValue;" /><br />
<input src="img/loginbtnl.png" name="$ButtonLogin" type="image" id="ButtonLogin" class="inputButton" onmouseover="this.src='img/loginbtnl2.png'" onmouseout="this.src='img/loginbtnl.png'" value="submit" />
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
      <li style="padding-left:none;"><a href="course.jsp">课程简介</a></li>
      <li id="jc"><a href="#sub1">网络教材</a>
        <ul id="sub1" class="sublist">
          <li><a href="pdf/viewer.html">电子教材</a></li>
          <li><a href="ppt.jsp">配套课件</a></li>
          <li><a href="code.jsp">教材源码</a></li>
          <li><a href="homework.jsp">习题与答案</a></li>
        </ul>
      </li>
      <li><a href="product.jsp">作品展示</a></li>
      <li id="tz"><a href="#sub2">拓展学习</a>
        <ul id="sub2" class="sublist">
          <li><a href="hot.jsp">难点热点</a></li>
          <li><a href="develop.jsp">发展方向</a></li>
        </ul>
      </li>
      <li><a href="notepad.jsp">概念汇总</a></li>
      <li><a href="faq.jsp">FAQ</a></li>
      <li><a href="exam.jsp">考试系统</a></li>
      <li style="border:none;"><a href="answer.jsp">答疑系统</a></li>
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

    <div id="overview">
      <img src="img/intro.png"  />
    </div>
 </div>
  
  
<div id="foot">
</div>
</body>
</html>