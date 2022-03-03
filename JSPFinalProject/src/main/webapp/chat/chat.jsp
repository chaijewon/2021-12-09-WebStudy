<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chatting</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>


<style type="text/css">
	#messageWindow{
		background: black;
		color: greenyellow;
	}
	#inputMessage{
		width:500px;
	}
	#btn-submit{
		background: white;
		border : 1px solid red;
		width:60px;
		height:30px;
	}
</style>
</head>
<body>
   <div class="wrapper row3">
  <div id="breadcrumb" class="clear"> 
    <!-- ################################################################################################ -->
    <ul>
      <li>웹 채팅</li>
    </ul>
    <!-- ################################################################################################ --> 
   </div>
  </div>
  <div class="wrapper row3">
   <main class="container clear">
	<fieldset class="inline">
		<textarea id="messageWindow" rows="30" cols="70" readonly="true"></textarea>
		<br><br>
		<input id="inputMessage" type="text">
<!-- 		onclick="send()" -->
		<input id="btn-submit" type="submit" value="전송" >
	</fieldset>
	</main>
</div>
</body>
<script type="text/javascript">
	

	var textarea = document.getElementById("messageWindow");
	var webSocket = new WebSocket('ws://localhost/JSPFinalProject/webChatServer');
// 	var webSocket = new WebSocket('ws://localhost/DevEricServers/webChatServer');
	var inputMessage = document.getElementById('inputMessage');
	
	webSocket.onerror = function(e){
		onError(e);
	};
	webSocket.onopen = function(e){
		onOpen(e);
	};
	webSocket.onmessage = function(e){
		onMessage(e);
	};
	
	
	function onMessage(e){
		textarea.value += event.data + "\n";
	}
	
	function onOpen(e){
		textarea.value += "==== Connected Eric Chat Server ===\n";
	}
	
	function onError(e){
		alert(e.data);
	}
	
	function send(){
		textarea.value += "나 : " + inputMessage.value + "\n";
		webSocket.send(inputMessage.value);
		inputMessage.value = "";
	}
	
</script>

<script type="text/javascript">
	$(function(){
		$('#btn-submit').click(function(){
			send();
		});
		
		$('#inputMessage').keydown(function(key){
			if(key.keyCode == 13){
				$('#inputMessage').focus();
				send();
			}
		});
	})
</script>
</html>