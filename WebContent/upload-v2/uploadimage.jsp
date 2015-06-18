<%@ page contentType="text/html; charset=GBK" language="java" buffer="32kb"%>
<%@ page import="java.io.*,java.awt.Image,java.awt.image.*,com.sun.image.codec.jpeg.*,java.sql.*,com.jspsmart.upload.*,java.util.*,java.net.*"%>
<%@ page import="com.util.*"%>
<%

   SmartUpload mySmartUpload =new SmartUpload();

   long file_size_max=4000000;
   String fileName2="",ext="",testvar="";
   String url="uploadimges\\"; //上传文件所需文件夹,可自行更改
   String SubPath=request.getRealPath(""); //获取根目录绝对路径
   SubPath=SubPath+"\\uploadimges";
   java.io.File createSub=new java.io.File(SubPath);
   if(!createSub.exists())
   {
       createSub.mkdir();//如果文件夹不存在，则创建
   }
   mySmartUpload.initialize(pageContext);   //初始化

	String FileListType="jpg,gif,jpeg,JPEG,BMP,bmp,GIF,JPG";//只允许上载此类文件,可自行更改 
try
{
	mySmartUpload.setAllowedFilesList(FileListType);
    //上载文件 
    mySmartUpload.upload();
} 
catch (Exception e)
{
%>
    <SCRIPT language=javascript>
	  var filelistType="jpg,gif,jpeg,JPEG,BMP,bmp,GIF,JPG";
      alert("只允许上传"+filelistType+"类型文件");
      window.location='upload.jsp';
	</script>
<%
}
 try
 {
//循环保存文件

int count=0;
for (int i=0;i<mySmartUpload.getFiles().getCount();i++) 
{ 

	com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(i);
    if (myFile.isMissing())
	{ continue;}
    else
	{
	  count++;
      //String myFileName=myFile.getFileName(); //取得上载的文件的文件名
      ext= myFile.getFileExt();      //取得后缀名
      int file_size=myFile.getSize();     //取得文件的大小  
      String saveurl="";
      if(file_size<file_size_max)
	  {
          //更改文件名，取得当前上传时间的毫秒数值
       Calendar calendar = Calendar.getInstance();
       String filename = String.valueOf(calendar.getTimeInMillis()); 

       saveurl=request.getRealPath("/")+url;

       saveurl+=filename+"."+ext;          //保存路径
       myFile.saveAs(saveurl,mySmartUpload.SAVE_PHYSICAL);

//-----------------------上传完成，开始生成缩略图-------------------------    
       java.io.File file = new java.io.File(saveurl); //读入刚才上传的文件
       String newurl=request.getRealPath("/")+url+filename+"_min."+ext;
	   //新的缩略图保存地址
       Image src = javax.imageio.ImageIO.read(file);                     //构造Image对象
       float tagsize=150;
       int old_w=src.getWidth(null);   //得到源图宽                                  
       int old_h=src.getHeight(null);   //得到源图高
       int new_w=0;//缩略图宽
       int new_h=0;//缩略图高
       int tempsize;
       float tempdouble; 
       if(old_w>old_h)
	   {
          tempdouble=old_w/tagsize;
       }
	   else
	   {
          tempdouble=old_h/tagsize;
       }
       new_w=Math.round(old_w/tempdouble);
       new_h=Math.round(old_h/tempdouble);//计算新图长宽
       BufferedImage tag = new BufferedImage(new_w,new_h,BufferedImage.TYPE_INT_RGB);
       tag.getGraphics().drawImage(src,0,0,new_w,new_h,null);       //绘制缩小后的图
       FileOutputStream newimage=new FileOutputStream(newurl);          //输出到文件流
	   
       JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(newimage);       
       encoder.encode(tag);                                               //近JPEG编码
       newimage.close(); 

//////************************把数据入库***************************////////
//获取前页面的大类和小类值
String  b=mySmartUpload.getRequest().getParameter("BigClassID");//大类号
String  s=mySmartUpload.getRequest().getParameter("SmallClassID");//小类号
String sql="";
if(!b.equals("0"))
   sql="insert into up_imges (wid_name,path,min_path,sizes,times,ip,PicBClassID,PicSClassID) values(?,?,?,?,?,?,"+b+","+s+")";
else
	sql="insert into up_imges (wid_name,path,min_path,sizes,times,ip) values(?,?,?,?,?,?)";

	   String ul=filename+"."+ext;
	   String min_ul=filename+"_min."+ext;

	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
       String dateStr = sdf.format(new java.util.Date());//格式化当前时间
       try
	   {
               Connection con=DataBaseConnection.getConnection();

	           PreparedStatement pstmt=con.prepareStatement(sql);
		       pstmt.setString(1,ext);
		       pstmt.setString(2,url+ul);
		       pstmt.setString(3,url+min_ul);
		       pstmt.setInt(4,file_size);
		       pstmt.setString(5,dateStr);
		       pstmt.setString(6,request.getRemoteAddr());
			   pstmt.executeUpdate();

		 }
	     catch(Exception ee)
	     {
			 ee.printStackTrace();
			 out.println("<SCRIPT language='javascript'>alert('存入数据库失败！');window.location='upload.jsp;'</script>");
		 }
////////////////把数据入库/////////////////////////
      }
      else
      {
        out.print("<SCRIPT language='javascript'>");
        out.print("alert('上传文件大小不能超过"+(file_size_max/1000)+"K');");
        out.print("window.location='upload.jsp;'");
        out.print("</SCRIPT>");
      }
    } 
}
out.println("<SCRIPT language=javascript>alert('"+count+"个图片上传成功！');window.location='upload.jsp';</script>");
}
catch (Exception e)
{
   e.toString();
} 

%> 

