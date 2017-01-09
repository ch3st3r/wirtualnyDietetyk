
<%@ page import="com.myApp.Product" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-product" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-product" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						<g:sortableColumn property="name" title="${message(code: 'product.name.label', default: 'Name')}" />

						<g:sortableColumn property="kcal" title="${message(code: 'product.kcal.label', default: 'Kcal')}" />
					
						<g:sortableColumn property="carbohydrates" title="${message(code: 'product.carbohydrates.label', default: 'Carbohydrates')}" />

						<g:sortableColumn property="protein" title="${message(code: 'product.protein.label', default: 'Protein')}" />
					
						<g:sortableColumn property="fats" title="${message(code: 'product.fats.label', default: 'Fats')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${productInstanceList}" status="i" var="productInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${productInstance.id}">${fieldValue(bean: productInstance, field: "name")}</td></g:link>

						<td>${fieldValue(bean: productInstance, field: "kcal")}</td>

						<td>${fieldValue(bean: productInstance, field: "carbohydrates")}</td>

						<td>${fieldValue(bean: productInstance, field: "protein")}</td>

						<td>${fieldValue(bean: productInstance, field: "fats")}</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${productInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
