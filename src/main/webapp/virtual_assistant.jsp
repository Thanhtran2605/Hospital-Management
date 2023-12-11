
<style type="text/css">
.position {
	position: fixed;
	top: 79%;
	bottom: 0;
	right: 0;
	left: 85%;
	background: transparent;
	z-index: 1000;
}

.position:hover {
	cursor: pointer;
}

.face {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 81px;
	margin: auto;
	height: 25px;
	width: 30px;
	background: black;
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
}

.head {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 82px;
	margin: auto;
	height: 35px;
	width: 45px;
	z-index: -1;
	background: white;
	border-top-left-radius: 60px;
	border-top-right-radius: 60px;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
	box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px,
		rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px
		-2px 6px 0px inset;
}

.body {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	margin: auto;
	height: 35px;
	width: 45px;
	background: white;
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
	border-bottom-left-radius: 100px;
	border-bottom-right-radius: 100px;
	box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px,
		rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px
		-2px 6px 0px inset;
}

.left-hand {
	position: absolute;
	top: 0;
	left: 0;
	right: 85px;
	bottom: 7px;
	margin: auto;
	height: 7px;
	width: 32px;
	background: white;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	border-bottom-left-radius: 50px;
	border-bottom-right-radius: 10px;
	animation: hand 1s linear infinite;
	transform: rotateZ(45deg);
	box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px,
		rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px
		-2px 6px 0px inset;
}

.right-hand {
	position: absolute;
	top: 5px;
	left: 58px;
	right: 0;
	bottom: 0;
	margin: auto;
	height: 7px;
	width: 32px;
	background: white;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 50px;
	transform: rotateZ(90deg);
	box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px,
		rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px
		-2px 6px 0px inset;
}

.eye1 {
	position: absolute;
	top: -80px;
	left: 0;
	right: 17px;
	bottom: 0;
	margin: auto;
	height: 7px;
	width: 5px;
	background: repeating-linear-gradient(blue 70%, #002966 80%, blue);
	border-top-left-radius: 50px;
	border-top-right-radius: 50px;
	border-bottom-left-radius: 20px;
	border-bottom-right-radius: 20px;
	animation: blink 1s linear 2;
}

.eye2 {
	position: absolute;
	top: -80px;
	left: 17px;
	right: 0;
	bottom: 0;
	margin: auto;
	height: 7px;
	width: 5px;
	background: repeating-linear-gradient(blue 70%, #002966 80%, blue);
	border-top-left-radius: 50px;
	border-top-right-radius: 50px;
	border-bottom-left-radius: 20px;
	border-bottom-right-radius: 20px;
	animation: blink 1s linear 2;
}

@keyframes hand { 
	0%{transform: translateY(-40px) rotateZ(45deg);}
	
	50%{transform: translateY(0px) rotateZ(-0deg);}
	
	100%{transform:translateY(-40px) rotateZ(45deg);}
}

@keyframes blink { 
	0%{height: 10px;}
	
	25%{height:6px;}
	
	50%{height:1px;}
	
	75%{height:6px;}
	
	
	100%{heigth:10px;}
}

#login-modals {
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background-color: rgba(0, 0, 0, 0.6);
	z-index: 1000;
	display: none;
	justify-content: center;
	align-items: center;
}

.modals {
	background-color: #e6ecf0;
	padding: 10px 0 20px 0;
	border-radius: 10px;
	width: 450px;
	text-align: center;
}

.inputs {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 81%;
	height: 50px;
	border-radius: 20px;
	background: -webkit-linear-gradient(left, #458ff6, #25b7c4);
}

.auto {
	display: flex;
	justify-content: center;
	align-items: center;
}

.inputs .talk {
	background: transparent;
	outline: none;
	border: none;
	width: 50px;
	height: 50px;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 15px;
	cursor: pointer;
}

.inputs .talk i {
	font-size: 20px;
	color: #aed0d0;
}

.top-form .close-modals {
	cursor: pointer;
	padding: 0 20px;
	font-size: 20px;
	text-align: right;
}

.inputs .contents {
	color: #aed0d0;
	font-size: 15px;
	margin: 0 20px;
	cursor: text;
}

@media screen and (max-width: 768px){
	.position {
		position: fixed;
		top: 79%;
		bottom: 0;
		right: 0;
		left: 76%;
		background: transparent;
		z-index: 1000;
	}
}

</style>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<body>
	<div id="login-shows" class="position">

		<div class="face"></div>
		<div class="head"></div>
		<div class="body"></div>
		<div class="left-hand"></div>
		<div class="right-hand"></div>
		<div class="eye1"></div>
		<div class="eye2"></div>

	</div>
	<div id="login-modals" class="position">
		<div class="modals">
			<div class="top-form">
				<div class="close-modals">&#10006;</div>
			</div>
			<div class="auto">
				<div class="inputs">
					<button class="talk">
						<i class="fas fa-microphone-alt"></i>
					</button>
					<h1 class="contents">Nhấn vào đây để nói</h1>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(function() {

		$('#login-shows').click(function() {
			$('#login-modals').fadeIn().css("display", "flex");
		});

		$('.close-modals').click(function() {
			$('#login-modals').fadeOut();
		});
	});
</script>

<!------- Js Linkage --------->
<script src="assets/js/virtual_assistant.js"></script>
