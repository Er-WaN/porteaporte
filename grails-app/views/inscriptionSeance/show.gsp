
<%@ page import="fr.ps.porteaporte.InscriptionSeance" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inscriptionSeance.label', default: 'InscriptionSeance')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-inscriptionSeance" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-inscriptionSeance" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list inscriptionSeance">
			
				<g:if test="${inscriptionSeanceInstance?.commentaire}">
				<li class="fieldcontain">
					<span id="commentaire-label" class="property-label"><g:message code="inscriptionSeance.commentaire.label" default="Commentaire" /></span>
					
						<span class="property-value" aria-labelledby="commentaire-label"><g:fieldValue bean="${inscriptionSeanceInstance}" field="commentaire"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inscriptionSeanceInstance?.dateInscription}">
				<li class="fieldcontain">
					<span id="dateInscription-label" class="property-label"><g:message code="inscriptionSeance.dateInscription.label" default="Date Inscription" /></span>
					
						<span class="property-value" aria-labelledby="dateInscription-label"><g:formatDate date="${inscriptionSeanceInstance?.dateInscription}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${inscriptionSeanceInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="inscriptionSeance.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${inscriptionSeanceInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inscriptionSeanceInstance?.nom}">
				<li class="fieldcontain">
					<span id="nom-label" class="property-label"><g:message code="inscriptionSeance.nom.label" default="Nom" /></span>
					
						<span class="property-value" aria-labelledby="nom-label"><g:fieldValue bean="${inscriptionSeanceInstance}" field="nom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inscriptionSeanceInstance?.prenom}">
				<li class="fieldcontain">
					<span id="prenom-label" class="property-label"><g:message code="inscriptionSeance.prenom.label" default="Prenom" /></span>
					
						<span class="property-value" aria-labelledby="prenom-label"><g:fieldValue bean="${inscriptionSeanceInstance}" field="prenom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${inscriptionSeanceInstance?.seance}">
				<li class="fieldcontain">
					<span id="seance-label" class="property-label"><g:message code="inscriptionSeance.seance.label" default="Seance" /></span>
					
						<span class="property-value" aria-labelledby="seance-label"><g:fieldValue bean="${inscriptionSeanceInstance}" field="seance"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:inscriptionSeanceInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${inscriptionSeanceInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
