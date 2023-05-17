import universidad.*
import profesionales.*
import solicitantes.*
class Empresa {
	const profesionales = #{}
	const clientes =#{}
	var property honorariosDeReferencia = 0
	
	method agregarProfesional(unProfesional){
		profesionales.add(unProfesional)
	}
	
	method cuantosEstudiaronEn(unaUniversidad) {
		return profesionales.count {
			p=>p.universidad() == unaUniversidad
		}
	}
	
	method profesionalesCaros() {
		return profesionales.filter {p=>p.honorarios() > honorariosDeReferencia }
	}
	
	method universidadesFormadoras() {
		return profesionales.map({ p=> p.universidad()}).asSet()
	}
	
	method profesionalMasBarato() {
		return profesionales.min({p=>p.honorarios()})
	}
	
	method esDeGenteAcotadaAll() {
		return profesionales.all({p=>p.puedeTrabajar().size() <= 3})
	}
	
	method esDeGenteAcotadaAny() {
		return not profesionales.any({p=>p.puedeTrabajar().size() > 3})
	}
	
	method puedeSatisfacer(unSolicitante) {
		return
		profesionales.any( {
			p=>unSolicitante.puedeSerAtendido(p)
		} )
		
	}
	
	
	method darServicio(unSolicitante) {
		
		if (! self.puedeSatisfacer(unSolicitante)) {
			self.error("No puede ser atendido ")
		}
		
		const profesionaQueAtiende = profesionales.filter(
			{p=>unSolicitante.puedeSerAtendido(p)}
		).anyOne()
		console.println(profesionaQueAtiende)
		profesionaQueAtiende.cobrar(profesionaQueAtiende.honorarios())
		
		clientes.add(unSolicitante)
		
		
	}
	
}
