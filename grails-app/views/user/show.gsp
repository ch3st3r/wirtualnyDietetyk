
<%@ page import="com.myApp.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-user" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list user">
			
				<g:if test="${userInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="user.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${userInstance}" field="username"/></span>
					
				</li>
				</g:if>

	%{--			<g:if test="${userInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="user.password.label" default="Password" /></span>

						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${userInstance}" field="password"/></span>

				</li>
				</g:if>
--}%
				<g:if test="${userInstance?.age}">
				<li class="fieldcontain">
					<span id="age-label" class="property-label"><g:message code="user.age.label" default="Age" /></span>
					
						<span class="property-value" aria-labelledby="age-label"><g:fieldValue bean="${userInstance}" field="age"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.weight}">
				<li class="fieldcontain">
					<span id="weight-label" class="property-label"><g:message code="user.weight.label" default="Weight" /></span>
					
						<span class="property-value" aria-labelledby="weight-label"><g:fieldValue bean="${userInstance}" field="weight"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.lifeStyleMode}">
				<li class="fieldcontain">
					<span id="lifeStyleMode-label" class="property-label"><g:message code="user.lifeStyleMode.label" default="Life Style Mode" /></span>
					
						<span class="property-value" aria-labelledby="lifeStyleMode-label">
							<g:if test="${userInstance?.lifeStyleMode == 1.4}">
								Siędzący
							</g:if>
							<g:elseif test="${userInstance?.lifeStyleMode == 1.7}">
								Umiarkowanie aktywny
							</g:elseif>
							<g:elseif test="${userInstance?.lifeStyleMode == 2.0}">
								Aktywny
							</g:elseif>
							<g:else>
								Nieokreślono
							</g:else>
						</span>
					
				</li>
				</g:if>

				<g:if test="${userInstance?.exercises}">
				<li class="fieldcontain">
					<span id="exercises-label" class="property-label"><g:message code="user.exercises.label" default="Exercises" /></span>
					
						<g:each in="${userInstance.exercises}" var="e">
						<span class="property-value" aria-labelledby="exercises-label"><g:link controller="exercise" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>

			
				<g:if test="${userInstance?.sex}">
				<li class="fieldcontain">
					<span id="sex-label" class="property-label"><g:message code="user.sex.label" default="Sex" /></span>
					
						<span class="property-value" aria-labelledby="sex-label"><g:fieldValue bean="${userInstance}" field="sex"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:userInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${userInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
