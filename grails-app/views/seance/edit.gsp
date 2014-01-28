<%@ page import="fr.ps.porteaporte.Seance" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'seance.label', default: 'Seance')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		
<ul class="nav nav-tabs"
		style="margin-bottom: 30px; display: inline-block">
		<li><g:link class="list" action="index">Séances Initialisées</g:link></li>
		<li><g:link class="list" action="indexClotures">Séances Cloturées</g:link></li>
	</ul>

	<div style="float: right; margin-top: 50px; display: inline-block">
		<ul class="nav nav-pills">
			<li><g:link class="list" action="index">Liste des séances</g:link></li>
			<li class="active"><g:link class="create" action="create">Ajouter une séance</g:link></li>
		</ul>
	</div>

		<div id="edit-seance" class="content scaffold-edit" role="main">
			<h1><g:message code="seance.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${seanceInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${seanceInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<div
			style="width: 750px; margin: auto; padding: auto; margin-top: 40px">
			<g:form url="[resource:seanceInstance, action:'save']"
				class="form-horizontal" role="form">
				<g:render template="form" />
				<fieldset class="buttons">
					<g:submitButton class="btn btn-primary btn-lg" name="edit"
						value="${message(code: 'default.button.create.label', default: 'Edit')}" />
				</fieldset>
			</g:form>
		</div>
		</div>
	</body>
</html>
