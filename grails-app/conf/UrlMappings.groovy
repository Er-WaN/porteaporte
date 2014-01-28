class UrlMappings {

	static mappings = {
		"/login/$action?"(controller: "login")
		"/logout/$action?"(controller: "logout")
        "/$controller/$action?/$id?(.${format})?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "500"(view:'/error')
		"/inscriptionSeance/participer/$seance_id"(controller:"inscriptionSeance", action: "participer")
		"/seance/carte"(controller:"seance", action: "carte")
	}
}
