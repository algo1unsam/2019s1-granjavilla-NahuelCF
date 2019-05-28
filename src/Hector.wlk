import wollok.game.*

object hector {
	var plantas = []
	var maiz = []
	var trigo = []
	var tomaco = []
	var oro = 0
	var property position = game.at(7,5)
	method image()= "player.png"
	
	method move(nuevaPosicion){
		self.position(nuevaPosicion)
	}
	
	method sembrar(planta){//???????????
		planta.position(self.position())
		game.addVisual(planta)
		self.agregarPlanta(planta)
		}
	
	
	method agregarPlanta(planta) = plantas.add(planta)
	
	method regar(){
		if(self.hayPlanta()){
			self.quePlantaHay().crecer()
		}
		else{
			self.error("No tengo nada para regar")//el msg lo da la planta
		}
	}
	
	method hayPlanta() = plantas.any{
		planta => self.mismaPosicion(planta)
	}
	
	method quePlantaHay() = plantas.find{
		planta => self.mismaPosicion(planta)
	}
	
	method mismaPosicion(planta) = planta.position() == self.position()
	
	method cosechar(){
		if(self.hayPlanta()){
			self.quePlantaHay().cosechada()///????
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
	
	method entregarPlantas(){//??????
		maiz = []
		trigo = []
		tomaco = []
	}
	
	method cantPlantasParaVender() = maiz.size() + trigo.size() + tomaco.size()
	
	method darInfo(){
		game.say(self,"tengo " + oro + " monedas y " + self.cantPlantasParaVender() + " planta/as para vender")
	}
}
