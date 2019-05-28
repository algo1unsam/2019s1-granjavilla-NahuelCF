import wollok.game.*

object hector {
	var maiz = []
	var trigo = []
	var tomaco = []
	var oro = 0
	var property position = game.at(7,5)
	method image()= "player.png"
	
	method move(nuevaPosicion){
		self.position(nuevaPosicion)
	}
	
	method sembrar(planta){
		if(self.noHayPlanta()){
			planta.position(self.position())
			game.addVisual(planta)
		}
		else{
			self.error("Ya hay una planta acà")
		}
		}
	
	method regar(){
		if(not self.noHayPlanta()){
			self.quePlantaHay().crecer()
		}
		else{
			self.error("No tengo nada para regar")//el msg lo da la planta
		}
	}
	
	method noHayPlanta(){
		return game.colliders(self).isEmpty()
	}
	
	method quePlantaHay() = game.colliders(self).first()
	
	method cosechar(){
		if(not self.noHayPlanta()){
			self.quePlantaHay().cosechada()
		}
		else{
			self.error("No tengo nada para cosechar")//el msg lo da la planta
		}
	}
	
	method agregarMaiz(planta) = maiz.add(planta)
	method agregarTrigo(planta) = trigo.add(planta)
	method agregarTomaco(planta) = tomaco.add(planta)
	
	method gananciaMaiz() = maiz.size() * 150
	method gananciaTrigo() = trigo.sum{trig => self.valorTrigo(trig)}
	method valorTrigo(trig) = (trig.etapa()-1) * 100
	method gananciaTomaco() = tomaco.size() * 80
	
	method ganancia() = self.gananciaTrigo() + self.gananciaMaiz() + self.gananciaTomaco()
	
	method vender(){
		oro += self.ganancia()
		self.entregarPlantas()
	}
	
	method estaEnLaTienda() = game.colliders(self).isEmpty()
	
	method entregarPlantas(){//???
		maiz = []
		trigo = []
		tomaco = []
	}
	
	method cantPlantasParaVender() = maiz.size() + trigo.size() + tomaco.size()
	
	method darInfo(){
		game.say(self,"tengo " + oro + " monedas y " + self.cantPlantasParaVender() + " planta/as para vender")
	}
}
