// JavaScript Document
//ΪString �������trim()����
String.prototype.trim=function()
{
	return this.replace(/(^\s*)|(\s*$)/g, "");
}
//����
function checkPost()
{
	if(document.post.content.value.trim().length==0)
	{
		alert("�������Ĳ���Ϊ��!\n����д��ȫ......");
		document.post.content.focus();
		return false;
	}
	if(document.post.content.value.length>600)
	{
		alert("�������������ֽ���Ϊ"+document.post.content.value.length+"\n���ĳ����������600�ֽ�����");
		document.post.content.focus();
		return false;
	}
	return true;
}

//���༭����Χ���ж����ֽ�
function checkLength()
{
	alert("��������Ŀǰ���� "+document.post.content.value.length+" �ֽ�");
}
//UBB�Զ���Ӻ���
function addBold()
{
	var post=prompt("����Ҫ�Ӵֵ�����","����");
	if(post!=null)
	{
		document.post.content.value=document.post.content.value+"[b]"+post+"[/b]";
	}
}
function addEm()
{
	var post=prompt("����Ҫ��б������","����");
	if(post!=null)
	{
		document.post.content.value=document.post.content.value+"[i]"+post+"[/i]";
	}
}
function addCenter()
{
	var post=prompt("����Ҫ������ʾ������","����");
	if(post!=null)
	{
		document.post.content.value=document.post.content.value+"[center]"+post+"[/center]";
	}
}
function addLeft()
{
	var post=prompt("����Ҫ����������","����");
	if(post!=null)
	{
		document.post.content.value=document.post.content.value+"[left]"+post+"[/left]";
	}
}
function addRight()
{
	var post=prompt("����Ҫ�Ҷ��������","����");
	if(post!=null)
	{
		document.post.content.value=document.post.content.value+"[right]"+post+"[/right]";
	}
}
function addimages()
{
	var post=prompt("������������ͼƬ���ӵ�ַ\n����http://www.jzhzg.com/logo.gif","�����ĵ�ַ");
	if(post!=null)
	{
		document.post.content.value=document.post.content.value+"[img]"+post+"[/img]";
	}
}
function addURL()
{
	var post=prompt("�����������ĵ�ַ\n����http://www.jzhzg.com","�����ĵ�ַ");
	if(post!=null)
	{
		document.post.content.value=document.post.content.value+"[url]"+post+"[/url]";
	}
}
function addEmail()
{
	var post=prompt("�������������ʼ���ַ\n����hack520vip@21cn.com","�����ĵ�ַ");
	if(post!=null)
	{
		document.post.content.value=document.post.content.value+"[email]"+post+"[/email]";
	}
}
function addQuote()
{
	var post=prompt("���������õ�����","����");
	if(post!=null)
	{
		document.post.content.value=document.post.content.value+"[quote]"+post+"[/quote]";
	}
}
function setFont(font)
{
	var post=prompt("��������ı����������","����");
	if(post!=null)
	{
		document.post.content.value=document.post.content.value+"[font="+font+"]"+post+"[/font]";
	}
}
function setSize(size)
{
	var post=prompt("��������ı��С������","����");
	if(post!=null)
	{
		document.post.content.value=document.post.content.value+"[size="+size+"]"+post+"[/size]";
	}
}
function setColor(color)
{
	var post=prompt("����Ⱦɫ","����");
	if(post!=null)
	{
		document.post.content.value=document.post.content.value+"["+color+"]"+post+"[/"+color+"]";
	}
}
function addMood(mood)
{
	document.post.content.value=document.post.content.value+mood;
}
