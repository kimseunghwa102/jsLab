<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ include file="/view/include/header.jspf" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | ì¡°ì ë·ì»´</title>
  <!-- Tell the browser to be responsive to screen width -->
  
  
  
  
  
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="../../bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="../../bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        ì¡°ì ë·ì»´
        
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Examples</a></li>
        <li class="active">Blank page</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Title</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                    title="Collapse">
              <i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fa fa-times"></i></button>
          </div>
        </div>
        <div class="box-body">
          
          
          
          
          <html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<title> RSS ì°ëíê¸° </title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
//ë³ì gì í¬ë¡ì¤ ëë©ì¸ì ë°ì´í°ë¥¼ ê°ì ¸ì¬ ì ìëë¡ êµ¬ê¸ ì£¼ìë¥¼ ì ì¥íììµëë¤.
  //var g="https://ajax.googleapis.com/ajax/services/feed/load?v=2.0&num=10&callback=?&q=";
  var g = "https://api.rss2json.com/v1/api.json?rss_url=";
   
   $("#news_wrap h2 a").on("click",
   function(e){
      e.preventDefault(); //<a> íê·¸ì ë§í¬ë¥¼ ì°¨ë¨íììµëë¤.
      $("#news_wrap h2 a").removeClass("on"); //<a>ì "on" classë¥¼ ì­ì í©ëë¤.
      $(this).addClass("on"); //í´ë¦­í <a>ì class="on"ì ìì±í©ëë¤.
      $.ajax({
        url:g+$(this).attr("href"), //ìì²­í  ë°ì´í° ê²½ë¡.
        dataType: "json", //ìì²­í  ë°ì´í°ì íì.
        success: function (data) { //ì±ê³µì ì¼ë¡ ìì²­íìì ë...
        	//obj = JSONtoString(data);
            var obj = JSON.stringify(data);
        	alert(obj);
        	
        	$("#news_list").empty(); //<ul>ì íì ììë¥¼ ëª¨ë ì ê±°í©ëë¤.
           //console.log(data.responseData.feed.entries);

           //$.each(data.responseData.feed.entries,function(i, d){
           $.each(data.items,function(i, d){
              if(i==5) return false;
              var title=d["title"]; //title í¤ì ê°ì ê°ì ¸ìµëë¤.
              //var date=new Date(d["publishedDate"]); //ë´ì¤ ìì± ë ì§ ê°ì²´ ìì±
              var date=new Date(d["pubDate"]); //ë´ì¤ ìì± ë ì§ ê°ì²´ ìì±
              //ìì±í ë-ì-ì¼ íìì¼ë¡ ë³ì mì ì ì¥í©ëë¤.
              var m=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
              var lk=d["link"];
              //ìì êµ¬í´ì¨ ë°ì´í°ë¥¼ ì´ì©í´ ì ë³´ ëª©ë¡ íê·¸ë¥¼ ìì±í©ëë¤.
              $("#news_list").append('<li><a href="'+lk+'" target="_blank">'+
              title+'</a> <span>'+m+'</span></li>');
           }); // â$.eachâ ë©ìëì ì¢ë£
        } // âsuccess: functionâì ì¢ë£
      }); // $.ajax() ë©ìëì ì¢ë£
   }); // ì´ë²¤í¸ on ë©ìëì ì¢ë£

  $("#news_wrap h2 a").eq(0).click(); //ìµì´ ì²« ë²ì§¸ í­ ë²í¼ì ê°ì ë¡ í´ë¦­ìíµëë¤.
});
</script>
<style type="text/css">
/*ê¸°ë³¸ ì¸í*/
*{margin:0;padding:0;}
li{list-style:none;}
body{font:12px Margun Gothic,"ë§ìê³ ë",gulim,"êµ´ë¦¼",sans-serif;
color:#333;padding-top:20px;}
h1,h2,h3,h4,h5,h6{font-size:100%;font-weight:normal;}
a{color:#333;text-decoration:none;outline:none;}
h1{font-size:2em;text-align:center;margin-bottom:10px;color:#c00;}

/*í­ ë©ë´ ëìì¸*/
#news_wrap{width:380px;margin:0 auto;
  background:#FFF url("images/rss_bg.gif") 0 0 repeat-x;}

#news_wrap li{height:25px;line-height:25px;position:relative;}
#news_wrap span{position:absolute;top:0;right:3px;}
#news_wrap li a{display:block;width:210px;
   white-space:nowrap;overflow:hidden;
   text-overflow:ellipsis;padding-left:15px;
   background:url("images/bullet.gif") 5px 10px no-repeat;
}
#news_wrap h2{float:left;padding-right:3px;
margin-bottom:10px;}
#news_list{clear:both;}

/*ë¹íì±í í­ ë²í¼ ëª¨ì*/
#news_wrap h2 a{
  display:inline-block;padding:8px 10px;
  border:1px solid #aaa;
  border-bottom:none;
  border-radius:5px 5px 0 0;background:#ccc;
}
/*ë¹íì±í í­ ë²í¼ ëª¨ì*/
#news_wrap h2 a.on{background-color:#fff;font-weight:bold;}
</style>
</head>
<body>

<div id="news_wrap">
  <h2> <!-- ì´ê¸°ì ì²« ë²ì§¸ ë²í¼ìë§ class="on"ì´ í¬í¨ëì´ ììµëë¤. -->
    <a href="http://myhome.chosun.com/rss/www_section_rss.xml" class="on">
  ì¤ëì ì£¼ìë´ì¤</a>
  </h2>
  <h2>
    <a href="http://www.chosun.com/site/data/rss/ent.xml">ìí°íì´ë¨¼í¸</a>
  </h2>
  <h2>
    <a href="http://newsplus.chosun.com/hitdata/xml/se/sports/index.xml">ì¤í¬ì¸ </a>
  </h2>
   <h2>
    <a href="http://rss.donga.com/economy.xml">ëìì¼ë³´</a>
  </h2>
  <ul id="news_list">
  </ul>
</div>
</body>
</html>
          
          
          
          
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          Footer
        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

 <%@ include file="/view/include/footer.jspf" %>
 