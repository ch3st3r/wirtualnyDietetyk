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

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
    <label for="enabled">
        <g:message code="user.enabled.label" default="Enabled" />

    </label>
    <g:checkBox name="enabled" value="${userInstance?.enabled}" />
</div>


<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'age', 'error')} ">
    <label for="age">
        <g:message code="user.enabled.label" default="Age" />

    </label>
    <g:field type="number" name="weight" value="${userInstance?.age}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'weight', 'error')} ">
    <label for="weight">
        <g:message code="user.enabled.label" default="Weight" />
    </label>
    <g:field type="number" name="weight" value="${userInstance?.age}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'lifeStyleMode', 'error')} ">
    <label for="lifeStyleType">
        <g:message code="user.enabled.label" default="Lifestyle Type" />
    </label>
    <g:radio name="lifeStyleMode" value="1,4" checked="true"/>Siędzący
    <g:radio name="lifeStyleMode" value="1,7" checked="true"/>Umiarkowanie aktywny
    <g:radio name="lifeStyleMode" value="2,0" checked="true"/>Aktywny
</div>
