



<div class="fieldcontain ${hasErrors(bean: testowaInstance, field: 'dupa2', 'error')} required">
	<label for="dupa2">
		<g:message code="testowa.dupa2.label" default="Dupa2" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="dupa2" type="number" value="${testowaInstance.dupa2}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: testowaInstance, field: 'test1', 'error')} required">
	<label for="test1">
		<g:message code="testowa.test1.label" default="Test1" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="test1" required="" value="${testowaInstance?.test1}"/>

</div>

