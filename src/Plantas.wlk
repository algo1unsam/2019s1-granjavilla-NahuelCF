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
	
	method crecer(){//!!!
		etapa++
		self.verificarEtapa()
		image = "wheat_" + etapa + ".png"
	}
	
	method verificarEtapa() = {if(etapa>3) etapa = 0}
	
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
	var adulta = false
	
	method crecer(){
		if(not adulta){
			image = "tomaco.png"
		}
		position = position.up(1)
		if(self.seFueDelTablero()){
			self.volverAbajo()
		}
	}
	
	method seFueDelTablero() = position.y() == 11
	
	method volverAbajo() = (position = game.at(position.x(),0))
	
	method cosechada(){
		hector.agregarTomaco(self)
		game.removeVisual(self)
}
}