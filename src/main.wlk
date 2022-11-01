class Empleado{
	var property salud
	const habilidades
	const subordinados
	
	method estaIncapacitado() = self.saludCritica() > salud
	method saludCritica()
	
	
	
	method puedeUsarLaHabilidad(habilidad) = !self.estaIncapacitado() && self.tieneLaHabilidad(habilidad)

	method tieneLaHabilidad(habilidad) = habilidades.contains(habilidad) || subordinados.any({subordinado => subordinado.puedeUsarLaHabilidad()})
	
}



/*Puestos de trabajo*/
class Espia{
	var property saludCritica = 15
	
	method completarMision(habilidad) { self.aprenderHabilidad(habilidad)}
	
	method aprenderHabilidad(habilidad) {habilidades.add(habilidad)}
}
class Oficinista{
	var cantidadDeEstrellas
	
	method completarMision(){cantidadDeEstrellas+=1}
	
	override method saludCritica() = 40-5*cantidadDeEstrellas
}

class
class Mision{
	var equipo
	var habilidadesNecesarias
	
	/*method realizarMision(){
		if(self.puedenCumplirLaMision()){
			equipo.espias().forEach({espia => espia.completarMision(habilidadesNecesarias)})
			equipo.empleados()
		}
		else{
			
		}
	}*/
	method puedenCumplirLaMision(){
		
	}
}