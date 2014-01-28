<%@ page import="fr.ps.porteaporte.User" %>


<div class="form-group">
  <label for="username" class="col-sm-2 control-label"><g:message code="user.username.label" default="Email" /></label>
  <div class="col-sm-10">
    <input type="email" class="form-control" name="username" id="username" value="${userInstance?.username}">
  </div>
</div>

<div class="form-group">
  <label for="prenom" class="col-sm-2 control-label"><g:message code="user.prenom.label" default="Prénom" /></label>
  <div class="col-sm-10">
    <input type="text" class="form-control" name="prenom" id="prenom" value="${userInstance?.prenom}">
  </div>
</div>

<div class="form-group">
  <label for="nom" class="col-sm-2 control-label"><g:message code="user.nom.label" default="Nom" /></label>
  <div class="col-sm-10">
    <input type="text" class="form-control" name="nom" id="nom" value="${userInstance?.nom}">
  </div>
</div>

<div class="form-group">
  <label for="nom" class="col-sm-2 control-label"><g:message code="user.password.label" default="Nom" /></label>
  <div class="col-sm-10">
    <input type="password" class="form-control" name="password" id="password" value="${userInstance?.password}">
  </div>
</div>

<div class="form-group">
	<label for="role_id" class="col-sm-2 control-label"><g:message code="user.habilitation.label"/></label>
	<div class="col-sm-10">
		<select class="form-control" name="role_id">
			<g:each var="role" in="${fr.ps.porteaporte.Role.list(sort:"authority")}"> 
				<option value="${role.id}">${role.authority}</option>
			</g:each>
		</select>
	</div> 
</div>

<div class="form-group">
	<div class="col-sm-offset-2 col-sm-10">
		<div class="checkbox">
        	<label>
          		<input type="checkbox"  name="enabled" id="enabled" ${userInstance?.enabled ? "checked" : "" }> <g:message code="user.enabled.label"/>
        	</label>
      	</div>
	</div>
</div>



	



