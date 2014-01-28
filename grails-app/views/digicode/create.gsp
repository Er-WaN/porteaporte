<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'digicode.label', default: 'Digicode')}" />
<title>PAP - <g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>
	<div style="float: right; margin-top: 0px;padding-bottom: 10px ">
		<ul class="nav nav-pills" style="padding-bottom: 0px; margin-bottom: 0px">
			<li><g:link class="list" action="index">Liste des digicodes</g:link></li>
			<li class="active"><g:link class="create" action="create">Ajouter un digicode</g:link></li>
		</ul>
	</div>

	<div id="create-digicode" class="content scaffold-create" role="main" style="padding-bottom: 0px; margin-top: 70px">
		<h2>
			Ajout d'un nouveau digicode
		</h2>
		<g:if test="${flash.message}">
			<div class="alert alert-danger">{flash.message}</div>
		</g:if>
		<g:hasErrors bean="${digicodeInstance}">
			<ul class="alert alert-danger">
				<g:eachError bean="${digicodeInstance}" var="error">
					<li style="margin-left: 20px"
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
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
<script>
	$(function() {
		window.prettyPrint && prettyPrint();
		$('#dp1').datepicker({
			format : 'mm-dd-yyyy'
		});
	});
</script>
</html>
