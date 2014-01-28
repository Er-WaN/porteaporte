
<%@ page import="fr.ps.porteaporte.Seance"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'seance.label', default: 'Seance')}" />
<title>PAP - <g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

	<ul class="nav nav-tabs"
		style="margin-bottom: 30px; display: inline-block">
		<g:if test="${seanceInstance?.etat == 1}">
			<li class="active"><g:link class="list" action="index">Séances Initialisées</g:link></li>
			<li><g:link class="list" action="indexClotures">Séances Cloturées</g:link></li>
		</g:if>
		<g:elseif test="${seanceInstance?.etat == 2}">
			<li><g:link class="list" action="index">Séances Initialisées</g:link></li>
			<li class="active"><g:link class="list" action="indexClotures">Séances Cloturées</g:link></li>
		</g:elseif>
	</ul>

	<div style="float: right; margin-top: 50px; display: inline-block">
		<ul class="nav nav-pills">
			<li><g:link class="list" action="index">Liste des séances</g:link></li>
			<li><g:link class="create" action="create">Ajouter une séance</g:link></li>
		</ul>
	</div>

	<div id="show-seance" class="content scaffold-show" role="main">
		<h1>
			<g:message code="seance.show.label" args="[entityName]" />
			du
			<g:formatDate date="${seanceInstance.dateSeance}" format="dd/MM/yyyy" />
		</h1>
		<g:if test="${flash.message}">
			<div class="alert alert-success">
				${flash.message}
			</div>
		</g:if>


		<ol class="property-list seance">

			<br />
			<form class="form-horizontal" role="form">
				<div class="form-group">
					<label class="col-sm-2 control-label" style="width: 300px;">Date
						: </label>
					<div class="col-sm-10" style="width: 250px">
						<p class="form-control-static">
							<g:formatDate date="${seanceInstance.dateSeance}"
								format="dd/MM/yyyy" />
						</p>
					</div>
				</div>
			</form>

			<form class="form-horizontal" role="form">
				<div class="form-group">
					<label class="col-sm-2 control-label" style="width: 300px;">Quartier
						: </label>
					<div class="col-sm-10" style="width: 250px">
						<p class="form-control-static">
							${seanceInstance?.quartier?.nom}
						</p>
					</div>
				</div>
			</form>

			<form class="form-horizontal" role="form">
				<div class="form-group">
					<label class="col-sm-2 control-label" style="width: 300px;">Résidence
						: </label>
					<div class="col-sm-10" style="width: 250px">
						<p class="form-control-static">
							${seanceInstance?.residence}
						</p>
					</div>
				</div>
			</form>

			<form class="form-horizontal" role="form">
				<div class="form-group">
					<label class="col-sm-2 control-label" style="width: 300px;">Rue
						: </label>
					<div class="col-sm-10" style="width: 250px">
						<p class="form-control-static">
							${seanceInstance?.rue}
						</p>
					</div>
				</div>
			</form>

			<form class="form-horizontal" role="form">
				<div class="form-group">
					<label class="col-sm-2 control-label" style="width: 300px;">Createur
						: </label>
					<div class="col-sm-10" style="width: 250px">
						<p class="form-control-static">
							${seanceInstance?.createur?.prenom}
							${seanceInstance?.createur?.nom}
						</p>
					</div>
				</div>
			</form>

			<form class="form-horizontal" role="form">
				<div class="form-group">
					<label class="col-sm-2 control-label" style="width: 300px;">Etat
						: </label>
					<div class="col-sm-10" style="width: 250px">
						<p class="form-control-static">
							<g:if test="${seanceInstance?.etat == 1}">
							Initialisée
							</g:if>
							<g:elseif test="${seanceInstance?.etat == 2}">
							Cloturée</g:elseif>
						</p>
					</div>
				</div>
			</form>

			<form class="form-horizontal" role="form">
				<div class="form-group">
					<label class="col-sm-2 control-label" style="width: 300px;">Commentaire
						initial : </label>
					<div class="col-sm-10" style="width: 550px">
						<p class="form-control-static">
							${seanceInstance.commentaire}
						</p>
					</div>
				</div>
			</form>

			<g:if test="${seanceInstance?.etat == 2}">


				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label class="col-sm-2 control-label" style="width: 300px;">Nombre
							de portes frappées : </label>
						<div class="col-sm-10" style="width: 250px">
							<p class="form-control-static">
								${seanceInstance.nombrePorteFrappes}
							</p>
						</div>
					</div>
				</form>

				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label class="col-sm-2 control-label" style="width: 300px;">Nombre
							de portes ouvertes : </label>
						<div class="col-sm-10" style="width: 250px">
							<p class="form-control-static">
								${seanceInstance.nombrePorteOuvertes}
							</p>
						</div>
					</div>
				</form>

				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label class="col-sm-2 control-label" style="width: 300px;">Nombre
							de questionnaires : </label>
						<div class="col-sm-10" style="width: 250px">
							<p class="form-control-static">
								${seanceInstance.nombreQuestionnaires}
							</p>
						</div>
					</div>
				</form>



				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label class="col-sm-2 control-label" style="width: 300px;">Commentaire
							final : </label>
						<div class="col-sm-10" style="width: 550px">
							<p class="form-control-static">
								${seanceInstance.commentaire_cloture}
							</p>
						</div>
					</div>
				</form>
			</g:if>
			
			<g:if test="${seanceInstance.etat == 1}">
		<div style="float: right; margin-bottom: 20px">
			<a class="btn btn-primary"
				href="../cloturer/${seanceInstance.id}" role="button"
				>Cloturer</a>
		</div>
	</g:if>
			<br />
			<h3>Liste des participants</h3>

			<table class="table">
				<thead>
					<tr>

						<th>Prénom</>
						<th>Nom</>
						<th>Email</>
						<th>Téléphone</>
						<th>Commentaire</>
					</tr>
				</thead>
				<tbody>
					<g:each in="${seanceInstance.participant}" status="i"
						var="participant">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

							<td>
								${fieldValue(bean: participant, field: "prenom")}
							</td>

							<td>
								${fieldValue(bean: participant, field: "nom")}
							</td>

							<td>
								${fieldValue(bean: participant, field: "email")}
							</td>

							<td>
								${fieldValue(bean: participant, field: "phone")}
							</td>
							<td
								title="${fieldValue(bean: participant, field: "commentaire")}">
								${fieldValue(bean: participant, field: "commentaire")}
							</td>
						</tr>
					</g:each>
				</tbody>
			</table>
	</div>
	
</body>
</html>
