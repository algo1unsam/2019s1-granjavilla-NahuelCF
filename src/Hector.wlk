import wollok.game.*

object hector {
	var property maiz = []
	var property trigo = []
	var property tomaco = []
	var plantas = [maiz,trigo,tomaco]
	var oro = 0
	var property position = game.at(7,5)
	method image()= "player.png"
	
	method move(nuevaPosicion){
		self.position(nuevaPosicion)
	}
	
	method sembrar(planta){
		if(not self.hayPlanta()){
			planta.position(self.position())
			game.addVisual(planta)
		}
		else{
			self.error("Ya hay una planta acà")
		}
		}
	
	method regar(planta) = planta.crecer()
	
	method hayPlanta() = not game.colliders(self).isEmpty()
	
	method quePlantaHay(mensaje) = 
		if(self.hayPlanta()) game.colliders(self).first() 
		else self.error("No tengo nada para " + mensaje)
	
	method cosechar(planta) = planta.cosechada()
	
	method gananciaTotalMaiz() = maiz.size() * 150
	method gananciaTotalTrigo() = trigo.sum{trig => self.valorTrigo(trig)}
	method valorTrigo(trig) = (trig.etapa()-1) * 100
	method gananciaTotalTomaco() = tomaco.size() * 80
	
	method gananciaTotal() = self.gananciaTotalTrigo() + self.gananciaTotalMaiz() + self.gananciaTotalTomaco()
	
	method vender(tienda){
		self.intentarComerciar(tienda)
	}
	
	method intentarComerciar(tienda){
		if(self.tiendaPuedePagar(tienda)){
			self.comerciar(tienda)
		}
		else{
			self.error("Esta tienda no tiene suficiente dinero")
		}
	}
	
	method comerciar(tienda){
		self.tiendaPaga(tienda)
		self.entregarPlantas(tienda)
	}
	
	method estaEnLaTienda() = not game.colliders(self).isEmpty()
	
	method tiendaDondeEsta() = 
		if (self.estaEnLaTienda())game.colliders(self).first()
		else self.error("Necesito estar en una tienda")
	
	method tiendaPuedePagar(tienda) = self.oroDeLaTienda(tienda) >= self.gananciaTotal()
	
	method oroDeLaTienda(tienda) = tienda.oro()
	
	method tiendaPaga(tienda){
		self.tiendaEntregaDinero(tienda)
		oro += self.gananciaTotal()
	}
	
	method tiendaEntregaDinero(tienda) = tienda.oro(tienda.oro() - self.gananciaTotal())
	
	method entregarPlantas(tienda){
		self.darPlantas(tienda)
		plantas.forEach{tipo => tipo.clear()}
	}
	
	method darPlantas(tienda) = tienda.mercaderia().addAll(maiz+trigo+tomaco)
	
	method cantPlantasParaVender() = plantas.sum{tipo => tipo.size()}
	
	method darInfo(){
		game.say(self,"tengo " + oro + " monedas ,y " + self.cantPlantasParaVender() + " planta/as para vender")
	}
}
