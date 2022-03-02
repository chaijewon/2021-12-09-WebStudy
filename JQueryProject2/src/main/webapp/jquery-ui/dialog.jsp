<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
  margin-top: 50px;
}
.row {
   margin: 0px auto;
   width:800px;
}
h1{
    text-align: center;
}
/* se4YnKDdxY */
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	$('#poster').css("cursor","pointer");
	$('#poster').click(function(){
		$('#dialog').show();
		$('#dialog').dialog();
	})
})
</script>
</head>
<body>
  <div class="container">
    <h1>뮤직 목록</h1>
    <div class="row">
     <table class="table">
      <tr>
        <td><img id="poster" src="https://image.genie.co.kr/Y/IMAGE/IMG_ALBUM/082/554/034/82554034_1645770887366_1_600x600.JPG/dims/resize/Q_80,0"></td>
      </tr>
     </table>
    </div>
    <div class="text-center">
	    <div id="dialog" title="동영상" style="display:none">
	      <%-- <embed src="">  --%>
	      <iframe src="https://www.youtube.com/embed/se4YnKDdxY4"></iframe>
	    </div>
    </div>
  </div>
</body>
</html>







