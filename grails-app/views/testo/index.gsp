<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">

		<title>test upload</title>
	</head>
	<body>
		
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-material" class="content scaffold-create" role="main">


			<g:form action="upload" >
				<div>
					<label for="name">
						name
						
					</label>
					<g:textField name="name" maxlength="5" />
				
				</div>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
