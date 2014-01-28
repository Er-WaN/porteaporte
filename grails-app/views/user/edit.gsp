<%@ page import="fr.ps.porteaporte.User"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="user.edit.label" args="[entityName]" />
	${userInstance.prenom} ${userInstance.nom}</title>
</head>
<body>
	<ul class="nav nav-pills">
		<li><g:link class="list" action="index">Liste des utilisateurs</g:link></li>
		<li><g:link class="create" action="create">Ajouter un utilisateur</g:link></li>
	</ul>

	<div id="edit-user" class="content scaffold-edit" role="main">
		<h1>
			<g:message code="user.edit.label" args="[entityName]" />
			${userInstance.prenom}
			${userInstance.nom}
		</h1>
		<g:if test="${flash.message}">
			<div class="alert alert-danger">{flash.message}</div>
		</g:if>
		<g:hasErrors bean="${userInstance}">
			<ul class="alert alert-danger">
				<g:eachError bean="${userInstance}" var="error">
					<li style="margin-left: 20px"
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<div
			style="width: 750px; margin: auto; padding: auto; margin-top: 40px">
			<g:form url="[resource:userInstance, action:'update']" method="PUT"
				class="form-horizontal" role="form">
				<g:hiddenField name="version" value="${userInstance?.version}" />
				<div class="form-group">
					<label for="username" class="col-sm-2 control-label"><g:message
							code="user.username.label" default="Email" /></label>
					<div class="col-sm-10">
						<input type="email" class="form-control" name="username"
							id="username" value="${userInstance?.username}">
					</div>
				</div>

				<div class="form-group">
					<label for="prenom" class="col-sm-2 control-label"><g:message
							code="user.prenom.label" default="Prénom" /></label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="prenom" id="prenom"
							value="${userInstance?.prenom}">
					</div>
				</div>

				<div class="form-group">
					<label for="nom" class="col-sm-2 control-label"><g:message
							code="user.nom.label" default="Nom" /></label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="nom" id="nom"
							value="${userInstance?.nom}">
					</div>
				</div>

				<div class="form-group">
					<label for="password" class="col-sm-2 control-label"><g:message
							code="user.password.label" default="Password" /></label>
					<div class="col-sm-10">
						<input type="password" class="form-control" name="password"
							id="password" value="${userInstance?.password}">
					</div>
				</div>

				<div class="form-group">
					<label for="role_id" class="col-sm-2 control-label"><g:message
							code="user.habilitation.label" /></label>
					<div class="col-sm-10">
						<select class="form-control" name="role_id">

							<g:each var="role"
								in="${fr.ps.porteaporte.Role.list(sort:"authority")}">
								<%
		  		   					fr.ps.porteaporte.UserRole r = fr.ps.porteaporte.UserRole.find{user == userInstance}
		  		   				%>
								<g:if test="${r.role.authority == role.authority}">
									<option selected="selected" value="${role.id}">
										${role.authority}
									</option>
								</g:if>
								<g:else>
									<option value="${role.id}">
										${role.authority}
									</option>
								</g:else>

							</g:each>
						</select>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="checkbox">
							<label> <input type="checkbox" name="enabled"
								id="enabled" ${userInstance?.enabled ? "checked" : "" }>
								<g:message code="user.enabled.label" />
							</label>
						</div>
					</div>
				</div>

				<fieldset class="buttons">
					<g:actionSubmit class="btn btn-primary btn-lg" action="update"
						value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</div>
</body>
</html>
