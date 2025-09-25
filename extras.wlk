import pepita.*


object silvestre{
    const presa = pepita
    
    method position() = game.at(self.x(), 0)

    method image() = "silvestre.png"

    method x() = 3.max(presa.position().x())

}

object nido{
    var property position = game.at(8, 8)
    
    method image() = "nido.png"

}

object manzana{
    var property position = game.center()
    const energiaManzana = 5
    var property madurez = 1 

    method image() = "manzana.png"

    method energiaQueOtorga() = energiaManzana * madurez 

    method colisiono(objeto) {
        objeto.comer(self)
        game.removeVisual(self)
    }
}

object muroUno {
    var property position = game.at(4,6)

    method image() = "muro.png"
}
