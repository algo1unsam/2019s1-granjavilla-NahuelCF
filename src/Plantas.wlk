import wollok.game.*
import Hector.*

class Maiz{
	var property position
	var property image = "corn_baby.png"
	var adulta = false
	
	method crecer(){
		if(not adulta){
			image = "corn_adult.png"
			adulta = true
	}
	}

	method cosechada(){
		if(adulta){
			hector.agregarMaiz(self)
			game.removeVisual(self)
	}

}
}
class Trigo{
	var property position
	var property etapa = 0
	var property image = "wheat_0.png"
	
	method crecer(){//!!!!!!!!!!!!!!!!
		etapa++
		if(etapa>=4) etapa = 0
		if(etapa == 0) image = "wheat_0.png"
		if(etapa == 1) image = "wheat_1.png"
		if(etapa == 2) image = "wheat_2.png"
		if(etapa == 3) image = "wheat_3.png"
	}
	
	method cosechada(){
		if(etapa >= 2){
		hector.agregarTrigo(self)	
		game.removeVisual(self)
	}
}
}

class Tomaco{
	var property position
	var property image = "tomaco_baby.png"
	
	method crecer(){
		self.position().up(1)//????
	}
	
	method cosechada(){
		hector.agregarTomaco(self)
		game.removeVisual(self)
}
}