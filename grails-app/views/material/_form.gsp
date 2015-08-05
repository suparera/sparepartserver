<%@ page import="com.nic.ssp.Material" %>



<div class="fieldcontain ${hasErrors(bean: materialInstance, field: 'plant', 'error')} ">
	<label for="plant">
		<g:message code="material.plant.label" default="Plant" />
		
	</label>
	<g:textField name="plant" maxlength="5" value="${materialInstance?.plant}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: materialInstance, field: 'typeNo', 'error')} ">
	<label for="typeNo">
		<g:message code="material.typeNo.label" default="Type No" />
		
	</label>
	<g:field name="typeNo" type="number" value="${materialInstance.typeNo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: materialInstance, field: 'category', 'error')} ">
	<label for="category">
		<g:message code="material.category.label" default="Category" />
		
	</label>
	<g:textField name="category" value="${materialInstance?.category}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: materialInstance, field: 'i', 'error')} ">
	<label for="i">
		<g:message code="material.i.label" default="I" />
		
	</label>
	<g:textField name="i" maxlength="1" value="${materialInstance?.i}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: materialInstance, field: 'descr', 'error')} ">
	<label for="descr">
		<g:message code="material.descr.label" default="Descr" />
		
	</label>
	<g:textField name="descr" value="${materialInstance?.descr}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: materialInstance, field: 'poText', 'error')} ">
	<label for="poText">
		<g:message code="material.poText.label" default="Po Text" />
		
	</label>
	<g:textField name="poText" value="${materialInstance?.poText}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: materialInstance, field: 'uom', 'error')} ">
	<label for="uom">
		<g:message code="material.uom.label" default="Uom" />
		
	</label>
	<g:textField name="uom" value="${materialInstance?.uom}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: materialInstance, field: 'location', 'error')} ">
	<label for="location">
		<g:message code="material.location.label" default="Location" />
		
	</label>
	<g:textField name="location" value="${materialInstance?.location}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: materialInstance, field: 'min', 'error')} ">
	<label for="min">
		<g:message code="material.min.label" default="Min" />
		
	</label>
	<g:field name="min" type="number" value="${materialInstance.min}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: materialInstance, field: 'max', 'error')} ">
	<label for="max">
		<g:message code="material.max.label" default="Max" />
		
	</label>
	<g:field name="max" type="number" value="${materialInstance.max}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: materialInstance, field: 'sapQty', 'error')} ">
	<label for="sapQty">
		<g:message code="material.sapQty.label" default="Sap Qty" />
		
	</label>
	<g:field name="sapQty" type="number" value="${materialInstance.sapQty}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: materialInstance, field: 'pricePerUnit', 'error')} ">
	<label for="pricePerUnit">
		<g:message code="material.pricePerUnit.label" default="Price Per Unit" />
		
	</label>
	<g:field name="pricePerUnit" value="${fieldValue(bean: materialInstance, field: 'pricePerUnit')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: materialInstance, field: 'diff', 'error')} ">
	<label for="diff">
		<g:message code="material.diff.label" default="Diff" />
		
	</label>
	<g:field name="diff" type="number" value="${materialInstance.diff}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: materialInstance, field: 'diffBaht', 'error')} ">
	<label for="diffBaht">
		<g:message code="material.diffBaht.label" default="Diff Baht" />
		
	</label>
	<g:field name="diffBaht" value="${fieldValue(bean: materialInstance, field: 'diffBaht')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: materialInstance, field: 'cc', 'error')} ">
	<label for="cc">
		<g:message code="material.cc.label" default="Cc" />
		
	</label>
	<g:textField name="cc" value="${materialInstance?.cc}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: materialInstance, field: 'amount', 'error')} ">
	<label for="amount">
		<g:message code="material.amount.label" default="Amount" />
		
	</label>
	<g:field name="amount" value="${fieldValue(bean: materialInstance, field: 'amount')}"/>

</div>


