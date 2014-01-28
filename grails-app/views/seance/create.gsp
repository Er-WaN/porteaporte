<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'seance.label', default: 'Seance')}" />
<title>PAP - <g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>

	<ul class="nav nav-tabs"
		style="margin-bottom: 30px; display: inline-block">
		<li class="active"><g:link class="list" action="index">Séances Initialisées</g:link></li>
		<li><g:link class="list" action="indexClotures">Séances Cloturées</g:link></li>
	</ul>

	<div style="float: right; margin-top: 50px; display: inline-block">
		<ul class="nav nav-pills">
			<li><g:link class="list" action="index">Liste des séances</g:link></li>
			<li class="active"><g:link class="create" action="create">Ajouter une séance</g:link></li>
		</ul>
	</div>

	<div id="create-seance" class="content scaffold-create" role="main">
		<h2>
			<g:message code="seance.create.label" args="[entityName]" />
		</h2>
		<g:if test="${flash.message}">
			<div class="alert alert-danger">{flash.message}</div>
		</g:if>
		<g:hasErrors bean="${seanceInstance}">
			<ul class="alert alert-danger">
				<g:eachError bean="${seanceInstance}" var="error">
					<li style="margin-left: 20px"
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>

		<div
			style="width: 750px; margin: auto; padding: auto; margin-top: 40px">
			<g:form url="[resource:seanceInstance, action:'save']"
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
<script>
	$(function() {
		window.prettyPrint && prettyPrint();
		$('#dp1').datepicker({
			format : 'mm-dd-yyyy'
		});
	});
</script>
</html>
