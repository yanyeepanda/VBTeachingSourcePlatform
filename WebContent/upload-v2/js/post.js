// JavaScript Document

//��Ctrl+Enter)�ύ��
function BigPressKey(eventobject)
{
	if(event.ctrlKey && window.event.keyCode==13)
	{
		if(CheckBigClass())  this.document.BigClass.submit();
	}
}

//С�������а�(Ctrl+Enter)�ύ��
function SPressKey(eventobject)
{
	if(event.ctrlKey && window.event.keyCode==13)
	{
		if(CheckSClass())  this.document.SmallClass.submit();
	}
}

//С�������а�(Ctrl+Enter)�ύ��
function SpPressKey(eventobject)
{
	if(event.ctrlKey && window.event.keyCode==13)
	{
		if(CheckSpecial())  this.document.Special.submit();
	}
}

//������ҳ
function MM_jumpMenu(targ,selObj,restore){ 		//v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

// ��ʾ��ģʽ�Ի���
function ShowDialog(url, width, height) {
	var arr = window.showModalDialog(url, window, "dialogWidth:" + width + "px;dialogHeight:" + height + "px;help:no;scroll:no;status:no");
	ShowDialog = arr;
}

/*****************************************************  
 *  ��������DateCheck()
 *  ��  �ã�����ַ����Ƿ���ָ���Ĵ�С��Χ�ں��Ƿ��зǷ��ַ�
 *	��  ����date: Ҫ�����ַ���
 *          minum:  �ַ���С�ĳ���
 *  		maxnum: �ַ����ĳ���
 *  ����ֵ��True:   ���ݲ���ָ����Χ�ڻ��зǷ��ַ�
 *			False:  ������ָ����Χ���Ҳ����зǷ��ַ�
 ******************************************************
*/
function DateCheck(date,minnum,maxnum)
{
	if (date.length < minnum || date.length > maxnum ){
		window.alert("�������ݵĳ��Ȳ������� " + minnum + " λ���Ҳ��ܴ��� " + maxnum + " λ!");
		return true;
	}

	 a = date.indexOf("'");
	 b = date.indexOf("|");
	 c = date.indexOf("\"");
	 
	 if (a != -1||b != -1 ||c != -1){
	   window.alert("�������뺬�������ַ������������룡");
	   return true;
	  	}
	return false;
}


/*****************************************************  
 *  ��������	IsNum()
 *  ��  �ã�����ַ��Ƿ��Ǵ�����
 *	��  ����str: Ҫ�����ַ���  
 *  ����ֵ��True:   ������
 *			False:  ���Ǵ�����
 ******************************************************
*/
function IsNum(str)
{
	return !/\D/.test(str)
}


/*****************************************************  
 *  ��������	IsStr()
 *  ��  �ã�����ַ��Ƿ����ַ�
 *	��  ����str: Ҫ�����ַ�  
 *  ����ֵ��True:   ���ַ�
 *			False:  ���Ǵ��ַ�
 ******************************************************
*/
function IsStr(str)
{      
����if (/[^\x00-\xff]/g.test(str))
	{
		return false;
	}
����else 
	{
		return true;
	}
}


/*****************************************************  
 *  ��������IsEmail()
 *  ��  �ã����Email��ַ�Ƿ�Ϸ�
 *	��  ����date: Ҫ����Email��ַ  
 *  ����ֵ��True: Email ��ַ�Ϸ�
 *          False:Email ��ַ���Ϸ�
 *****************************************************
*/
function IsEmail(vEMail)
{
	var regInvalid=/(@.*@)|(\.\.)|(@\.)|(\.@)|(^\.)/;
	var regValid=/^.+\@(\[?)[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,3}|[0-9]{1,3})(\]?)$/;
	return (!regInvalid.test(vEMail)&&regValid.test(vEMail));
}


/*****************************************************  
 *  ��������CheckBigClass()
 *  ��  �ã���������Ϣ
 *	��  ������ 
 *  ����ֵ��True: ��֤ͨ��
 *          False: ��֤û��ͨ��
 ******************************************************
*/
function CheckBigClass(){
    var CheckBigClass = false;
	var BigClassID = document.BigClass.BigClassID.value;
	if (BigClassID=="")
	{
	   alert("�������������!");
	   document.BigClass.BigClassID.focus();
	   return false;
	 }
	
	if(!IsNum(BigClassID))
	{
		alert("������Ĵ�������������!");
		document.BigClassID.focus();
		document.BigClass.BigClassID.value = "";
		return false;
	}
	
	if(DateCheck(BigClassID,1,4))
	{
		document.BigClass.BigClassID.focus();
		document.BigClass.BigClassID.value = "";
		return false;
	}
	
	var BigClassName = document.BigClass.BigClassName.value;
	if (BigClassName=="")
	{
	   alert("������������!");
	   document.BigClass.BigClassName.focus();
	   return false;
	 }
	
	if(DateCheck(BigClassName,1,30))
	{
		document.BigClass.BigClassName.focus();
		document.BigClass.BigClassName.value = "";
		return false;
	}
	
	var BigClassInfo = document.BigClass.BigClassInfo.value;
	if (BigClassInfo=="")
	{
	   alert("����������˵��!");
	   document.BigClass.BigClassInfo.focus();
	   return false;
	 }
	
	if(DateCheck(BigClassInfo,1,200))
	{
		document.BigClass.BigClassInfo.focus();
		return false;
	}
  	return true;
}


/*****************************************************  
 *  ��������CheckSClass()
 *  ��  �ã����С����Ϣ
 *	��  ������ 
 *  ����ֵ��True: ��֤ͨ��
 *          False: ��֤û��ͨ��
 ******************************************************
*/
function CheckSClass(){
    var CheckSClass = false;
	var BigClassID = document.SmallClass.BigClassID.value;
	if (BigClassID=="")
	{
	   alert("��ѡ�����!");
	   document.SmallClass.BigClassID.focus();
	   return false;
	 }
	
	
	var SClassName = document.SmallClass.SClassName.value;
	if (SClassName=="")
	{
	   alert("������С�����!");
	   document.SmallClass.SClassName.focus();
	   return false;
	 }
	
	if(DateCheck(SClassName,2,30))
	{
		document.SmallClass.SClassName.focus();
		document.SmallClass.SClassName.value = "";
		return false;
	}
	
	var SClassInfo = document.SmallClass.SClassInfo.value;
	if (SClassInfo=="")
	{
	   alert("������С���˵��!");
	   document.SmallClass.SClassInfo.focus();
	   return false;
	 }
	
	if(DateCheck(SClassInfo,1,200))
	{
		document.SmallClass.SClassInfo.focus();
		return false;
	}
  	return true;
}


/*****************************************************  
 *  ��������CheckSpecial()
 *  ��  �ã����ר����Ϣ
 *	��  ������ 
 *  ����ֵ��True: ��֤ͨ��
 *          False: ��֤û��ͨ��
 ******************************************************
*/
function CheckSpecial(){
    var CheckSpecial = false;
	var SpecialName = document.Special.SpecialName.value;
	if (SpecialName=="")
	{
	   alert("������ר������!");
	   document.Special.SpecialName.focus();
	   return false;
	 }
	
	if(DateCheck(SpecialName,1,30))
	{
		document.Special.SpecialName.focus();
		document.Special.SpecialName.value = "";
		return false;
	}
	
	var SpecialInfo = document.Special.SpecialInfo.value;
	if (SpecialInfo=="")
	{
	   alert("������ר���˵��!");
	   document.Special.SpecialInfo.focus();
	   return false;
	 }
	
	if(DateCheck(SpecialInfo,1,200))
	{
		document.Special.SpecialInfo.focus();
		return false;
	}
  	return true;
}



/*****************************************************  
 *  ��������CheckNews()
 *  ��  �ã�������ű���Ϣ
 *	��  ������ 
 *  ����ֵ��True: ��֤ͨ��
 *          False: ��֤û��ͨ��
 ******************************************************
*/
function CheckNews(){
    var CheckNews = false;
	var BigClassID = document.AddNews.BigClassID.value;
	var SClassID = document.AddNews.SClassID.value;
	var SpecialID = document.AddNews.SpecialID.value;
	if (BigClassID=="" && SpecialID=="")
	{   
	   alert("��������ר�ⲻ��ͬʱΪ��!");
	   document.AddNews.BigClassID.focus();
	   return false;
	 }
	
	if (BigClassID!="" && SClassID=="")
	{
	   alert("��ѡ������С��!");
	   document.AddNews.SClassID.focus();
	   return false;
	 }
	
	
	var NewsTitle = document.AddNews.NewsTitle.value;
	if (NewsTitle=="")
	{
	   alert("���������ű���!");
	   document.AddNews.NewsTitle.focus();
	   return false;
	 }

	if(DateCheck(NewsTitle,2,60))
	{
		document.AddNews.NewsTitle.focus();
		document.AddNews.NewsTitle.value = "";
		return false;
	}
	
	
	var NewsAuthor = document.AddNews.NewsAuthor.value;
	if (NewsAuthor=="")
	{
	   alert("���������ŷ�����!");
	   document.AddNews.NewsAuthor.focus();
	   return false;
	 }

	if(DateCheck(NewsAuthor,1,20))
	{
		document.AddNews.NewsAuthor.focus();
		document.AddNews.NewsAuthor.value = "";
		return false;
	}
	
	
	var NewsFrom = document.AddNews.NewsFrom.value;
	if (NewsFrom=="")
	{
	   alert("���������ų���!");
	   document.AddNews.NewsFrom.focus();
	   return false;
	 }

	if(DateCheck(NewsFrom,2,60))
	{
		document.AddNews.NewsFrom.focus();
		document.AddNews.NewsFrom.value = "";
		return false;
	}
	
	
	//getHTML()ΪeWebEditor�Դ��Ľӿں���������Ϊȡ�༭��������
	if (DreamEditor.getHTML()==""){
		alert("�������ݲ���Ϊ�գ�");
		return false;
	}

	// ����Ч�Լ������Զ��ϴ�Զ���ļ�
	// ������remoteUpload(strEventUploadAfter)
	// ������strEventUploadAfter ; �ϴ���󣬴����ĺ�����������ϴ�����趯���ɲ������
	//DreamEditor.remoteUpload();
	//document.AddNews.NewsContent.value = DreamEditor.getHTML();
	return true;
}



/*****************************************************  
 *  ��������CheckUser()
 *  ��  �ã�����û�����Ϣ
 *	��  ������ 
 *  ����ֵ��True: ��֤ͨ��
 *          False: ��֤û��ͨ��
 ******************************************************
*/
function CheckUser(){
    var CheckUser = false;
	var AdminName = document.User.AdminName.value;
	if (AdminName=="")
	{
	   alert("�û�������Ϊ��!");
	   document.User.AdminName.focus();
	   return false;
	 }

	if(DateCheck(AdminName,3,16))
	{
		document.User.AdminName.focus();
		document.User.AdminName.value = "";
		return false;
	}
	
	var AdminPwd = document.User.AdminPwd.value;
	if (AdminPwd=="")
	{
	   alert("���������Ա����!");
	   document.User.AdminPwd.focus();
	   return false;
	 }

	if(DateCheck(AdminPwd,4,16))
	{
		document.User.AdminPwd.focus();
		document.User.AdminPwd.value = "";
		return false;
	}
	
	var AdminPwd2 = document.User.AdminPwd2.value;
	if (AdminPwd2=="")
	{
	   alert("��������һ��������!");
	   document.User.AdminPwd2.focus();
	   return false;
	 }
	
	if(DateCheck(AdminPwd2,4,16))
	{
		document.User.AdminPwd.focus();
		document.User.AdminPwd.value = "";
		return false;
	}
	
	if (AdminPwd != AdminPwd2) 
	{
		alert("��������������벻һ�£��������룡");
		document.User.AdminPwd.focus();	
		document.User.AdminPwd.value = "";
		document.User.AdminPwd2.value = "";
		return false;
	}
	
	var UserName = document.User.UserName.value;
	if (UserName=="")
	{
	   alert("��ʵ��������Ϊ��!");
	   document.User.UserName.focus();
	   return false;
	 }

	if(DateCheck(UserName,2,16))
	{
		document.User.UserName.focus();
		document.User.UserName.value = "";
		return false;
	}
	
	var UserEmail = document.User.UserEmail.value;
	if (UserEmail=="")
	{
	   alert("����������ʼ�!");
	   document.User.UserEmail.focus();
	   return false;
	 }
	
		
	if(!IsEmail(UserEmail ))
	{
		alert("��������ȷ�ĵ������䣡");
		document.User.UserEmail .focus();
		document.User.UserEmail .value = "";
		return false;
	}
	
	var UserQQ = document.User.UserQQ.value;
	if (UserQQ != "") 
	{
		if(!IsNum(UserQQ))
		{
			alert("�������QQ���Ǵ�����,���û��QQ�벻Ҫ��д!");
			document.User.UserQQ.focus();
			document.User.UserQQ.value = "";
			return false;
		}
		if(DateCheck(UserQQ,4,10))
		{
			document.User.UserQQ.focus();
			document.User.UserQQ.value = "";
			return false;
		}
	}
}


/*****************************************************  
 *  ��������CheckEditUser()
 *  ��  �ã�����û�����Ϣ
 *	��  ������ 
 *  ����ֵ��True: ��֤ͨ��
 *          False: ��֤û��ͨ��
 ******************************************************
*/
function CheckEditUser(){
    var CheckEditUser = false;
	var AdminPwd = document.User.AdminPwd.value;
	if (AdminPwd!="")
	{
		if(DateCheck(AdminPwd,4,16))
		{
			document.User.AdminPwd.focus();
			document.User.AdminPwd.value = "";
			return false;
		}
		
		var AdminPwd2 = document.User.AdminPwd2.value;
		if (AdminPwd2=="")
		{
		   alert("��������һ��������!");
		   document.User.AdminPwd2.focus();
		   return false;
		 }
		
		if(DateCheck(AdminPwd2,4,16))
		{
			document.User.AdminPwd.focus();
			document.User.AdminPwd.value = "";
			return false;
		}
		
		if (AdminPwd != AdminPwd2) 
		{
			alert("��������������벻һ�£��������룡");
			document.User.AdminPwd.focus();	
			document.User.AdminPwd.value = "";
			document.User.AdminPwd2.value = "";
			return false;
		}
		
	}


	
	var UserName = document.User.UserName.value;
	if (UserName=="")
	{
	   alert("��ʵ��������Ϊ��!");
	   document.User.UserName.focus();
	   return false;
	 }

	if(DateCheck(UserName,3,16))
	{
		document.User.UserName.focus();
		document.User.UserName.value = "";
		return false;
	}
	
	var UserEmail = document.User.UserEmail.value;
	if (UserEmail=="")
	{
	   alert("����������ʼ�!");
	   document.User.UserEmail.focus();
	   return false;
	 }
	
		
	if(!IsEmail(UserEmail ))
	{
		alert("��������ȷ�ĵ������䣡");
		document.User.UserEmail .focus();
		document.User.UserEmail .value = "";
		return false;
	}
	
	var UserQQ = document.User.UserQQ.value;
	if (UserQQ != "") 
	{
		if(!IsNum(UserQQ))
		{
			alert("�������QQ���Ǵ�����,���û��QQ�벻Ҫ��д!");
			document.User.UserQQ.focus();
			document.User.UserQQ.value = "";
			return false;
		}
		if(DateCheck(UserQQ,4,10))
		{
			document.User.UserQQ.focus();
			document.User.UserQQ.value = "";
			return false;
		}
	}
}



/*****************************************************  
 *  ��������CheckPerson()
 *  ��  �ã�����û�����Ϣ
 *	��  ������ 
 *  ����ֵ��True: ��֤ͨ��
 *          False: ��֤û��ͨ��
 ******************************************************
*/
function CheckPerson(){
    var CheckPerson = false;
	var UserName = document.User.UserName.value;
	if (UserName=="")
	{
	   alert("��ʵ��������Ϊ��!");
	   document.User.UserName.focus();
	   return false;
	 }

	if(DateCheck(UserName,3,16))
	{
		document.User.UserName.focus();
		document.User.UserName.value = "";
		return false;
	}
	
	var UserEmail = document.User.UserEmail.value;
	if (UserEmail=="")
	{
	   alert("����������ʼ�!");
	   document.User.UserEmail.focus();
	   return false;
	 }
	
		
	if(!IsEmail(UserEmail ))
	{
		alert("��������ȷ�ĵ������䣡");
		document.User.UserEmail .focus();
		document.User.UserEmail .value = "";
		return false;
	}
	
	var UserQQ = document.User.UserQQ.value;
	if (UserQQ != "") 
	{
		if(!IsNum(UserQQ))
		{
			alert("�������QQ���Ǵ�����,���û��QQ�벻Ҫ��д!");
			document.User.UserQQ.focus();
			document.User.UserQQ.value = "";
			return false;
		}
		if(DateCheck(UserQQ,4,10))
		{
			document.User.UserQQ.focus();
			document.User.UserQQ.value = "";
			return false;
		}
	}
}



/*****************************************************  
 *  ��������CheckModPwd()
 *  ��  �ã��޸������������֤
 *	��  ������ 
 *  ����ֵ��True: ��֤ͨ��
 *          False: ��֤û��ͨ��
 *****************************************************
*/
function CheckModPwd()
{
	var OldPwd = document.User.OldPwd.value;
	if (OldPwd == "") {
	alert("��������ľ�����!");
	document.User.OldPwd.focus();
		return false;
	}
	
	if(DateCheck(OldPwd,4,16)){
		document.User.OldPwd.focus();
		document.User.OldPwd.value = "";
		return false;
	}
	
	var AdminPwd = document.User.AdminPwd.value;
	if (AdminPwd == "") {
	alert("�����벻��Ϊ�գ�");
	document.User.AdminPwd.focus();	
		return false;
	} 
	
	if(DateCheck(AdminPwd,4,16)){
		document.User.AdminPwd.focus();
		document.User.AdminPwd.value = "";
		return false;
	}
	
	var AdminPwd2 = document.User.AdminPwd2.value; 
	if (AdminPwd2 == "") {
	alert("��ȷ�������룡");
	document.User.AdminPwd2.focus();		
		return false;
      }
	  
	if(DateCheck(AdminPwd2,4,16)){
		document.User.AdminPwd2.focus();
		document.User.AdminPwd2.value = "";
		return false;
	}
	 
	if (AdminPwd != AdminPwd2) {
	alert("��������������벻һ�£��������룡");
	document.User.AdminPwd.focus();	
	document.User.AdminPwd.value = "";
	document.User.AdminPwd2.value = "";
		return false;
	}
	 
  return true;
  }    
 
 
 
 
/*****************************************************  
 *  ��������LoginCheck()
 *  ��  �ã���¼��������֤
 *	��  ������ 
 *  ����ֵ��True: ��֤ͨ��
 *          False: ��֤û��ͨ��
 *****************************************************
*/
 function LoginCheck()
 {
	var LoginCheck = false;
	var User = document.form.User.value;
	if (User == "") {
	alert("����������û���!");
	document.form.User.focus();
		return false;
	}
	
	if(DateCheck(User,3,16)){
		document.form.User.focus();
		document.form.User.value = "";
		return false;
	}
	
	var Pwd = document.form.Pwd.value;
	if (Pwd == "") {
	alert("�������������!");
	document.form.Pwd.focus();
		return false;
	}
  return true;
  }  
  
 /*****************************************************  
 *  ��������CheckConfig()
 *  ��  �ã�ϵͳ�������ñ�������֤
 *	��  ������ 
 *  ����ֵ��True: ��֤ͨ��
 *          False: ��֤û��ͨ��
 *****************************************************
*/
 function CheckConfig()
 {
	var LoginCheck = false;
	 
	 
 }
  


