<%@ page import="com.myApp.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${userInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${userInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'age', 'error')} required">
	<label for="age">
		<g:message code="user.age.label" default="Age" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="age" type="number" value="${userInstance.age}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'weight', 'error')} required">
	<label for="weight">
		<g:message code="user.weight.label" default="Weight" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="weight" value="${fieldValue(bean: userInstance, field: 'weight')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'lifeStyleMode', 'error')} required">
	<label for="lifeStyleMode">
		<g:message code="user.lifeStyleMode.label" default="Life Style Mode" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lifeStyleMode" value="${fieldValue(bean: userInstance, field: 'lifeStyleMode')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="user.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="user.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="user.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${userInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'exercises', 'error')} ">
	<label for="exercises">
		<g:message code="user.exercises.label" default="Exercises" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.exercises?}" var="e">
    <li><g:link controller="exercise" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="exercise" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'exercise.label', default: 'Exercise')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="user.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'sex', 'error')} required">
	<label for="sex">
		<g:message code="user.sex.label" default="Sex" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="sex" required="" value="${userInstance?.sex}"/>

</div>

