﻿//PBlog2 公用JS代码
//Author:PuterJam

//查找网页内宽度太大的图片进行缩放以及PNG纠正
 function ReImgSize(){
  for (i=0;i<document.images.length;i++)
   {
   if (document.all){
	if (document.images[i].width>500)
	 {
       document.images[i].width="500"
       document.images[i].outerHTML='<a href="'+document.images[i].src+'" target="_blank" title="在新窗口打开图片">'+document.images[i].outerHTML+'</a>'
  	 }
   }
  else{
	if (document.images[i].width>400) {
	  document.images[i].title="在新窗口打开图片"
	  document.images[i].style.cursor="pointer"
	  document.images[i].onclick=function(e){window.open(this.src)}
	}
  }
  }
 }

//AccessKey 转换For IE Design By PuterJam
  var NKey=new Array()
  var KeyCode=new Array()
  var KeyInit=false
//======== keyCode ============
  KeyCode["1"]=49
  KeyCode["2"]=50
  KeyCode["3"]=51
  KeyCode["["]=219
  KeyCode["]"]=221
  KeyCode[","]=188
  KeyCode["."]=190
  var EKey="abcdefghijklmnopqrstuwvxyz"
  for (i=0;i<26;i++){
    KeyCode[EKey.substr(i,1)]=65+i
  }
  
  function PressKey(){
	 if (document.all) {
	   for (i=0;i<NKey.length;i++){
		   if (window.event.altKey && window.event.keyCode==NKey[i].Code) {NKey[i].Object.blur();NKey[i].Object.click()}
	   }

	}
  }
  
  function AccessKey(Code,Object){
   this.Code=Code
   this.Object=Object
  }


  function initAccessKey(){
	 if (document.all && !KeyInit) {
	    for (i=0;i<document.links.length;i++){
	      if (document.links[i].accessKey) {
	        NKey[NKey.length]=new AccessKey(KeyCode[document.links[i].accessKey.toLowerCase()],document.links[i])
	      }
	    }
	 }
	 KeyInit=true
  }

//初始化JS代码
function initJS(){
	ReImgSize() //自动缩放代码 
	initAccessKey()  //转换AccessKey For IE
}

//让Mozilla支持innerText
try{
	HTMLElement.prototype.__defineGetter__
	(
	"innerText",
	function ()
	{
		var anyString = "";

		var childS = this.childNodes;
			for(var i=0; i<childS.length; i++)
			{
				if(childS[i].nodeType==1)
				anyString += childS[i].tagName=="BR" ? '\n' : childS[i].innerText;
				else if(childS[i].nodeType==3)
				anyString += childS[i].nodeValue;
			}
			return anyString;
	}
	); 
}
catch(e){}

//判断是否是IE
function isIE(){
	if (navigator.appName!="Microsoft Internet Explorer") {return false}
	return true
}
//显示隐藏主题
function TopicShow(e,TopicID){
	 e.className=(e.className=="BttnC")?"BttnE":"BttnC"
	 document.getElementById(TopicID).style.display=(e.className=="BttnC")?"":"none"
	 ReImgSize()
}
//打开新窗口
function popnew(url,title,width,height){
    var w = 1024;
    var h = 768;

    if (document.all || document.layers){
        w = screen.availWidth;
        h = screen.availHeight;
    }

    var leftPos = (w/2-width/2);
    var topPos = (h/2.3-height/2.3);

    window.open(url,title,"width="+width+",height="+height+",top="+topPos+",left="+leftPos+",scrollbars=no,resizable=no,status=no")
}
//运行代码
function runEx(cod1)  {
	 cod=document.getElementById(cod1)
	  var code=cod.value;
	  if (code!=""){
		  var newwin=window.open('','','');  
		  newwin.opener = null 
		  newwin.document.write(code);  
		  newwin.document.close();
	}
}
//复制代码
function doCopy(ID) { 
	if (document.all){
		 textRange = document.getElementById(ID).createTextRange(); 
		 textRange.execCommand("Copy"); 
	}
	else{
		 alert("此功能只能在IE上有效")
	}
}
var MediaTemp=new Array()
function MediaShow(strType,strID,strURL,intWidth,intHeight)
{
	var tmpstr
	if (MediaTemp[strID]==undefined) MediaTemp[strID]=false; else MediaTemp[strID]=!MediaTemp[strID];
	if(MediaTemp[strID]){
			if ( document.all )	{
	         	document.getElementById(strID).outerHTML = '<div id="'+strID+'"></div>'
			}
			else
			{
	         	document.getElementById(strID).innerHTML = ''
			}

		document.images[strID+"_img"].src="images/mm_snd.gif" 		
		document.getElementById(strID+"_text").innerHTML="在线播放"	
	}else{
		document.images[strID+"_img"].src="images/mm_snd_stop.gif" 		
		document.getElementById(strID+"_text").innerHTML="关闭在线播放"
		switch(strType){
			case "swf":
				tmpstr='<div style="height:6px;overflow:hidden"></div><object codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="'+intWidth+'" height="'+intHeight+'"><param name="movie" value="'+strURL+'" /><param name="quality" value="high" /><param name="AllowScriptAccess" value="never" /><embed src="'+strURL+'" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="'+intWidth+'" height="'+intHeight+'" /></object>';
				break;
			case "wma":
				tmpstr='<div style="height:6px;overflow:hidden"></div><object classid="CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95"  id="MediaPlayer" width="450" height="70"><param name=""howStatusBar" value="-1"><param name="AutoStart" value="False"><param name="Filename" value="'+strURL+'"></object>';
				break;
			case "wmv":
				tmpstr='<div style="height:6px;overflow:hidden"></div><object classid="clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95" codebase="http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=6,0,02,902" type="application/x-oleobject" standby="Loading..." width="'+intWidth+'" height="'+intHeight+'"><param name="FileName" VALUE="'+strURL+'" /><param name="ShowStatusBar" value="-1" /><param name="AutoStart" value="true" /><embed type="application/x-mplayer2" pluginspage="http://www.microsoft.com/Windows/MediaPlayer/" src="'+strURL+'" autostart="true" width="'+intWidth+'" height="'+intHeight+'" /></object>';
				break;
			case "rm":
				tmpstr='<div style="height:6px;overflow:hidden"></div><object classid="clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA" width="'+intWidth+'" height="'+intHeight+'"><param name="SRC" value="'+strURL+'" /><param name="CONTROLS" VALUE="ImageWindow" /><param name="CONSOLE" value="one" /><param name="AUTOSTART" value="true" /><embed src="'+strURL+'" nojava="true" controls="ImageWindow" console="one" width="'+intWidth+'" height="'+intHeight+'"></object>'+
                '<br/><object classid="clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA" width="'+intWidth+'" height="32" /><param name="CONTROLS" value="StatusBar" /><param name="AUTOSTART" value="true" /><param name="CONSOLE" value="one" /><embed src="'+strURL+'" nojava="true" controls="StatusBar" console="one" width="'+intWidth+'" height="24" /></object>'+'<br /><object classid="clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA" width="'+intWidth+'" height="32" /><param name="CONTROLS" value="ControlPanel" /><param name="AUTOSTART" value="true" /><param name="CONSOLE" value="one" /><embed src="'+strURL+'" nojava="true" controls="ControlPanel" console="one" width="'+intWidth+'" height="24" autostart="true" loop="false" /></object>';
				break;
			case "ra":
				tmpstr='<div style="height:6px;overflow:hidden"></div><object classid="clsid:CFCDAA03-8BE4-11CF-B84B-0020AFBBCCFA" id="RAOCX" width="450" height="60"><param name="_ExtentX" value="6694"><param name="_ExtentY" value="1588"><param name="AUTOSTART" value="true"><param name="SHUFFLE" value="0"><param name="PREFETCH" value="0"><param name="NOLABELS" value="0"><param name="SRC" value="'+strURL+'"><param name="CONTROLS" value="StatusBar,ControlPanel"><param name="LOOP" value="0"><param name="NUMLOOP" value="0"><param name="CENTER" value="0"><param name="MAINTAINASPECT" value="0"><param name="BACKGROUNDCOLOR" value="#000000"><embed src="'+strURL+'" width="450" autostart="true" height="60"></embed></object>';
				break;
			case "qt":
				tmpstr='<div style="height:6px;overflow:hidden"></div><embed src="'+strURL+'" autoplay="true" loop="false" controller="true" playeveryframe="false" cache="false" scale="TOFIT" bgcolor="#000000" kioskmode="false" targetcache="false" pluginspage="http://www.apple.com/quicktime/" />';
		}
		document.getElementById(strID).innerHTML = tmpstr;
	}
		document.getElementById(strID+"_href").blur()
}

function Trim(TRIM_VALUE){
	if(TRIM_VALUE.length < 1){
		return"";
	}
	TRIM_VALUE = RTrim(TRIM_VALUE);
	TRIM_VALUE = LTrim(TRIM_VALUE);
	if(TRIM_VALUE==""){
		return "";
	}
	else{
		return TRIM_VALUE;
	}
} //End Function

function RTrim(VALUE){
	var w_space = String.fromCharCode(32);
	var v_length = VALUE.length;
	var strTemp = "";
	if(v_length < 0){
		return"";
	}
	var iTemp = v_length -1;

	while(iTemp > -1){
		if(VALUE.charAt(iTemp) == w_space){
		}
		else{
			strTemp = VALUE.substring(0,iTemp +1);
			break;
		}
		iTemp = iTemp-1;

	} //End While
	return strTemp;

} //End Function

function LTrim(VALUE){
	var w_space = String.fromCharCode(32);
	if(v_length < 1){
		return"";
	}
	var v_length = VALUE.length;
	var strTemp = "";
	var iTemp = 0;

	while(iTemp < v_length){
		if(VALUE.charAt(iTemp) == w_space){
			}
			else{
				strTemp = VALUE.substring(iTemp,v_length);
				break;
		}
		iTemp = iTemp + 1;
	} //End While
	return strTemp;
} //End Function


function CheckPost(){
  try{
	if (Trim(document.forms[0].title.value)=="") {
		 alert("标题不能为空,请写日志标题!")
		 document.forms[0].title.focus()
		 return false
		}
	}
  catch(e){}

  try{
    if (document.getElementById("P2").checked) {
    	if (!CheckDate(document.forms[0].PubTime.value)){
    	   alert("日期格式不正确!\n格式:yyyy-mm-dd hh:mm:ss")	
		   return false
    	}
    	else
    	{
	    	document.forms[0].PubTime.value=CheckDate(document.forms[0].PubTime.value)
    	}
    }
  }
  catch(e){}

  try{
   if (GetMessageLength()==0){
		 alert("内容不能为空!")
		 return false
   }
  }
  catch(e){
	if (Trim(document.forms[0].Message.value)=="") {
		 alert("内容不能为空!")
		 document.forms[0].Message.focus()
		 return false
	}
  }
   try{document.forms[0].SaveArticle.disabled=true}catch(e){}
   try{document.forms[0].SaveDraft.disabled=true}catch(e){}
   try{document.forms[0].ReturnButton.disabled=true}catch(e){}
   try{document.forms[0].CancelEdit.disabled=true}catch(e){e}
   try{document.forms[0].DelArticle.disabled=true}catch(e){}
return true
}

   function CheckDate(str){
        var reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})$/; 
        var r = str.match(reg); 
        if(r==null)return false; 
        var d= new Date(r[1],r[3]-1,r[4],r[5],r[6],r[7]); 
        return (d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds());
   }


function GetMessageLength()
{
	var oEditor = FCKeditorAPI.GetInstance('Message') ;
	var oDOM = oEditor.EditorDocument ;
	var iLength ;

	if ( document.all )		// If Internet Explorer.
	{
		iLength = oDOM.body.innerText.length ;
	}
	else					// If Gecko.
	{
		var r = oDOM.createRange() ;
		r.selectNodeContents( oDOM.body ) ;
		iLength = r.toString().length ;
	}
//	oEditor.InsertHtml('')
return iLength
}	

function SetFont(size){
	document.getElementById("logPanel").style.fontSize=size
}
//引用
function addQuote(usr,content){
	try{
	if (document.getElementById("editorbody").style.display=="none") showUBB("Message");
    document.forms["frm"].Message.value="[quote="+usr+"]"+document.getElementById(content).innerText+"[/quote]"
	document.forms["frm"].Message.focus();
	}catch(e){}
}

//插入上传附件
function addUploadItem(type,path,memberDown){
	var EditType=""
	try{
	  var oEditor = parent.FCKeditorAPI.GetInstance('Message')
	  EditType="FCkEditor"
	  var hrefLen=location.href.lastIndexOf("/")
      var Fhref=location.href.substr(0,hrefLen+1)
      path=Fhref+path
	}
	catch(e){
	  EditType="UBBEditor"
	}
	type=type.toLowerCase()
 	 switch(type){
 	  case 'gif':
        if (EditType=="UBBEditor"){parent.document.forms[0].Message.value+='[img]'+path+'[/img]\n'}
        else{oEditor.InsertHtml('<img src="'+path+'" alt=""/>')}
 	  	break;
 	  case 'jpg':
        if (EditType=="UBBEditor"){parent.document.forms[0].Message.value+='[img]'+path+'[/img]\n'}
        else{oEditor.InsertHtml('<img src="'+path+'" alt=""/>')}
 	  	break;
 	  case 'png':
        if (EditType=="UBBEditor"){parent.document.forms[0].Message.value+='[img]'+path+'[/img]\n'}
        else{oEditor.InsertHtml('<img src="'+path+'" alt=""/>')}
 	  	break;
 	  case 'bmp':
        if (EditType=="UBBEditor"){parent.document.forms[0].Message.value+='[img]'+path+'[/img]\n'}
        else{oEditor.InsertHtml('<img src="'+path+'" alt=""/>')}
 	  	break;
 	  case 'jpeg':
        if (EditType=="UBBEditor"){parent.document.forms[0].Message.value+='[img]'+path+'[/img]\n'}
        else{oEditor.InsertHtml('<img src="'+path+'" alt=""/>')}
 	  	break;
 	  case 'mp3':
        if (EditType=="UBBEditor"){parent.document.forms[0].Message.value+='[wma]'+path+'[/wma]\n'}
        else{oEditor.InsertHtml('<object classid="CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95"  id="MediaPlayer" width="450" height="70"><param name=""howStatusBar" value="-1"><param name="AutoStart" value="False"><param name="Filename" value="'+path+'"></object>')}
 	  	break;
 	  case 'wma':
        if (EditType=="UBBEditor"){parent.document.forms[0].Message.value+='[wma]'+path+'[/wma]\n'}
        else{oEditor.InsertHtml('<object classid="CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95"  id="MediaPlayer" width="450" height="70"><param name=""howStatusBar" value="-1"><param name="AutoStart" value="False"><param name="Filename" value="'+path+'"></object>')}
 	  	break;
 	  case 'rm':
        if (EditType=="UBBEditor"){parent.document.forms[0].Message.value+='[rm]'+path+'[/rm]\n'}
        else{oEditor.InsertHtml('<object classid="clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA" width="400" height="300"><param name="SRC" value="'+path+'" /><param name="CONTROLS" VALUE="ImageWindow" /><param name="CONSOLE" value="one" /><param name="AUTOSTART" value="true" /><embed src="'+path+'" nojava="true" controls="ImageWindow" console="one" width="400" height="300"></object><br/><object classid="clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA" width="400" height="32" /><param name="CONTROLS" value="StatusBar" /><param name="AUTOSTART" value="true" /><param name="CONSOLE" value="one" /><embed src="'+path+'" nojava="true" controls="StatusBar" console="one" width="400" height="24" /></object><br/><object classid="clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA" width="400" height="32" /><param name="CONTROLS" value="ControlPanel" /><param name="AUTOSTART" value="true" /><param name="CONSOLE" value="one" /><embed src="'+path+'" nojava="true" controls="ControlPanel" console="one" width="400" height="24" autostart="true" loop="false" /></object>')}
 	  	break;
 	  case 'rmvb':
        if (EditType=="UBBEditor"){parent.document.forms[0].Message.value+='[rm]'+path+'[/rm]\n'}
        else{oEditor.InsertHtml('<object classid="clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA" width="400" height="300"><param name="SRC" value="'+path+'" /><param name="CONTROLS" VALUE="ImageWindow" /><param name="CONSOLE" value="one" /><param name="AUTOSTART" value="true" /><embed src="'+path+'" nojava="true" controls="ImageWindow" console="one" width="400" height="300"></object><br/><object classid="clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA" width="400" height="32" /><param name="CONTROLS" value="StatusBar" /><param name="AUTOSTART" value="true" /><param name="CONSOLE" value="one" /><embed src="'+path+'" nojava="true" controls="StatusBar" console="one" width="400" height="24" /></object><br/><object classid="clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA" width="400" height="32" /><param name="CONTROLS" value="ControlPanel" /><param name="AUTOSTART" value="true" /><param name="CONSOLE" value="one" /><embed src="'+path+'" nojava="true" controls="ControlPanel" console="one" width="400" height="24" autostart="true" loop="false" /></object>')}
 	  	break;
 	  case 'ra':
        if (EditType=="UBBEditor"){parent.document.forms[0].Message.value+='[ra]'+path+'[/ra]\n'}
        else{oEditor.InsertHtml('<object classid="clsid:CFCDAA03-8BE4-11CF-B84B-0020AFBBCCFA" id="RAOCX" width="450" height="60"><param name="_ExtentX" value="6694"><param name="_ExtentY" value="1588"><param name="AUTOSTART" value="true"><param name="SHUFFLE" value="0"><param name="PREFETCH" value="0"><param name="NOLABELS" value="0"><param name="SRC" value="'+path+'"><param name="CONTROLS" value="StatusBar,ControlPanel"><param name="LOOP" value="0"><param name="NUMLOOP" value="0"><param name="CENTER" value="0"><param name="MAINTAINASPECT" value="0"><param name="BACKGROUNDCOLOR" value="#000000"><embed src="'+path+'" width="450" autostart="true" height="60"></embed></object>')}
 	  	break;
 	  case 'asf':
        if (EditType=="UBBEditor"){parent.document.forms[0].Message.value+='[wmv]'+path+'[/wmv]\n'}
        else{oEditor.InsertHtml('<object classid="clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95" codebase="http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=6,0,02,902" type="application/x-oleobject" standby="Loading..." width="400" height="300"><param name="FileName" VALUE="'+path+'" /><param name="ShowStatusBar" value="-1" /><param name="AutoStart" value="true" /><embed type="application/x-mplayer2" pluginspage="http://www.microsoft.com/Windows/MediaPlayer/" src="'+path+'" autostart="true" width="400" height="300" /></object>')}
 	  	break;
 	  case 'avi':
        if (EditType=="UBBEditor"){parent.document.forms[0].Message.value+='[wmv]'+path+'[/wmv]\n'}
        else{oEditor.InsertHtml('<object classid="clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95" codebase="http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=6,0,02,902" type="application/x-oleobject" standby="Loading..." width="400" height="300"><param name="FileName" VALUE="'+path+'" /><param name="ShowStatusBar" value="-1" /><param name="AutoStart" value="true" /><embed type="application/x-mplayer2" pluginspage="http://www.microsoft.com/Windows/MediaPlayer/" src="'+path+'" autostart="true" width="400" height="300" /></object>')}
 	  	break;
 	  case 'wmv':
        if (EditType=="UBBEditor"){parent.document.forms[0].Message.value+='[wmv]'+path+'[/wmv]\n'}
        else{oEditor.InsertHtml('<object classid="clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95" codebase="http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=6,0,02,902" type="application/x-oleobject" standby="Loading..." width="400" height="300"><param name="FileName" VALUE="'+path+'" /><param name="ShowStatusBar" value="-1" /><param name="AutoStart" value="true" /><embed type="application/x-mplayer2" pluginspage="http://www.microsoft.com/Windows/MediaPlayer/" src="'+path+'" autostart="true" width="400" height="300" /></object>')}
 	  	break;
 	  case 'swf':
        if (EditType=="UBBEditor"){parent.document.forms[0].Message.value+='[swf]'+path+'[/swf]\n'}
        else{oEditor.InsertHtml('<object codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="400" height="300"><param name="movie" value="'+path+'" /><param name="quality" value="high" /><param name="AllowScriptAccess" value="never" /><embed src="'+path+'" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="400" height="300" /></object>')}
 	  	break;
 	  default :
        if (EditType=="UBBEditor"){
        if (memberDown==1)
	         {parent.document.forms[0].Message.value+='[mDown='+path+']点击下载此文件[/mDown]\n'}
         else
	         {parent.document.forms[0].Message.value+='[down='+path+']点击下载此文件[/down]\n'}
        }
        else{oEditor.InsertHtml('<a href="'+path+'"><img border="0" src="../../images/download.gif" alt="" style="margin:0px 2px -4px 0px"/>点击下载此文件</a>')}
        break;
     }
}
//写入顶部Flash文件
function WriteHeadFlash(Path,Width,Height,Transparent){
	 var Temp,T=""
	 Temp='<object classid="clsid:D27CDB6E-AE6D-11CF-96B8-444553540000" id="FlashH" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0" border="0" width="'+Width+'" height="'+Height+'">'
	 Temp+='<param name="movie" value="'+Path+'"/>'
	 Temp+='<param name="quality" value="High"/>'
	 Temp+='<param name="scale" value="ExactFit"/>'
	 if (Transparent) {Temp+=' <param name="wmode" value="transparent"/>';T='wmode="transparent"'}
	 Temp+='<embed src="'+Path+'" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" name="FlashH" width="'+Width+'" height="'+Height+'" quality="High"'+T+' scale="ExactFit"/>'
	 Temp+='</object>'
	 document.getElementById("FlashHead").innerHTML=Temp
}