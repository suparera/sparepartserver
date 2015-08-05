
<%@ page import="com.nic.ssp.Material" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'material.label', default: 'Material')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<style>
		img {
			image-orientation: from-image;
		}
		</style>
	</head>
	<body>
		<a href="#show-material" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<g id="show-material" class="content scaffold-show" role="main">

			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:link url="${resource(dir: 'images', file: file="${materialInstance.id}.jpg")}" target="_blank" >
				<g:img dir="images" file="${materialInstance.id}.jpg" width="240" onerror="this.style.display='none'" style="image-orientation: from-image;"  />
			</g:link>
			<g:link url="${resource(dir: 'images', file: file="${materialInstance.id}-image2.jpg")}" target="_blank" >
				<g:img dir="images" file="${materialInstance.id}-image2.jpg" width="240" onerror="this.style.display='none'" style="image-orientation: from-image;"  />
			</g:link>
			
			<ol class="property-list material">

				<g:if test="${materialInstance?.category}">
					<li class="fieldcontain">
						<span id="category-label" class="property-label"><g:message code="material.category.label" default="Category" /></span>

						<span class="property-value" aria-labelledby="category-label"><g:fieldValue bean="${materialInstance}" field="category"/></span>

					</li>
				</g:if>

				<li class="fieldcontain">
					<span id="id-label" class="property-label"><g:message code="material.id.label" default="Material No." /></span>
					
						<span class="property-value" aria-labelledby="id-label"><g:fieldValue bean="${materialInstance}" field="id"/></span>
					
				</li>


			

			
				<g:if test="${materialInstance?.i}">
				<li class="fieldcontain">
					<span id="i-label" class="property-label"><g:message code="material.i.label" default="I" /></span>
					
						<span class="property-value" aria-labelledby="i-label"><g:fieldValue bean="${materialInstance}" field="i"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialInstance?.descr}">
				<li class="fieldcontain">
					<span id="descr-label" class="property-label"><g:message code="material.descr.label" default="Descr" /></span>
					
						<span class="property-value" aria-labelledby="descr-label"><g:fieldValue bean="${materialInstance}" field="descr"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialInstance?.poText}">
				<li class="fieldcontain">
					<span id="poText-label" class="property-label"><g:message code="material.poText.label" default="Po Text" /></span>
					
						<span class="property-value" aria-labelledby="poText-label"><g:fieldValue bean="${materialInstance}" field="poText"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialInstance?.uom}">
				<li class="fieldcontain">
					<span id="uom-label" class="property-label"><g:message code="material.uom.label" default="Uom" /></span>
					
						<span class="property-value" aria-labelledby="uom-label"><g:fieldValue bean="${materialInstance}" field="uom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialInstance?.location}">
				<li class="fieldcontain">
					<span id="location-label" class="property-label"><g:message code="material.location.label" default="Location" /></span>
					
						<span class="property-value" aria-labelledby="location-label"><g:fieldValue bean="${materialInstance}" field="location"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialInstance?.min}">
				<li class="fieldcontain">
					<span id="min-label" class="property-label"><g:message code="material.min.label" default="Min" /></span>
					
						<span class="property-value" aria-labelledby="min-label"><g:fieldValue bean="${materialInstance}" field="min"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialInstance?.max}">
				<li class="fieldcontain">
					<span id="max-label" class="property-label"><g:message code="material.max.label" default="Max" /></span>
					
						<span class="property-value" aria-labelledby="max-label"><g:fieldValue bean="${materialInstance}" field="max"/></span>
					
				</li>
				</g:if>
			
			
				<g:if test="${materialInstance?.sapQty}">
				<li class="fieldcontain">
					<span id="sapQty-label" class="property-label"><g:message code="material.sapQty.label" default="Sap Qty" /></span>
					
						<span class="property-value" aria-labelledby="sapQty-label"><g:fieldValue bean="${materialInstance}" field="sapQty"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialInstance?.pricePerUnit}">
				<li class="fieldcontain">
					<span id="pricePerUnit-label" class="property-label"><g:message code="material.pricePerUnit.label" default="Price Per Unit" /></span>
					
						<span class="property-value" aria-labelledby="pricePerUnit-label"><g:fieldValue bean="${materialInstance}" field="pricePerUnit"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialInstance?.diff}">
				<li class="fieldcontain">
					<span id="diff-label" class="property-label"><g:message code="material.diff.label" default="Diff" /></span>
					
						<span class="property-value" aria-labelledby="diff-label"><g:fieldValue bean="${materialInstance}" field="diff"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialInstance?.diffBaht}">
				<li class="fieldcontain">
					<span id="diffBaht-label" class="property-label"><g:message code="material.diffBaht.label" default="Diff Baht" /></span>
					
						<span class="property-value" aria-labelledby="diffBaht-label"><g:fieldValue bean="${materialInstance}" field="diffBaht"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialInstance?.cc}">
				<li class="fieldcontain">
					<span id="cc-label" class="property-label"><g:message code="material.cc.label" default="Cc" /></span>
					
						<span class="property-value" aria-labelledby="cc-label"><g:fieldValue bean="${materialInstance}" field="cc"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="material.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${materialInstance}" field="amount"/></span>
					
				</li>
				</g:if>

				<g:if test="${materialInstance?.typeNo}">
					<li class="fieldcontain">
						<span id="typeNo-label" class="property-label"><g:message code="material.typeNo.label" default="Type No" /></span>

						<span class="property-value" aria-labelledby="typeNo-label"><g:fieldValue bean="${materialInstance}" field="typeNo"/></span>

					</li>
				</g:if>

				<g:if test="${materialInstance?.haveImage1}">
					<li class="fieldcontain">
						<span id="haveImage1-label" class="property-label"><g:message code="material.haveImage1.label" default="Have Image1" /></span>

						<span class="property-value" aria-labelledby="typeNo-label"><g:fieldValue bean="${materialInstance}" field="haveImage1"/></span>

					</li>
				</g:if>

					<li class="fieldcontain">
						<span id="haveImage2-label" class="property-label"><g:message code="material.haveImage2.label" default="Have Image2" /></span>

						<span class="property-value" aria-labelledby="typeNo-label"><g:fieldValue bean="${materialInstance}" field="haveImage2"/></span>

					</li>

				
			
			</ol>
			<g:form url="[resource:materialInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${materialInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
