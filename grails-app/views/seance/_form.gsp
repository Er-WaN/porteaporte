<%@ page import="fr.ps.porteaporte.Seance" %>


<div class="form-group" ${hasErrors(bean: seanceInstance, field: 'dateSeance', 'error')} required">
	<label for="dateSeance" class="col-sm-2 control-label" >
		<g:message code="seance.dateSeance.label" default="Date de la séance" />
		<span class="required-indicator"></span>
	</label>
	<div class="col-sm-10">
		<input type="hidden" name="dateSeance" value="date.struct">
		<select name="dateSeance_day" class="form-control" id="dateSeance_day" style="width: 70px; display: inline">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
			<option value="13">13</option>
			<option value="14">14</option>
			<option value="15">15</option>
			<option value="16">16</option>
			<option value="17">17</option>
			<option value="18">18</option>
			<option value="19">19</option>
			<option value="20">20</option>
			<option value="21">21</option>
			<option value="22">22</option>
			<option value="23">23</option>
			<option value="24">24</option>
			<option value="25">25</option>
			<option value="26">26</option>
			<option value="27">27</option>
			<option value="28">28</option>
			<option value="29">29</option>
			<option value="30">30</option>
			<option value="31">31</option>
		</select>
		<select name="dateSeance_month" class="form-control" id="dateSeance_month" style="width: 120px; display: inline ">
			<option value="1">janvier</option>
			<option value="2">février</option>
			<option value="3">mars</option>
		</select>
		<select name="dateSeance_year" class="form-control" style="width: 100px; display: inline" id="dateSeance_year">
			<option value="2014">2014</option>
		</select> à
		<select name="dateSeance_hour" class="form-control" style="width: 70px; display: inline" id="dateSeance_hour">
			<option value="08">08</option>
			<option value="09">09</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
			<option value="13">13</option>
			<option value="14">14</option>
			<option value="15">15</option>
			<option value="16">16</option>
			<option value="17">17</option>
			<option value="18" selected="selected">18</option>
			<option value="19">19</option>
			<option value="20">20</option>
			<option value="21">21</option>
		</select> h
		<select name="dateSeance_minute" class="form-control" style="width: 70px ; display: inline" id="dateSeance_minute">
			<option value="00">00</option>
			<option value="15">15</option>
			<option value="30" selected="selected">30</option>
			<option value="45">45</option>
		</select>
	</div>
</div>

<%
	fr.ps.porteaporte.User u = fr.ps.porteaporte.User.find{username == session.SPRING_SECURITY_CONTEXT.authentication.principal.username}
%>

<div class="form-group ${hasErrors(bean: seanceInstance, field: 'createur', 'error')} required">
	<label for="createur" class="col-sm-2 control-label">
		<g:message code="seance.createur.label" default="Createur" />
		<span class="required-indicator"></span>
	</label>
	<div class="col-sm-10">
		<select name="createur.id" id="createur" class="form-control" style="width: 250px">
			<g:each in="${fr.ps.porteaporte.User.list()}" var="users">
				<option value="${users.id}">${users.prenom} ${users.nom}</option>
			</g:each>
		</select>
	</div>
</div>

<div class="form-group ${hasErrors(bean: seanceInstance, field: 'quartier', 'error')} required">
	<label for="quartier" class="col-sm-2 control-label">
		<g:message code="seance.quartier.label" default="Quartier" />
		<span class="required-indicator"></span>
	</label>
	<div class="col-sm-10">
		<select name="quartier.id" id="quartier" class="form-control" style="width: 250px">
			<g:each in="${fr.ps.porteaporte.Quartier.list()}" var="quartier">
				<option value="${quartier.id}">${quartier.nom}</option>
			</g:each>
		</select>
	</div>
</div>

<div class="form-group ${hasErrors(bean: seanceInstance, field: 'residence', 'error')} required">
	<label for="residence" class="col-sm-2 control-label">
		<g:message code="seance.residence" default="Résidence" />
		<span class="required-indicator"></span>
	</label>
	<div class="col-sm-10">
		<input type="text" class="form-control" name="residence" id="residence" value="${seanceInstance?.residence}" style="width: 500px">
	</div>
</div>

<div class="form-group ${hasErrors(bean: seanceInstance, field: 'residence', 'error')} required">
	<label for="rue" class="col-sm-2 control-label">
		<g:message code="seance.rue" default="Rue" />
		<span class="required-indicator"></span>
	</label>
	<div class="col-sm-10">
		<input type="text" class="form-control" name="rue" id="rue" value="${seanceInstance?.rue}" style="width: 500px">
	</div>
</div>

<div class="form-group ${hasErrors(bean: seanceInstance, field: 'commentaire', 'error')} ">
	<label for="commentaire" class="col-sm-2 control-label">
		<g:message code="seance.commentaire.label" default="Commentaire" />
		
	</label>
	<div class="col-sm-10">
		<g:textArea class="form-control" name="commentaire" value="${seanceInstance?.commentaire}" style="width: 500px"/>
	</div>
</div>
