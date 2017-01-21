
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
				<li><g:link class="list" action="index"><g:message code="default.list.labell" default="Lista posiłków" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.labell" default="Utwórz posiłek" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-meal" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.labell" default="Posiłek" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list meal">

				<g:if test="${mealInstance?.name}">
					<li class="fieldcontain">
						<span id="name-label" class="property-label"><g:message code="meal.name.label" default="Nazwa" /></span>

						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${mealInstance}" field="name"/></span>

					</li>
				</g:if>

				<g:if test="${mealInstance?.ingredients}">
				<li class="fieldcontain">
					<span id="ingredients-label" class="property-label"><g:message code="meal.ingredients.label" default="Składniki" /></span>
						<span class="property-value" aria-labelledby="ingredients-label">
							<span><g:each in="${mealInstance.ingredients}" var="ingredient">
								${ingredient.product.name} (${ingredient.weight} ${ingredient.product.units})<br>
							</g:each>
						</span
				</li>
				</g:if>

				<g:if test="${mealInstance?.receipt}">
				<li class="fieldcontain">
					<span id="receipt-label" class="property-label"><g:message code="meal.receipt.label" default="Przepis" /></span>
					
						<span class="property-value" aria-labelledby="receipt-label"><g:fieldValue bean="${mealInstance}" field="receipt"/></span>
					
				</li>
				</g:if>

				<g:if test="${mealInstance}">
					<li class="fieldcontain">
						<span id="receipt-label" class="property-label"><g:message code="meal.receipt.label" default="Makroskładniki" /></span>
						<span class="property-value" aria-labelledby="receipt-label">
							Kalorie: <meal:roundValue value="${mealInstance?.mealDetailsInfo?.kcal}"></meal:roundValue><br>

							<g:set var="currentMealDetais" value="${mealInstance?.mealDetailsInfo}"/>
							Białko: <meal:roundValue value="${mealInstance?.mealDetailsInfo?.protein}"></meal:roundValue>g
							(<meal:percentValueOfMeal meal="${currentMealDetais?.id}" bwt="${currentMealDetais?.protein}" x="4"/> %)<br>
							Węglowodany: <meal:roundValue value="${mealInstance?.mealDetailsInfo?.carbohydrates}"></meal:roundValue>g
							(<meal:percentValueOfMeal meal="${currentMealDetais?.id}" bwt="${currentMealDetais?.carbohydrates}" x="4"/> %)<br>
							Tłuszcze: <meal:roundValue value="${mealInstance?.mealDetailsInfo?.fats}"></meal:roundValue>g
							(<meal:percentValueOfMeal meal="${currentMealDetais?.id}" bwt="${currentMealDetais?.fats}" x="9"/> %)<br>

							%{--${mealInstance?.mealDetailsInfo?.protein} proteins
							<meal:percentValue kcal="${mealInstance?.mealDetailsInfo?.kcal}" bwt="${mealInstance?.mealDetailsInfo?.protein}" x="4"></meal:percentValue><br>
							${mealInstance?.mealDetailsInfo?.carbohydrates} carbohydrates
							<meal:percentValue kcal="${mealInstance?.mealDetailsInfo?.kcal}" bwt="${mealInstance?.mealDetailsInfo?.carbohydrates}" x="4"></meal:percentValue><br>
							${mealInstance?.mealDetailsInfo?.fats} fats
							<meal:percentValue kcal="${mealInstance?.mealDetailsInfo?.kcal}" bwt="${mealInstance?.mealDetailsInfo?.fats}" x="9"></meal:percentValue><br>--}%
						</span>
					</li>
				</g:if>

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
