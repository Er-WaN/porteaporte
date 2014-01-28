<%@ page import="fr.ps.porteaporte.Quartier" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'quartier.label', default: 'Quartier')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-quartier" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="quartier.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="quartier.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-quartier" class="content scaffold-edit" role="main">
			<h1><g:message code="quartier.edit.label" args="[entityName]" /><g:fieldValue bean="${quartierInstance}" field="nom"/></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${quartierInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${quartierInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:quartierInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${quartierInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
