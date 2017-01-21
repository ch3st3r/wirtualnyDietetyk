<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.1.1.min.js"></script>
		<g:layoutHead/>

	<style>
		#mainHeader{
			position: fixed;
			width: 100%;
			height: 75px;
			background-color: rgba(43, 43, 59, 0.9);
			z-index: 1;
		}

		#headerMenu{
			display: flex;
			flex-direction: row;
			line-height: 75px;
		}

		.menuItem{
			color: white;
			margin-left: 25px;
			margin-right: 25px;
		}

		.dashboard{
			display: flex;
			flex-direction: row;
		}

		.dashboardItem{
			display: none;
		}

		.item{
			color: white;
			margin-right: 25px;
			margin-left: 25px;
		}

		header{
			display:none;
		}

		@media screen and (max-width: 480px) {

			header{
				display: flex;
				justify-content: center;
				width: 100%;
				background: #3f3f4e;
				height: 55px;
				line-height: 60px;
			}

			.hamburger{
				background: #3f3f4e;
				position: absolute;
				top: 0;
				right: 0;
				line-height: 45px;
				padding: 5px 15px 0px 15px;
				color: #fff;
				border: 0;
				font-size: 1.4em;
				font-weight: bold;
				cursor: pointer;
				outline: none;
				z-index: 10000000000000;
			}
			.cross{
				background: #3f3f4e;
				position: absolute;
				top: 0px;
				right: 0;
				height: 45px;
				padding: 13px 15px 0px 0px;
				color: #fff;
				border: 0;
				font-size: 3em;
				font-weight: bold;
				cursor: pointer;
				outline: none;
				z-index: 10000000000000;
			}


			#mainHeader {
				position: relative;
				height: 100%;
			}

			#headerMenu {
				flex-direction: column;
				line-height: 45px;
				align-items: center;
			}

			#grailsLogo {
				display: none;
			}



		}

	</style>



</head>


	<body>
		<header>
			<button class="hamburger">&#9776;</button>
			<button class="cross">&#735;</button>
		</header>
		<div id="mainHeader" class="responsiveMainHeader">
			<div id="headerMenu">
				<div class="dashboard menuItem">
					<a style="color: white; text-decoration: none;" href="/WirtualnyDietetyk"><div class="dashboardHeader">Dashboard</div></a>
					<a style="color: white; text-decoration: none;" href="/WirtualnyDietetyk/user/myProfile"><div class="dashboardItem item">Profil</div></a>
					<a style="color: white; text-decoration: none;" href="/WirtualnyDietetyk/user/editProfile"><div class="dashboardItem item">Edycja profilu</div></a>
					<a style="color: white; text-decoration: none;" href="/WirtualnyDietetyk/diet"><div class="dashboardItem item">Moja dieta</div></a>
				</div>

				<a style="color: white; text-decoration: none;" href="/WirtualnyDietetyk/product/index"><div class="products menuItem">Produkty</div></a>
				<a style="color: white; text-decoration: none;" href="/WirtualnyDietetyk/meal/index"><div class="meals menuItem">Posiłki</div></a>
			</div>
		</div>
		<div id="grailsLogo" role="banner">%{--<a href="http://grails.org"><asset:image src="grails_logo.png" alt="Grails"/></a>--}%</div>
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
	</body>


<script>
	$('.dashboard').hover(
			function(){
				$('.separator').css('display', 'block');
				$('.dashboardItem').css('display', 'block');
				$('.dashboardHeader').css('background-color', '#2b2b3b');
			},
			function(){
				$('.separator').css('display', 'none');
				$('.dashboardItem').css('display', 'none');
				$('.dashboardHeader').css("background-color", "");
			}
	);



	$( ".cross" ).hide();
	$( ".responsiveMainHeader" ).hide();
	$( ".hamburger" ).click(function() {
		$( ".responsiveMainHeader" ).slideToggle( "slow", function() {
			$( ".hamburger" ).hide();
			$( ".cross" ).show();
		});
	});

	$( ".cross" ).click(function() {
		$( ".responsiveMainHeader" ).slideToggle( "slow", function() {
			$( ".cross" ).hide();
			$( ".hamburger" ).show();
		});
	});
</script>

</html>


