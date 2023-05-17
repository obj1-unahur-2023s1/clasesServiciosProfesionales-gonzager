import profesionales.*
class Persona {
	var property provinciaDondeVive
	method puedeSerAtendido(unProfesional) {
		return unProfesional.puedeTrabajar().contains(provinciaDondeVive)
	}
	
}


class Institucion {
	const property universidadesQueReconoce = #{} 
	method puedeSerAtendido(unProfesional) {
		return universidadesQueReconoce.contains(unProfesional.universidad())	
	}
}

class Cubles {
	const property proviciasQueReconoce = #{}
	method puedeSerAtendido(unProfesional) {
		return proviciasQueReconoce.intersection(unProfesional.puedeTrabajar()).size() > 0
	}
}


