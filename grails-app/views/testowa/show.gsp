

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'testowa.label', default: 'Testowa')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-testowa" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-testowa" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list testowa">
			
				<g:if test="${testowaInstance?.dupa2}">
				<li class="fieldcontain">
					<span id="dupa2-label" class="property-label"><g:message code="testowa.dupa2.label" default="Dupa2" /></span>
					
						<span class="property-value" aria-labelledby="dupa2-label"><g:fieldValue bean="${testowaInstance}" field="dupa2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${testowaInstance?.test1}">
				<li class="fieldcontain">
					<span id="test1-label" class="property-label"><g:message code="testowa.test1.label" default="Test1" /></span>
					
						<span class="property-value" aria-labelledby="test1-label"><g:fieldValue bean="${testowaInstance}" field="test1"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:testowaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${testowaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
