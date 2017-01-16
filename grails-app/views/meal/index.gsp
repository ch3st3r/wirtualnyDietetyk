
<%@ page import="com.myApp.Meal" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'meal.label', default: 'Meal')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-meal" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-meal" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'meal.name.label', default: 'Nazwa')}" />
					
						<g:sortableColumn property="mealDetailsInfo.kcal" title="${message(code: 'meal.receipt.label', default: 'Kcal')}" />
%{--
						<g:sortableColumn property="mealDetailsInfo.carbohydrates" title="${message(code: 'meal.receipt.label', default: 'Węglowodany')}" />

						<g:sortableColumn property="mealDetailsInfo.protein" title="${message(code: 'meal.receipt.label', default: 'Białka')}" />

						<g:sortableColumn property="mealDetailsInfo.fats" title="${message(code: 'meal.receipt.label', default: 'Tłuszcze')}" />
					--}%
					</tr>
				</thead>
				<tbody>
				<g:each in="${mealInstanceList}" status="i" var="mealInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${mealInstance.id}">${fieldValue(bean: mealInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: mealInstance, field: "mealDetailsInfo.kcal")}</td>

						%{--<td>${fieldValue(bean: mealInstance, field: "mealDetailsInfo.carbohydrates")}</td>

						<td>${fieldValue(bean: mealInstance, field: "mealDetailsInfo.protein")}</td>

						<td>${fieldValue(bean: mealInstance, field: "mealDetailsInfo.fats")}</td>--}%
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${mealInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
