<%@ page import="fr.ps.porteaporte.Digicode"%>

<div class="form-group">
  <label for="adresse" class="col-sm-2 control-label"><g:message code="digicode.adresse.label" default="Adresse : " /></label>
  <div class="col-sm-10">
    <input type="text" class="form-control" name="adresse" id="adresse" value="${digicodeInstance?.adresse}">
  </div>
</div>

<div class="form-group">
  <label for="rue" class="col-sm-2 control-label"><g:message code="digicode.porte.label" default="Porte : " /></label>
  <div class="col-sm-10" width="100px">
    <input type="text" class="form-control" name="rue" id="rue" value="${digicodeInstance?.porte}" style="width: 70px;">
  </div>
</div>

<div class="form-group">
  <label for="residence" class="col-sm-2 control-label"><g:message code="digicode.residence.label" default="Résidence : " /></label>
  <div class="col-sm-10">
    <input type="text" class="form-control" name="residence" id="residence" value="${digicodeInstance?.residence}">
  </div>
</div>

<div class="form-group">
  <label for="code" class="col-sm-2 control-label"><g:message code="digicode.code.label" default="Digicode : " /></label>
  <div class="col-sm-10">
    <input type="text" class="form-control" name="code" id="code" value="${digicodeInstance?.code}" style="width: 70px;">
  </div>
</div>



