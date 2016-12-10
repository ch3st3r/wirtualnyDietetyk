
<%@ page import="com.myApp.Meal" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'meal.label', default: 'Meal')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-meal" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-meal" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list meal">

				<div>${mealInstance?.name}</div>
				<g:each in="${mealInstance.ingredients}" var="ingredient">
					<div style="display:flex">
						<div>${ingredient?.product.name}</div>
						<div>   ${ingredient?.weight}  ${ingredient?.product?.units} </div>
					</div>
				</g:each>
				<div>${mealInstance?.receipt}</div>

				<div>${mealInstance.mealDetailsInfo.kcal} kcal</div>
				<div>białko - ${mealInstance.mealDetailsInfo.protein} g</div>
				<div>węglowodany - ${mealInstance.mealDetailsInfo.carbohydrates} g</div>
				<div>tłuszcze - ${mealInstance.mealDetailsInfo.fats} g</div>


		</div>
	</body>
</html>
