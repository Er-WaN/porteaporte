
<%@ page import="fr.ps.porteaporte.InscriptionSeance"%>
<!DOCTYPE html>
<html>
<head>
<g:set var="entityName"
	value="${message(code: 'inscriptionSeance.label', default: 'InscriptionSeance')}" />
<title>PAP - <g:message code="default.list.label" args="[entityName]" /></title>
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'font-awesome.min.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'bootswatch.min.css')}"
	type="text/css">
</head>
<body>
	<div>
		<div class="container">
			<div
				style="background-color: #eee; border-radius: 6px; padding: 48px;">
				<div id="list-seance" class="content scaffold-list" role="main">
					<h2>
						<g:message code="seance.list.label" args="[entityName]" />
					</h2>

					<g:if test='${flash.message}'>
						<div class="alert alert-success">
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

								<th></th>

							</tr>
						</thead>
						<tbody>
							<g:each in="${seanceInstanceList}" status="i"
								var="seanceInstance">
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

									<td><g:formatDate date="${seanceInstance.dateSeance}"
											format="dd/MM/yyyy HH:mm" /></td>

									<td>
										${fieldValue(bean: seanceInstance, field: "quartier.nom")}
									</td>

									<td>
									<a class="btn btn-primary"
										href="/inscriptionSeance/participer/${seanceInstance.id}"
										role="button">Participer</a></td>

								</tr>
							</g:each>
						</tbody>
					</table>
					<div class="pagination">
						<g:paginate total="${seanceInstanceCount ?: 0}" />
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
