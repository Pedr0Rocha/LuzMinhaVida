class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/index" (view:"/index")
        "/ajuda" (view:"/ajuda")
        "/"(view:"/index")
        "500"(view:'/error')
	}
}
