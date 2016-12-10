

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'testowa.label', default: 'Testowa')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-testowa" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-testowa" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="dupa2" title="${message(code: 'testowa.dupa2.label', default: 'Dupa2')}" />
					
						<g:sortableColumn property="test1" title="${message(code: 'testowa.test1.label', default: 'Test1')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${testowaInstanceList}" status="i" var="testowaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${testowaInstance.id}">${fieldValue(bean: testowaInstance, field: "dupa2")}</g:link></td>
					
						<td>${fieldValue(bean: testowaInstance, field: "test1")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${testowaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
