
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
			
				<g:if test="${mealInstance?.ingredients}">
				<li class="fieldcontain">
					<span id="ingredients-label" class="property-label"><g:message code="meal.ingredients.label" default="Ingredients" /></span>
					
						<span class="property-value" aria-labelledby="ingredients-label"><g:fieldValue bean="${mealInstance}" field="ingredients"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mealInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="meal.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${mealInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mealInstance?.receipt}">
				<li class="fieldcontain">
					<span id="receipt-label" class="property-label"><g:message code="meal.receipt.label" default="Receipt" /></span>
					
						<span class="property-value" aria-labelledby="receipt-label"><g:fieldValue bean="${mealInstance}" field="receipt"/></span>
					
				</li>
				</g:if>

				${mealInstance?.mealDetailsInfo?.kcal} kcal<br>
				${mealInstance?.mealDetailsInfo?.protein} protein
				<meal:percentValue kcal="${mealInstance?.mealDetailsInfo?.kcal}" bwt="${mealInstance?.mealDetailsInfo?.protein}" x="4"></meal:percentValue><br>
				${mealInstance?.mealDetailsInfo?.carbohydrates} carbohydrates
				<meal:percentValue kcal="${mealInstance?.mealDetailsInfo?.kcal}" bwt="${mealInstance?.mealDetailsInfo?.carbohydrates}" x="4"></meal:percentValue><br>
				${mealInstance?.mealDetailsInfo?.fats} fats
				<meal:percentValue kcal="${mealInstance?.mealDetailsInfo?.kcal}" bwt="${mealInstance?.mealDetailsInfo?.fats}" x="9"></meal:percentValue><br>

			</ol>
			<g:form url="[resource:mealInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${mealInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
