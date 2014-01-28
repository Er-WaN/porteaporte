
<%@ page import="fr.ps.porteaporte.Digicode"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'digicode.label', default: 'Digicode')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

	<div style="float: right; padding-bottom: 10px ">
		<ul class="nav nav-pills" style="padding-bottom: 0px; margin-bottom: 0px" >
			<li class="active"><g:link class="list" action="index">Liste des digicodes</g:link></li>
			<li><g:link class="create" action="create">Ajouter un  digicode</g:link></li>
		</ul>
	</div>
	
	<div id="list-digicode" class="content scaffold-list" role="main" style="padding-top:50px">
		<h2>Liste des digicodes</h2>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				<div class="alert alert-success">${flash.message}</div>
			</div>
		</g:if>
		<table class="table" style="width: 100%">
			<thead>
				<tr>

					<g:sortableColumn property="adresse" title="Adresse"
						style="width: 32%" />

					<g:sortableColumn property="residence" title="Résidence"
						style="width: 23%" />

					<g:sortableColumn property="porte" title="Porte"
						style="width: 10%" />

					<g:sortableColumn property="digicode" title="Digicode"
						style="width: 15%" />
						
					<th style="width: 25%"></th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${digicodeInstanceList}" status="i"
					var="digicodeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td>
							${fieldValue(bean: digicodeInstance, field: "adresse")}
						</td>

						<td>
							${fieldValue(bean: digicodeInstance, field: "residence")}
						</td>

						<td>
							${fieldValue(bean: digicodeInstance, field: "porte")}
						</td>

						<td>
							${fieldValue(bean: digicodeInstance, field: "code")}
						</td>
						
						<td><g:form url="[resource:digicodeInstance, action:'delete']"
								method="DELETE" style="float: right">
								<a class="btn btn-primary btn-sm"
									href="${createLink(action: 'edit', id: digicodeInstance.id)}"
									role="button">Modifier</a>
								<button class="btn btn-primary btn-sm" type="submit"
									name="_action_delete" role="button" onclick="return confirm(&#39;Etes vous sur?&#39;);">Supprimer</a>
							</g:form></td>
					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${digicodeInstanceCount ?: 0}" />
		</div>
	</div>
</body>
</html>
