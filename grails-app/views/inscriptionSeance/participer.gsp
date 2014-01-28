<html>
<head>
	<title>Participer à une séance de porte à porte</title>
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'signin.css')}" type="text/css">
</head>

<body>
<div id='container'>

	<g:form url="[resource:inscriptionSeanceInstance, action:'save']" class='form-signin' autocomplete='off'>
					
		<h2>Séance du <g:formatDate type="datetime" style="LONG" timeStyle="SHORT" date="${fr.ps.porteaporte.Seance.get(seanceInstance.id).dateSeance}"/></h2>
		
		<g:if test='${flash.message}'>
			<div class="alert alert-danger alert-dismissable">
				<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				${flash.message}
			</div>
		</g:if>
		
		<input type='email' placeholder="Adresse email" class='form-control' name='email' id='email'/>

		<input style="margin-top: 10px" type='text' placeholder="Prénom" class='form-control' name='prenom' id='prenom'/>

		<input style="margin-top: 10px" type='text' placeholder="Nom" class='form-control' name='nom' id='nom'/>
		
		<input style="margin-top: 10px" type='text' placeholder="Téléphone" class='form-control' name='phone' id='phone'/>
      		
		<textarea style="margin-top: 10px" class="form-control" rows="4" name="commentaire" placeholder="Commentaire" value="${inscriptionSeanceInstance?.commentaire}"></textarea>
	
		<input type="hidden" name="seance.id" id="seance.id" value="${seanceInstance.id}" />
		
		<button style="margin-top: 20px" class="btn btn-lg btn-primary" type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'>Je participe</button>
	</g:form>
</div>

<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>
</body>
</html>
