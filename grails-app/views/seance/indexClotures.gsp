
<%@ page import="fr.ps.porteaporte.Seance"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'seance.label', default: 'Seance')}" />
<title>PAP - <g:message code="seance.list.label" args="[entityName]" /></title>
</head>
<body>

	<ul class="nav nav-tabs"
		style="margin-bottom: 30px; display: inline-block">
		<li><g:link class="list" action="index">Séances Initialisées</g:link></li>
		<li class="active"><g:link class="list" action="indexClotures">Séances Cloturées</g:link></li>
	</ul>


	<div id="list-seance" class="content scaffold-list" role="main">
		<h2>Séances cloturées</h2>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<table class="table">
			<thead>
				<tr>

					<g:sortableColumn property="dateSeance"
						title="${message(code: 'seance.dateSeance.label')}" />

					<g:sortableColumn property="quartier"
						title="${message(code: 'seance.quartier.label')}" />

					<g:sortableColumn property="participant"
						title="${message(code: 'seance.participant.label')}" />

					<g:sortableColumn property="nombrePorteFrappes"
						title="${message(code: 'seance.nombrePorteFrappes.label')}" />

					<g:sortableColumn property="nombrePorteOuvertes"
						title="${message(code: 'seance.nombrePorteOuvertes.label')}" />

					<g:sortableColumn property="nombreQuestionnaires"
						title="${message(code: 'seance.nombreQuestionnaires.label')}" />

					<g:sortableColumn property="commentaire"
						title="${message(code: 'seance.commentaire.label')}" />

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
								${seanceInstance.participant.size()}
						</td>

						<td>
							${fieldValue(bean: seanceInstance, field: "nombrePorteFrappes")}
						</td>

						<td>
							${fieldValue(bean: seanceInstance, field: "nombrePorteOuvertes")}
						</td>

						<td>
							${fieldValue(bean: seanceInstance, field: "nombreQuestionnaires")}
						</td>
						
						<td>
							${fieldValue(bean: seanceInstance, field: "commentaire")}
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
