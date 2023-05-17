import universidad.*
class Vinculado {
	var property universidad
	
	method honorarios() {
		return universidad.honoriosRecomendados()
	}
	
	method puedeTrabajar() {
		return #{universidad.provincia()}
	}
	
	method cobrar(unImporte) {
		universidad.recibirDonacion(unImporte / 2)
	}
}
class Asociado {
	var property universidad
	method honorarios() {
		return 3000
	}
	method puedeTrabajar() {
		return #{"Entre Rios","Santa Fe", "Corrientes"}
	}
	method cobrar(unImporte) {
		asociacionProfesionalesDelLitoral.recibirDonacion(unImporte)
	}
}

class Libres {
	var property universidad
	var property honorarios
	var property puedeTrabajar = #{}
	var totalRecaudado = 0
	method cobrar(unImporte) {
		totalRecaudado += 0
	}
}
