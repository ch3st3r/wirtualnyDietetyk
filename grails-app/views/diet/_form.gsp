<%@ page import="com.myApp.Diet" %>



<div class="fieldcontain ${hasErrors(bean: dietInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="diet.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.myApp.User.list()}" optionKey="id" required="" value="${dietInstance?.user?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: dietInstance, field: 'userMeal', 'error')} ">
	<label for="userMeal">
		<g:message code="diet.userMeal.label" default="User Meal" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${dietInstance?.userMeal?}" var="u">
    <li><g:link controller="userMeal" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="userMeal" action="create" params="['diet.id': dietInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'userMeal.label', default: 'UserMeal')])}</g:link>
</li>
</ul>


</div>

