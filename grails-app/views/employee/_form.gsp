<%@ page import="sparepart.Employee" %>



<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="employee.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${employeeInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'lname', 'error')} ">
	<label for="lname">
		<g:message code="employee.lname.label" default="Lname" />
		
	</label>
	<g:textField name="lname" value="${employeeInstance?.lname}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'descr', 'error')} ">
	<label for="descr">
		<g:message code="employee.descr.label" default="Descr" />
		
	</label>
	<g:textField name="descr" value="${employeeInstance?.descr}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'isStaff', 'error')} ">
	<label for="isStaff">
		<g:message code="employee.isStaff.label" default="Is Staff" />
		
	</label>
	<g:checkBox name="isStaff" value="${employeeInstance?.isStaff}" />

</div>

