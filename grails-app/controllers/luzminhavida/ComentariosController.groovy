package luzminhavida



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ComentariosController {
    
    def beforeInterceptor = [action:this.&auth]

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    
    def auth() {
        if(!session.user) {
            redirect(controller:"Login", action:"login")
            return false
        }
        def user = Usuario.findByLoginAndPassword(session.user.login, session.user.password);
        
        if(!user) {
            redirect(controller:"Login", action:"login")
            return false
        }else if(!user.permissao.nome.equals("Cliente")){
            flash.message = "Voce não tem permissão para acessar esta área"
            redirect(uri: "/" )
            return false
        }
    }
    
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Comentarios.list(params), model:[comentariosInstanceCount: Comentarios.count()]
    }
    
    def listarComentarios(){
        def user = Usuario.findByLoginAndPassword(session.user.login, session.user.password)
        def comentarios = Comentarios.findAllByCliente(user)
        
        if (!comentarios) {
            flash.message = "Você não possui comentarios!"  
            redirect(action: "create")
            //[message: 'owners.not.found']
        }else {
        
            if (comentarios.size() > 1) {
                [oComentarios : comentarios]
            } else {
                redirect action: 'show', id: comentarios[0].id
            }      
        }
    }
    

    def show(Comentarios comentariosInstance) {
        respond comentariosInstance
    }

    def create() {
        respond new Comentarios(params)
    }

    @Transactional
    def save(Comentarios comentariosInstance) {
        if (comentariosInstance == null) {
            notFound()
            return
        }

        if (comentariosInstance.hasErrors()) {
            respond comentariosInstance.errors, view:'create'
            return
        }
        def user = Usuario.findByLoginAndPassword(session.user.login, session.user.password);
        
        comentariosInstance.cliente = user
        comentariosInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'comentarios.label', default: 'Comentarios'), comentariosInstance.id])
                redirect comentariosInstance
            }
            '*' { respond comentariosInstance, [status: CREATED] }
        }
    }

    def edit(Comentarios comentariosInstance) {
        respond comentariosInstance
    }

    @Transactional
    def update(Comentarios comentariosInstance) {
        if (comentariosInstance == null) {
            notFound()
            return
        }

        if (comentariosInstance.hasErrors()) {
            respond comentariosInstance.errors, view:'edit'
            return
        }

        comentariosInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Comentarios.label', default: 'Comentarios'), comentariosInstance.id])
                redirect comentariosInstance
            }
            '*'{ respond comentariosInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Comentarios comentariosInstance) {

        if (comentariosInstance == null) {
            notFound()
            return
        }

        comentariosInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Comentarios.label', default: 'Comentarios'), comentariosInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'comentarios.label', default: 'Comentarios'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    
        
    def filtro(){
        if (!request.post) {
            return
        }        
           
        // filtro por Avaliacao
        def comentarios  = Comentarios.findAll()
        def listaPorNome = []
        println comentarios.size() + "<comentarios>"
        for (Comentarios coment in comentarios){
            if(coment?.cliente?.nome?.contains(params?.clienteNome)){
                listaPorNome.add(coment)
                //  println("ADD LISTA POR NOME")
                
            }
        }
        println listaPorNome.size() + "<listaPorNome>" 
        def listaPorEstrela = []
        if (params?.aval?.id != '-1'){            
            for (Comentarios rel in listaPorNome){
                println rel?.estrelas?.id.toString() + "<><><><"+params?.aval?.id.toString()
                if(rel?.estrelas?.id.toString().equals(params?.aval?.id.toString())){
                    listaPorEstrela.add(rel)
                    //println("ADD LISTA POR CATEGORIA") 
                }
            }
        } else {
            listaPorEstrela = comentarios
        }
         println listaPorEstrela.size() + "<listaPorEstrela>" 
        //filtro por data
        def listaPorData = []
        if(params.datai.after(new Date()) || params.dataf.after(new Date())){
            flash.message = "Datas não podem serem maiores que a data atual!"  
            return //[message: 'owners.not.found']
        }else if(params.datai.after(params.dataf)){
            flash.message = "Data Inicial não pode ser maior que final"  
            return //[message: 'owners.not.found']
        }else{
            for(Comentarios rel in listaPorEstrela){
                if(rel.data.after(params.datai-1) && rel.data.before(params.dataf+1)){
                    listaPorData.add(rel)
                }            
            }
        }
          println listaPorData.size() + "<listaPorData>" 
        def finalList = listaPorData
        // println(params.datai.toString() + "datai <     dataf > " + params.dataf.toString())
        relatorio(finalList, params.datai, params.dataf)
    }
    
  
    def  relatorio(List finalList, Date data1, Date data2){
        def comentariosPorAval = [:]
        
        def avals = Aval.findAll()
        
        for (Aval av in avals){
            comentariosPorAval[av.estrelas] = 0
        }
        println comentariosPorAval.size() + "coments por aval"
        for(Comentarios rel in finalList){
            if(!comentariosPorAval[rel.estrelas.estrelas]){
                comentariosPorAval[rel.estrelas.estrelas] = 1
             
            }else{
                comentariosPorAval[rel.estrelas.estrelas] += 1

            }
        }
        
        int visu = finalList.size()
        
  
        def listaAvalPercent = []
        
        for(elem in comentariosPorAval.sort{-it.value}){
            if(visu!=0){
                listaAvalPercent.add((int)((elem.value/visu) * 100))
            }else{
                listaAvalPercent.add(0)
            }
        }
        
        def listaClientes = [:]
        
        for(Comentarios rel in finalList){
            if(!listaClientes[rel.cliente]){
                listaClientes[rel.cliente] = 1
            } else {
                listaClientes[rel.cliente] += 1 
            }
        }
        def listaClientPercent = []
        for(elem in listaClientes.sort{-it.value}){
            listaClientPercent.add((int)((elem.value/visu) * 100))
        }
        
        render view: 'relatorio', model: [listaTotal : comentariosPorAval.sort{-it.value}, lstAvalPercent: listaAvalPercent, totalVisu: visu,
            lstCliente: listaClientes.sort{-it.value}, lstPercentClient: listaClientPercent, datai : data1.format("dd/MM/yyyy"), dataf : data2.format("dd/MM/yyyy"),
            listaFinal: finalList ]
     
    }
}
