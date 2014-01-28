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

	<div class="form-group">
		<label class="col-sm-2 control-label" style="width: 300px;">Quartier
			: </label>
		<div class="col-sm-10" style="width: 250px">
			<p class="form-control-static">
				${seanceInstance?.quartier?.nom}
			</p>
		</div>
	</div>
	
		<div class="form-group">
		<label class="col-sm-2 control-label" style="width: 300px;">Résidence
			: </label>
		<div class="col-sm-10" style="width: 250px">
			<p class="form-control-static">
				${seanceInstance?.residence}
			</p>
		</div>
	</div>
	
		<div class="form-group">
		<label class="col-sm-2 control-label" style="width: 300px;">Rue
			: </label>
		<div class="col-sm-10" style="width: 250px">
			<p class="form-control-static">
				${seanceInstance?.rue}
			</p>
		</div>
	</div>

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

	<div class="form-group">
		<label class="col-sm-2 control-label" style="width: 300px;">Commentaire
			initial : </label>
		<div class="col-sm-10" style="width: 250px">
			<p class="form-control-static">
				${seanceInstance.commentaire}
			</p>
		</div>
	</div>

<div
	class="form-group ${hasErrors(bean: seanceInstance, field: 'nombrePorteFrappes', 'error')} required">
	<label for="nombrePorteFrappes" style="width: 300px"
		class="col-sm-2 control-label">
		Nombre de portes frappées : 
	</label>
	<div class="col-sm-10" style="width: 250px">
		<g:field class="form-control" name="nombrePorteFrappes" type="number"
			value="${seanceInstance.nombrePorteFrappes}" required=""
			style="width: 150px" />
	</div>
</div>

<div
	class="form-group ${hasErrors(bean: seanceInstance, field: 'nombrePorteOuvertes', 'error')} required">
	<label for="nombrePorteOuvertes" class="col-sm-2 control-label"
		style="width: 300px">Nombre de portes ouvertes : 
	</label>

	<div class="col-sm-10" style="width: 250px">
		<g:field class="form-control" name="nombrePorteOuvertes" type="number"
			value="${seanceInstance.nombrePorteOuvertes}" required=""
			style="width: 150px" />
	</div>
</div>

<div
	class="form-group ${hasErrors(bean: seanceInstance, field: 'nombreQuestionnaires', 'error')} required">
	<label for="nombreQuestionnaires" style="width: 300px"
		class="col-sm-2 control-label"> Nombre de questionnaires : </span>
	</label>
	<div class="col-sm-10" style="width: 250px">
		<g:field class="form-control" name="nombreQuestionnaires"
			type="number" value="${seanceInstance.nombreQuestionnaires}"
			required="" style="width: 150px" />
	</div>
</div>

<div
	class="form-group ${hasErrors(bean: seanceInstance, field: 'commentaire', 'error')} ">
	<label for="commentaire_cloture" class="col-sm-2 control-label"
		style="width: 300px"> <g:message
			code="seance.commentaire_cloture.label" default="Commentaire" /> : 

	</label>
	<div class="col-sm-10">
		<g:textArea class="form-control" name="commentaire_cloture"
			value="${seanceInstance?.commentaire_cloture}"
			style="margin-left: 100px; width: 500px; margin-top: 10px" rows="4" cols="50"/>
	</div>
</div>
