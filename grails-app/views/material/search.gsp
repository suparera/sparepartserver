
<%@ page import="com.nic.ssp.Material" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'material.label', default: 'Material')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<style>
		img {
			image-orientation: from-image;
		}
		</style>
	</head>
	<body>
		<a href="#list-material" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				<g:form action="search">
					<g:textField name="searchText" />
					<g:submitButton name="Search"  />
				</g:form>
			</ul>
		</div>
		<div id="list-material" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			จำนวนทั้งหมด <g:formatNumber number="${materialInstanceCount}" format="###,##0" /> รายการ
			<table>
			<thead>
					<tr>
						<g:sortableColumn property="id" title="${message(code: 'material.id.label', default: 'Mat No.')}" />
						
						<th >Image</th>
					
						<g:sortableColumn property="Location" title="${message(code: 'material.location.label', default: 'Location')}" />
					
						<g:sortableColumn property="descr" title="${message(code: 'material.descr.label', default: 'Descr')}" />
					
						<g:sortableColumn property="poText" title="${message(code: 'material.poText.label', default: 'Po Text')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${materialInstanceList}" status="i" var="materialInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${materialInstance.id}">${fieldValue(bean: materialInstance, field: "id")}</g:link></td>
						
						<td><g:img dir="images" file="${materialInstance.id}.jpg" width="40" height="40" onerror="this.style.display='none'" /></td>
					
						<td><g:link action="show" id="${materialInstance.id}">${fieldValue(bean: materialInstance, field: "location")}</g:link></td>
					
						<td>${fieldValue(bean: materialInstance, field: "descr")}</td>
					
						<td>${fieldValue(bean: materialInstance, field: "poText")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${materialInstanceCount ?: 0}" params='${[searchText:searchText]}' />
			</div>
		</div>
	</body>
</html>
