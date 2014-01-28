
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'font-awesome.min.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootswatch.min.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'navbar.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'datepicker.css')}" type="text/css">
		<g:layoutHead/>
		<r:layoutResources />
	</head>

  <body>

    <div class="container">

      <!-- Static navbar -->
      <div class="navbar navbar-inverse" role="navigation">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          	<a class="navbar-brand" href="${createLink(uri: '/')}">Porte à porte</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="${(params.controller == 'seance' && params.action != 'carte') ? 'active' : '' }"><g:link controller="seance">Séances</g:link></li>
            <li class="${(params.controller == 'user') ? 'active' : '' }"><g:link controller="user">Utilisateurs</g:link></li>
            <li class="${(params.controller == 'stats') ? 'active' : '' }"><g:link controller="stats">Statistiques</g:link></li>
            <li class="${(params.controller == 'seance' && params.action == 'carte' ) ? 'active' : '' }"><g:link controller="seance" action="carte">Carte</g:link></li>
          	<li class="${(params.controller == 'digicode') ? 'active' : '' }"><g:link controller="digicode">Digicodes</g:link></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
          	<%
				fr.ps.porteaporte.User u = fr.ps.porteaporte.User.find{username == session.SPRING_SECURITY_CONTEXT.authentication.principal.username}
		  		   %>
            <li><a href="">Connecté en tant que ${u.prenom} ${u.nom}</a></li>
            <li class="active"><g:link controller="logout">Déconnection</g:link></li>
				
          </ul>
        </div><!--/.nav-collapse -->
      </div>

	  <div style="background-color: #eee; border-radius: 6px; padding: 48px;">
	  	<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />
	  </div>
	  
    </div> <!-- /container -->

    
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
  </body>
</html>
