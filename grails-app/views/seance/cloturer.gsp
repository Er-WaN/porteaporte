<%@ page import="fr.ps.porteaporte.Seance"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'seance.label', default: 'Seance')}" />
<title>PAP - Cloturer la séance</title>
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
			<li><g:link class="create" action="create">Ajouter une séance</g:link></li>
		</ul>
	</div>
	<div id="edit-seance" class="content scaffold-edit" role="main">
		<h2>
			Cloturer la séance du
			<g:formatDate date="${seanceInstance.dateSeance}" format="dd/MM/yyyy" />
		</h2>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${seanceInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${seanceInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>

		<div
			style="width: 750px; margin: auto; padding: auto; margin-top: 40px">
			<g:form url="[resource:seanceInstance, action:'update']" method="PUT"
				class="form-horizontal" role="form">
				<g:hiddenField name="version" value="${seanceInstance?.version}" />
				<g:render template="form_cloturer" />
				<fieldset class="buttons">
					<g:actionSubmit class="btn btn-primary" style="float: right;" action="update_cloturer"
						value="Cloturer la séance" />
				</fieldset>
			</g:form>

		</div>
</body>
</html>
