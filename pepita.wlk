import direcciones.*
import extras.*

object pepita {
	var energia = 1000
	var enemigo = silvestre
	var hogar = nido
	const joules = 9
	var property position = game.at(1, 3)
	
	method image() = ("pepita-" + self.estado()) + ".png"
	
	method puedeVolar() = energia >= self.energiaNecesaria(1) && self.position() != enemigo.position()

	method caer() {
		if(self.position().y() != 0 && (self.position().down(1) != muroUno.position()) ){
			position = position.down(1)
		}
	}

	method estado() = if (not self.puedeVolar()) {
			"gris"
	} else if (self.position() == hogar.position()){
			"grande" 
	} else{
			"base"
	}
	
	method text() = "" + energia
	
	method textColor() = "FFFFFF"
	
	method energiaNecesaria(kms) = joules * kms
	
	method mover(direccion) {
		if (self.puedeVolar() && self.direccionX(direccion) && self.direccionY(direccion) && (direccion.siguiente(position) != muroUno.position())) {
			position = direccion.siguiente(position)
			self.volar(1)
		}
	}
	

	method direccionX(direccion) = direccion.siguiente(self.position()).x().between(0, game.width()-1)

	method direccionY(direccion) = direccion.siguiente(self.position()).y().between(0, game.height()-1)


	method comer(comida) {
		energia += comida.energiaQueOtorga()
	}
	
	method volar(kms) {
		energia -= self.energiaNecesaria(1)
	}
	
	method energia() = energia

}