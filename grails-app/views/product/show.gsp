
<%@ page import="com.myApp.Product" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-product" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-product" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list product">

				<g:if test="${productInstance?.name}">
					<li class="fieldcontain">
						<span id="name-label" class="property-label"><g:message code="product.name.label" default="Name" /></span>

						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${productInstance}" field="name"/></span>
					</li>
				</g:if>

				<g:if test="${productInstance?.weight}">
					<li class="fieldcontain">
						<span id="weight-label" class="property-label"><g:message code="product.weight.label" default="Weight" /></span>

						<span class="property-value" aria-labelledby="weight-label"><g:fieldValue bean="${productInstance}" field="weight"/>

						<g:if test="${productInstance?.units}">
							${productInstance?.units}
						</g:if>

						</span>

					</li>
				</g:if>

				<g:if test="${productInstance?.kcal}">
					<li class="fieldcontain">
						<span id="kcal-label" class="property-label"><g:message code="product.kcal.label" default="Kcal" /></span>

						<span class="property-value" aria-labelledby="kcal-label"><g:fieldValue bean="${productInstance}" field="kcal"/></span>

					</li>
				</g:if>

				<g:if test="${productInstance?.carbohydrates}">
				<li class="fieldcontain">
					<span id="carbohydrates-label" class="property-label"><g:message code="product.carbohydrates.label" default="Carbohydrates" /></span>
					
						<span class="property-value" aria-labelledby="carbohydrates-label"><g:fieldValue bean="${productInstance}" field="carbohydrates"/></span>
					
				</li>
				</g:if>

				<g:if test="${productInstance?.protein}">
					<li class="fieldcontain">
						<span id="protein-label" class="property-label"><g:message code="product.protein.label" default="Protein" /></span>

						<span class="property-value" aria-labelledby="protein-label"><g:fieldValue bean="${productInstance}" field="protein"/></span>

					</li>
				</g:if>

				<g:if test="${productInstance?.fats}">
				<li class="fieldcontain">
					<span id="fats-label" class="property-label"><g:message code="product.fats.label" default="Fats" /></span>
					
						<span class="property-value" aria-labelledby="fats-label"><g:fieldValue bean="${productInstance}" field="fats"/></span>
					
				</li>
				</g:if>

			</ol>
			<g:form url="[resource:productInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${productInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
