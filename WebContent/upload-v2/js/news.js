var sFromUrl = "http://";

/*****************************************************  
 *  ��������ChangeLocation()
 *  ��  �ã���Ӧѡ�������¼�
 *	��  ����ѡ������ֵ
 *****************************************************
*/
function ChangeLocation(locationid)
{
	document.AddNews.SClassID.length = 1; 
	var locationid=locationid;
	var i;
	for (i=0;i < iCount; i++)
	{
		if (subcat[i][2] == locationid)
		{ 
			document.AddNews.SClassID.options[document.AddNews.SClassID.length] = new Option(subcat[i][1], subcat[i][0]);
		}        
	}
} 

// ��ʼֵ
function InitDocument(){
	d_fromurl.value = sFromUrl;
	RadioClick('file');
}

// ͼƬ��Դ��ѡ����¼�
function RadioClick(what){
	if (what=="url"){
		d_checkfromfile.checked=false;
		d_fromurl.disabled=false;
		d_checkfromurl.checked=true;
		d_file.myform.uploadfile.disabled=true;
	}else{
		d_checkfromurl.checked=false;
		d_file.myform.uploadfile.disabled=false;
		d_checkfromfile.checked=true;
		d_fromurl.disabled=true;
	}
}


// �ϴ�����
function UploadError(sErrDesc){
	AbleItems();
	RadioClick('file');
	divProcessing.style.display="none";
	try {
		BaseAlert(d_file.myform.uploadfile,sErrDesc);
	}
	catch(e){}
}


// �ļ��ϴ����ʱִ��,�����ϴ��ļ���
function UploadSaved(sFileName){
	d_fromurl.value=GetHttpUrl("UploadFile/"+sFileName);
	ReturnValue();
}

// �����ڷ���ֵ
function ReturnValue(){
	sFromUrl = d_fromurl.value;
	window.returnValue = sFromUrl;
	window.close();
}


// ��ȷ��ʱִ��
function ok(){
	// �ϴ��ļ��ж�
	if (d_checkfromurl.checked){
		// ����ֵ
		ReturnValue();
	}
	else
	{
		if (!d_file.CheckUploadForm()) return false;
		// ʹ���������Ч
		DisableItems();
		// ��ʾ�����ϴ�ͼƬ
		divProcessing.style.display="";
		// �ϴ����ύ
		d_file.myform.submit();
	}
}

// ʹ�����������Ч
function DisableItems(){
	d_checkfromfile.disabled=true;
	d_checkfromurl.disabled=true;
	d_fromurl.disabled=true;
	Ok.disabled=true;
}

// ʹ�����������Ч
function AbleItems(){
	d_checkfromfile.disabled=false;
	d_checkfromurl.disabled=false;
	d_fromurl.disabled=false;
	Ok.disabled=false;
}


// ��ʾ��ģʽ�Ի���
function ShowDialog(url, width, height) {
	var arr = window.showModalDialog(url,window,"dialogWidth:" + width + "px;dialogHeight:" + height + "px;help:no;scroll:no;status:no");
	return arr;
}


// �Ƿ���ʾ�ϴ�ͼƬ��
function ShowPicture(bYes) {
	if(bYes)
	{	
		p.style.display="";
	}
	else p.style.display="none";
}

//����������ϴ�ͼƬ�¼�
function getPicture()
{
	var sPicture = ShowDialog('Img.htm',350,140)
	if(sPicture!=null)
	{
		document.AddNews.NewsPicture.value = sPicture;
	}
}


// �Ƿ���ʾ�ϴ�ͷ��ͼƬ��
function ShowHeadPicture(bYes) {
	if(bYes)
	{	
		p1.style.display="";
	}
	else p1.style.display="none";
}

//����������ϴ�ͷ������ͼƬ�¼�
function getHeadPicture()
{
	var sPicture = ShowDialog('Img.htm',350,140)
	if(sPicture!=null)
	{
		document.AddNews.HeadPicture.value = sPicture;
	}
}

//����������ϴ�ͷ������ͼƬ�¼�
function fastNews(b)
{
	var NewsID = document.ListNews.NewsID.value;
	if(b) location.href="DelNews.jsp?NewsID="+NewsID;
	else location.href="ModifyNews.jsp?NewsID="+NewsID;
}

