<%@ page import="fr.ps.porteaporte.Digicode" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'digicode.label', default: 'Digicode')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<div style="float: right; padding-bottom: 10px; ">
		<ul class="nav nav-pills" style="padding-bottom: 0px; margin-bottom: 0px" >
			<li class="active"><g:link class="list" action="index">Liste des digicodes</g:link></li>
			<li><g:link class="create" action="create">Ajouter un  digicode</g:link></li>
		</ul>
	</div>
		
		<div id="edit-digicode" class="content scaffold-edit" role="main" style="margin-top: 50px">
			<h1>Modifier digicode</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${digicodeInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${digicodeInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<div
			style="width: 750px; margin: auto; padding: auto; margin-top: 40px">
			<g:form url="[resource:digicodeInstance, action:'save']"
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
