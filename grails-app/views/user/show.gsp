
<%@ page import="fr.ps.porteaporte.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="user.show.label" args="[entityName]" /> ${userInstance.prenom} ${userInstance.nom}</title>
	</head>
	<body>
		<div id="show-user" class="content scaffold-show" role="main">
			<h1><g:message code="user.show.label" args="[entityName]" /> ${userInstance.prenom} ${userInstance.nom}</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list user">
			
				<g:if test="${userInstance?.username}">
				<li class="fieldcontain">
					<span id="username" class="property-label"><g:message code="user.username.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="username-label"> : <g:fieldValue bean="${userInstance}" field="username"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${userInstance?.prenom}">
				<li class="fieldcontain">
					<span id="prenom-label" class="property-label"><g:message code="user.prenom.label" default="Prenom" /></span>
					
						<span class="property-value" aria-labelledby="prenom-label"> : <g:fieldValue bean="${userInstance}" field="prenom"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${userInstance?.nom}">
				<li class="fieldcontain">
					<span id="nom-label" class="property-label"><g:message code="user.nom.label" default="Nom" /></span>
					
						<span class="property-value" aria-labelledby="nom-label"> : <g:fieldValue bean="${userInstance}" field="nom"/></span>
					
				</li>
				</g:if>
				 
				 <%
				 	def query = "from UserRole ur where ur.user.id = ?"
					def userRole = fr.ps.porteaporte.UserRole.find(query, [userInstance.id])
				 %>
				 
				<g:if test="${userRole?.role}">
				<li class="fieldcontain">
					<span id="nom-label" class="property-label"><g:message code="user.habilitation.label" default="Habilitation" /></span>
					
						<span class="property-value" aria-labelledby="habilitation-label"> : ${userRole.role.authority}</span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.enabled}">
				<li class="fieldcontain">
					<span style="padding-right:10px" id="enabled-label" class="property-label"><g:message code="user.enabled.label" default="Enabled" />:</span>
					
						<span class="property-value" aria-labelledby="enabled-label">
							<g:if test="${userInstance.enabled}" >
								<img src="${resource(dir: 'images', file: 'check.png')}" alt="oui"/>
							</g:if>
							<g:else>
								<img src="${resource(dir: 'images', file: 'uncheck.png')}" alt="non"/>
							</g:else>
						</span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:userInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${userInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
