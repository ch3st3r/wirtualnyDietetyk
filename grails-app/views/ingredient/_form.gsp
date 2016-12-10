<%@ page import="com.myApp.Ingredient" %>



<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'product', 'error')} required">
	<label for="product">
		<g:message code="ingredient.product.label" default="Product" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="product" name="product.id" from="${com.myApp.Product.list()}" optionKey="id" required="" value="${ingredientInstance?.product?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: ingredientInstance, field: 'weight', 'error')} required">
	<label for="weight">
		<g:message code="ingredient.weight.label" default="Weight" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="weight" value="${fieldValue(bean: ingredientInstance, field: 'weight')}" required=""/>

</div>

