<%@ page import="fr.ps.porteaporte.UserRole" %>


<div class="fieldcontain ${hasErrors(bean: userRoleInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="userrole.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${fr.ps.porteaporte.User.list()}" optionKey="id" optionValue="${{it.prenom +' '+it.nom}}" required="" value="${userRoleInstance?.user?.id}" class="many-to-one"/>
</div>


<div class="fieldcontain ${hasErrors(bean: userRoleInstance, field: 'role', 'error')} required">
	<label for="role">
		<g:message code="userrole.role.label" default="Role" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="role" name="role.id" from="${fr.ps.porteaporte.Role.list()}" optionValue="authority" optionKey="id" required="" value="${userRoleInstance?.role?.authority}" class="many-to-one"/>
</div>

