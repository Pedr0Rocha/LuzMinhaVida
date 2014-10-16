package luzminhavida



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.validation.Validateable

@Transactional(readOnly = true)
class RelatorioLoginController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond RelatorioLogin.list(params), model:[relatorioLoginInstanceCount: RelatorioLogin.count()]
    }

    def show(RelatorioLogin relatorioLoginInstance) {
        respond relatorioLoginInstance
    }

    def create() {
        respond new RelatorioLogin(params)
    }

    @Transactional
    def save(RelatorioLogin relatorioLoginInstance) {
        if (relatorioLoginInstance == null) {
            notFound()
            return
        }

        if (relatorioLoginInstance.hasErrors()) {
            respond relatorioLoginInstance.errors, view:'create'
            return
        }

        relatorioLoginInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'relatorioLogin.label', default: 'RelatorioLogin'), relatorioLoginInstance.id])
                redirect relatorioLoginInstance
            }
            '*' { respond relatorioLoginInstance, [status: CREATED] }
        }
    }

    def edit(RelatorioLogin relatorioLoginInstance) {
        respond relatorioLoginInstance
    }

    @Transactional
    def update(RelatorioLogin relatorioLoginInstance) {
        if (relatorioLoginInstance == null) {
            notFound()
            return
        }

        if (relatorioLoginInstance.hasErrors()) {
            respond relatorioLoginInstance.errors, view:'edit'
            return
        }

        relatorioLoginInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'RelatorioLogin.label', default: 'RelatorioLogin'), relatorioLoginInstance.id])
                redirect relatorioLoginInstance
            }
            '*'{ respond relatorioLoginInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(RelatorioLogin relatorioLoginInstance) {

        if (relatorioLoginInstance == null) {
            notFound()
            return
        }

        relatorioLoginInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'RelatorioLogin.label', default: 'RelatorioLogin'), relatorioLoginInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'relatorioLogin.label', default: 'RelatorioLogin'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    
    def filtro(){
        if (!request.post) {
            return
        }        
           
        // filtro por tipo usuario
        def acessosUsuarios  = RelatorioLogin.findAll()
        def listaPorTipoUser = []
        
         
        if (params?.permiss?.id != '-1'){            
            for (RelatorioLogin rel in acessosUsuarios){
                if(rel?.usuario?.permissao?.id.toString().equals(params?.permiss?.id.toString())){
                    listaPorTipoUser.add(rel)
                    //println("ADD LISTA POR CATEGORIA") 
                }
            }
        } else {
            listaPorTipoUser = acessosUsuarios
        }
        
        //filtro por data
        def listaPorData = []
        if(params.datai.after(new Date()) || params.dataf.after(new Date())){
            flash.message = "Datas não podem serem maiores que a data atual!"  
            return //[message: 'owners.not.found']
        }else if(params.datai.after(params.dataf)){
            flash.message = "Data Inicial não pode ser maior que final"  
            return //[message: 'owners.not.found']
        }else{
            for(RelatorioLogin rel in listaPorTipoUser){
                if(rel.data.after(params.datai-1) && rel.data.before(params.dataf+1)){
                    listaPorData.add(rel)
                }            
            }
        }
        def finalList = listaPorData
        // println(params.datai.toString() + "datai <     dataf > " + params.dataf.toString())
        relatorio(finalList, params.datai, params.dataf)
    }
    
    @Validateable
    def  relatorio(List finalList, Date data1, Date data2){
        def superList = [:]
        
        for(RelatorioLogin rel in finalList){
            if(!superList[rel.usuario]){
                superList[rel.usuario] = 1
                //println(superList[rel.produto]+"<superList>"+rel.produto.nomeProduto)
            }else{
                superList[rel.usuario] += 1
                //println(superList[rel.produto]+"<superList>"+rel.produto.nomeProduto)
            }
        }
        
        int visu = 0
        
        for(elem in superList.sort{-it.value}){
            println (elem.key.nome + " <key><value> "+ elem.value)
            visu += elem.value;
        }
        
        def listaCadaVisu = []
        for(elem in superList.sort{-it.value}){
            listaCadaVisu.add((int)((elem.value/visu) * 100))
        }
        def listaSemana = [:]
        Date dataPadrao = new Date("11/10/2014")
        for(i in 0..7){
            listaSemana[(dataPadrao+i).format("EEEE")] = 0
        }        
        for(rel in finalList){
            if(!listaSemana[rel.data.format("EEEE")]){
                listaSemana[rel.data.format("EEEE")] = 1
                //println(superList[rel.produto]+"<superList>"+rel.produto.nomeProduto)
            }else{
                listaSemana[rel.data.format("EEEE")] += 1
                //println(superList[rel.produto]+"<superList>"+rel.produto.nomeProduto)
            }
        }
        def percentSemana = []
        
        for(dia in listaSemana){
            if(visu!=0){
                percentSemana.add((int)((dia.value/visu) * 100))
            }else{
                percentSemana.add(0)
            }
        }
        render view: 'relatorio', model: [listaTotal : superList.sort{-it.value}, totalVisu: visu, cadaVisu:listaCadaVisu,
            datai : data1.format("dd/MM/yyyy"), dataf : data2.format("dd/MM/yyyy"),
            listaFinal: finalList, semana:listaSemana, psemana: percentSemana, ]
     
    }
}

