
<%@ page import="fr.ps.porteaporte.Digicode" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'digicode.label', default: 'Digicode')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-digicode" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-digicode" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list digicode">
			
				<g:if test="${digicodeInstance?.adresse}">
				<li class="fieldcontain">
					<span id="adresse-label" class="property-label"><g:message code="digicode.adresse.label" default="Adresse" /></span>
					
						<span class="property-value" aria-labelledby="adresse-label"><g:fieldValue bean="${digicodeInstance}" field="adresse"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${digicodeInstance?.residence}">
				<li class="fieldcontain">
					<span id="residence-label" class="property-label"><g:message code="digicode.residence.label" default="Residence" /></span>
					
						<span class="property-value" aria-labelledby="residence-label"><g:fieldValue bean="${digicodeInstance}" field="residence"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${digicodeInstance?.porte}">
				<li class="fieldcontain">
					<span id="porte-label" class="property-label"><g:message code="digicode.porte.label" default="Porte" /></span>
					
						<span class="property-value" aria-labelledby="porte-label"><g:fieldValue bean="${digicodeInstance}" field="porte"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${digicodeInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="digicode.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${digicodeInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:digicodeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${digicodeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
