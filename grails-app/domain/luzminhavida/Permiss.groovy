package luzminhavida

class Permiss {
    
    String nome
    
    static constraints = {
        nome blank: false, minSize: 3, maxSize: 20, unique: true
    }
}
