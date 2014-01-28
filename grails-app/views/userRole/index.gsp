
<%@ page import="fr.ps.porteaporte.UserRole" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userRole.label', default: 'UserRole')}" />
		<title><g:message code="userrole.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-userRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="userrole.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-userRole" class="content scaffold-list" role="main">
			<h1><g:message code="userrole.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						<th><g:message code="userrole.user.label" default="User" /></th>
						
						<th><g:message code="userrole.role.label" default="Role" /></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${userRoleInstanceList}" status="i" var="userRoleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userRoleInstance.id}">${userRoleInstance.user.prenom} ${userRoleInstance.user.nom}</g:link></td>
					
						<td>${userRoleInstance.role.authority}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userRoleInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
