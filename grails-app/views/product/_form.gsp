<%@ page import="com.myApp.Product" %>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="product.name.label" default="Nazwa" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${productInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'weight', 'error')} required">
	<label for="weight">
		<g:message code="product.weight.label" default="Waga" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="weight" value="${fieldValue(bean: productInstance, field: 'weight')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'units', 'error')} required">
	<label for="units">
		<g:message code="product.units.label" default="Jednostka" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="units" required="" value="${productInstance?.units}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'kcal', 'error')} required">
	<label for="kcal">
		<g:message code="product.kcal.label" default="Kalorie" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="kcal" value="${fieldValue(bean: productInstance, field: 'kcal')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'protein', 'error')} required">
	<label for="protein">
		<g:message code="product.protein.label" default="Białka" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="protein" value="${fieldValue(bean: productInstance, field: 'protein')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'carbohydrates', 'error')} required">
	<label for="carbohydrates">
		<g:message code="product.carbohydrates.label" default="Węglowodany" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="carbohydrates" value="${fieldValue(bean: productInstance, field: 'carbohydrates')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: productInstance, field: 'fats', 'error')} required">
	<label for="fats">
		<g:message code="product.fats.label" default="Tłuszcze" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="fats" value="${fieldValue(bean: productInstance, field: 'fats')}" required=""/>
</div>






