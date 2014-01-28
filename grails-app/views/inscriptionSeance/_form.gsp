<%@ page import="fr.ps.porteaporte.InscriptionSeance" %>



<div class="fieldcontain ${hasErrors(bean: inscriptionSeanceInstance, field: 'commentaire', 'error')} ">
	<label for="commentaire">
		<g:message code="inscriptionSeance.commentaire.label" default="Commentaire" />
		
	</label>
	<g:textField name="commentaire" value="${inscriptionSeanceInstance?.commentaire}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: inscriptionSeanceInstance, field: 'dateInscription', 'error')} required">
	<label for="dateInscription">
		<g:message code="inscriptionSeance.dateInscription.label" default="Date Inscription" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateInscription" precision="day"  value="${inscriptionSeanceInstance?.dateInscription}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: inscriptionSeanceInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="inscriptionSeance.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${inscriptionSeanceInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: inscriptionSeanceInstance, field: 'nom', 'error')} ">
	<label for="nom">
		<g:message code="inscriptionSeance.nom.label" default="Nom" />
		
	</label>
	<g:textField name="nom" value="${inscriptionSeanceInstance?.nom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: inscriptionSeanceInstance, field: 'prenom', 'error')} ">
	<label for="prenom">
		<g:message code="inscriptionSeance.prenom.label" default="Prenom" />
		
	</label>
	<g:textField name="prenom" value="${inscriptionSeanceInstance?.prenom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: inscriptionSeanceInstance, field: 'seance', 'error')} required">
	<label for="seance">
		<g:message code="inscriptionSeance.seance.label" default="Seance" />
		<span class="required-indicator">*</span>
	</label>
	
</div>

