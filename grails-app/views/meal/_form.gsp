<%@ page import="com.myApp.Meal" %>



<div class="fieldcontain ${hasErrors(bean: mealInstance, field: 'ingredients', 'error')} ">
	<label for="ingredients">
		<g:message code="meal.ingredients.label" default="Ingredients" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: mealInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="meal.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${mealInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: mealInstance, field: 'receipt', 'error')} required">
	<label for="receipt">
		<g:message code="meal.receipt.label" default="Receipt" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="receipt" required="" value="${mealInstance?.receipt}"/>

</div>

