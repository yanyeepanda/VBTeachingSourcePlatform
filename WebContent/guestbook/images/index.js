// JavaScript Document
//为String 对象添加trim()方法
String.prototype.trim=function()
{
	return this.replace(/(^\s*)|(\s*$)/g, "");
}
//检查表单
function checkPost()
{
	if(document.post.content.value.trim().length==0)
	{
		alert("帖子正文不能为空!\n请填写完全......");
		document.post.content.focus();
		return false;
	}
	if(document.post.content.value.length>600)
	{
		alert("您的帖子正文字节数为"+document.post.content.value.length+"\n正文长度请控制在600字节以下");
		document.post.content.focus();
		return false;
	}
	return true;
}

//检查编辑区域范围内有多少字节
function checkLength()
{
	alert("您的文章目前共有 "+document.post.content.value.length+" 字节");
}
//UBB自动添加函数
function addBold()
{
	var post=prompt("输入要加粗的文字","文字");
	if(post!=null)
	{
		document.post.content.value=document.post.content.value+"[b]"+post+"[/b]";
	}
}
function addEm()
{
	var post=prompt("输入要倾斜的文字","文字");
	if(post!=null)
	{
		document.post.content.value=document.post.content.value+"[i]"+post+"[/i]";
	}
}
function addCenter()
{
	var post=prompt("输入要居中显示的文字","文字");
	if(post!=null)
	{
		document.post.content.value=document.post.content.value+"[center]"+post+"[/center]";
	}
}
function addLeft()
{
	var post=prompt("输入要左对齐的文字","文字");
	if(post!=null)
	{
		document.post.content.value=document.post.content.value+"[left]"+post+"[/left]";
	}
}
function addRight()
{
	var post=prompt("输入要右对齐的文字","文字");
	if(post!=null)
	{
		document.post.content.value=document.post.content.value+"[right]"+post+"[/right]";
	}
}
function addimages()
{
	var post=prompt("请输入完整的图片链接地址\n比如http://www.jzhzg.com/logo.gif","完整的地址");
	if(post!=null)
	{
		document.post.content.value=document.post.content.value+"[img]"+post+"[/img]";
	}
}
function addURL()
{
	var post=prompt("请输入完整的地址\n比如http://www.jzhzg.com","完整的地址");
	if(post!=null)
	{
		document.post.content.value=document.post.content.value+"[url]"+post+"[/url]";
	}
}
function addEmail()
{
	var post=prompt("请输入完整的邮件地址\n比如hack520vip@21cn.com","完整的地址");
	if(post!=null)
	{
		document.post.content.value=document.post.content.value+"[email]"+post+"[/email]";
	}
}
function addQuote()
{
	var post=prompt("请输入引用的文字","文字");
	if(post!=null)
	{
		document.post.content.value=document.post.content.value+"[quote]"+post+"[/quote]";
	}
}
function setFont(font)
{
	var post=prompt("请输入想改变字体的文字","文字");
	if(post!=null)
	{
		document.post.content.value=document.post.content.value+"[font="+font+"]"+post+"[/font]";
	}
}
function setSize(size)
{
	var post=prompt("请输入想改变大小的文字","文字");
	if(post!=null)
	{
		document.post.content.value=document.post.content.value+"[size="+size+"]"+post+"[/size]";
	}
}
function setColor(color)
{
	var post=prompt("文字染色","文字");
	if(post!=null)
	{
		document.post.content.value=document.post.content.value+"["+color+"]"+post+"[/"+color+"]";
	}
}
function addMood(mood)
{
	document.post.content.value=document.post.content.value+mood;
}
