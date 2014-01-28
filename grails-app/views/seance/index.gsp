
<%@ page import="fr.ps.porteaporte.Seance"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'seance.label', default: 'Seance')}" />
<title>PAP - <g:message code="seance.list.label"
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
			<li class="active"><g:link class="list" action="index">Liste des séances</g:link></li>
			<li><g:link class="create" action="create">Ajouter une séance</g:link></li>
		</ul>
	</div>

	<div id="list-seance" class="content scaffold-list" role="main">
		<h2>Séances initialisées</h2>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				<div class="alert alert-danger">${flash.message}</div>
			</div>
		</g:if>
		<table class="table">
			<thead>
				<tr>

					<g:sortableColumn property="dateSeance"
						title="${message(code: 'seance.dateSeance.label')}" style="width: 150px"/>

					<g:sortableColumn property="quartier"
						title="${message(code: 'seance.quartier.label')}" />

					<g:sortableColumn property="residence"
						title="${message(code: 'seance.residence')}" />

					<g:sortableColumn property="rue"
						title="${message(code: 'seance.rue')}" />

					<g:sortableColumn property="participant"
						title="${message(code: 'seance.participant.label')}" style="width: 100px"/>

					<th></th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${seanceInstanceList}" status="i" var="seanceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${seanceInstance.id}">
								<g:formatDate date="${seanceInstance.dateSeance}"
									format="dd/MM/yyyy HH:mm" />
							</g:link></td>

						<td>
							${fieldValue(bean: seanceInstance, field: "quartier.nom")}
						</td>
						
						<td>
							${fieldValue(bean: seanceInstance, field: "residence")}
						</td>
						
						<td>
							${fieldValue(bean: seanceInstance, field: "rue")}
						</td>

						<td><span> ${seanceInstance.participant.size()}
						</span></td>

						<td><g:form url="[resource:seanceInstance, action:'delete']"
								method="DELETE" style="float: right">
								<a class="btn btn-primary btn-sm"
									href="${createLink(action: 'edit', id: seanceInstance.id)}"
									role="button">Modifier</a>
									<a class="btn btn-primary btn-sm"
									href="${createLink(action: 'cloturer', id: seanceInstance.id)}"
									role="button">Cloturer</a>
								<button class="btn btn-primary btn-sm" type="submit"
									name="_action_delete" role="button" onclick="return confirm(&#39;Etes vous sur?&#39;);">Supprimer</a>
							</g:form>
						</td>
					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${seanceInstanceCount ?: 0}" />
		</div>
	</div>
</body>
</html>
