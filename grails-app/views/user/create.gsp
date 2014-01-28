<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="user.create.label" args="[entityName]" /></title>
</head>
<body>
	<ul class="nav nav-pills">
		<li><g:link class="list" action="index">Liste des utilisateurs</g:link></li>
		<li class="active"><g:link class="create" action="create">Ajouter un utilisateur</g:link></li>
	</ul>

	<div id="create-user" class="content scaffold-create" role="main">
		<h1>
			<g:message code="user.create.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="alert alert-danger">{flash.message}</div>
		</g:if>
		<g:hasErrors bean="${userInstance}">
			<ul class="alert alert-danger">
				<g:eachError bean="${userInstance}" var="error">
					<li style="margin-left: 20px"
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<div
			style="width: 750px; margin: auto; padding: auto; margin-top: 40px">
			<g:form url="[resource:userInstance, action:'save']"
				class="form-horizontal" role="form">
				<g:render template="form" />
				<fieldset class="buttons">
					<g:submitButton class="btn btn-primary btn-lg" name="create"
						value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</div>
</body>
</html>
