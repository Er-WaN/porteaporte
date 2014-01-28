
<%@ page import="fr.ps.porteaporte.User"%>

<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="user.list.label" args="[entityName]" /></title>
</head>
<body>
	<ul class="nav nav-pills">
		<li class="active"><g:link class="list" action="index">Liste des utilisateurs</g:link></li>
		<li><g:link class="create" action="create">Ajouter un utilisateur</g:link></li>
	</ul>
	<div id="list-user" class="content scaffold-list" role="main">
		<g:if test="${flash.message}">
			<div class="alert alert-success" role="status">
				${flash.message}
			</div>
		</g:if>
		<table class="table">
			<thead>
				<tr>
					<g:sortableColumn property="prenom"
						title="${message(code: 'user.prenom.label', default: 'Prenom')}" style="width: 12%"/>

					<g:sortableColumn property="nom"
						title="${message(code: 'user.nom.label', default: 'Nom')}" style="width: 13%"/>

					<g:sortableColumn property="username"
						title="${message(code: 'user.username.label', default: 'Email')}" style="width: 25%"/>

					<th class="sortable" style="width: 15%">
						${message(code: 'user.habilitation.label', default: 'Habilitation')}
					</th>

					<g:sortableColumn property="enabled"
						title="${message(code: 'user.enabled.label', default: 'Enabled')}" style="width: 10%"/>

					<th style="width: 30%"></th>

				</tr>
			</thead>
			<tbody>
				<g:each in="${userInstanceList}" status="i" var="userInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td>
							${fieldValue(bean: userInstance, field: "prenom")}
						</td>

						<td>
							${fieldValue(bean: userInstance, field: "nom")}
						</td>

						<td>
							${fieldValue(bean: userInstance, field: "username")}
						</td>

						<%
							def query = "from UserRole ur where ur.user.id = ?"
							def userRole = fr.ps.porteaporte.UserRole.find(query, [userInstance.id])
						%>

						<td><g:if
								test="${userRole?.role?.authority == 'ROLE_ADMINISTRATEUR'}">
							Administrateur
							</g:if> <g:elseif test="${userRole?.role?.authority == 'ROLE_MILITANT'}">
							Militant
							</g:elseif></td>


						<td><g:if test="${userInstance.enabled}">
								<img src="${resource(dir: 'images', file: 'check.png')}"
									alt="oui" />
							</g:if> <g:else>
								<img src="${resource(dir: 'images', file: 'uncheck.png')}"
									alt="non" />
							</g:else></td>

						<td><g:form url="[resource:userInstance, action:'delete']"
								method="DELETE" style="float: right">
								<a class="btn btn-primary btn-sm"
									href="${createLink(action: 'edit', id: userInstance.id)}"
									role="button">Modifier</a>
								<button class="btn btn-primary btn-sm" type="submit"
									name="_action_delete" role="button" onclick="return confirm(&#39;Etes vous sur?&#39;);">Supprimer</a>
							</g:form></td>
					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${userInstanceCount ?: 0}" />
		</div>
	</div>
</body>
</html>
