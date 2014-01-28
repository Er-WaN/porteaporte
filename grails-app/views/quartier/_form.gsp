<%@ page import="fr.ps.porteaporte.Quartier" %>



<div class="fieldcontain ${hasErrors(bean: quartierInstance, field: 'nom', 'error')} ">
	<label for="nom">
		<g:message code="quartier.nom.label" default="Nom" />
		
	</label>
	<g:textField name="nom" value="${quartierInstance?.nom}"/>
</div>

