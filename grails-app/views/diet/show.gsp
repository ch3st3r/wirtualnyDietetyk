
<%@ page import="com.myApp.Diet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'diet.label', default: 'Diet')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-diet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				%{--<li><g:link class="list" action="index"><g:message code="default.list.label"  args="[entityName]" /></g:link></li>--}%
				%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
			</ul>
		</div>
		<div id="show-diet" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.labell" default="Dieta" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list diet">
				%{--<g:if test="${dietInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="diet.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${dietInstance?.user?.id}">${dietInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
--}%
				<g:if test="${dietInstance?.userMeal}">
				<li class="fieldcontain">

					Dzień 1
				%{--	<span id="userMeal-label" class="property-label"><g:message code="diet.userMeal.label" default="User Meal" /></span>
					--}%
						%{--<g:each in="${dietInstance.userMeal}" var="u">
						<span class="property-value" aria-labelledby="userMeal-label"><g:link controller="userMeal" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>--}%
					<br><br>
						<g:each in="${dietInstance.userMeal}" var="userMeal">

							<b>${userMeal.name}</b><br>
							kalorie - <meal:roundValue value="${userMeal.mealDetailsInfo?.kcal}"></meal:roundValue><br>
							węglowodany - <meal:roundValue value="${userMeal.mealDetailsInfo?.carbohydrates}"></meal:roundValue> g<br>
							białka - <meal:roundValue value="${userMeal.mealDetailsInfo?.protein}"></meal:roundValue> g<br>
							tłuszcze - <meal:roundValue value="${userMeal.mealDetailsInfo?.fats}"></meal:roundValue> g<br><br>

							<g:each in="${userMeal.ingredients}" var="userMealIngredients">
								${userMealIngredients.product.name}
								<meal:roundValue value="${userMealIngredients.weight}"></meal:roundValue>
								${userMealIngredients.product.units} <br>
							</g:each><br>
							${userMeal.receipt}<br><br><br>
						</g:each>

					fgdffd
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:dietInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${dietInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
