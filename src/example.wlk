class Empleado{
	var habilidades = []
	var puestoDeTrabajo
	var saludActual
	
	method estaIncapacitado() = saludActual < puestoDeTrabajo.saludCritica()
	
	method puedeUsar(habilidad) = not self.estaIncapacitado() and self.poseeLaHabilidad(habilidad)
	
	method poseeLaHabilidad(habilidad) = habilidades.contains(habilidad)
	
	method otorgarPremio(habilidadesRequeridas){
		if(self.estaVivo())
			puestoDeTrabajo.otorgarPremio(habilidadesRequeridas, self)
		else
			self.error("Esta muerto")
	}
	
	method estaVivo() = saludActual > 0
	
	method nuevaListaDeHabilidades(listaDeHabilidadesParaAgregar){
		habilidades.union(listaDeHabilidadesParaAgregar)
	}
	
	method recibirdanio(peligrosidad){
		saludActual -= peligrosidad
	}
}

class Jefe inherits Empleado{
	var subordinados = []
	
	override method puedeUsar(habilidad) = super(habilidad) || subordinados.any({subordinado => subordinado.puedeUsar(habilidad)})
}

object espia {
	method saludCritica() = 15
	method otorgarPremio(habilidadesRequeridas, empleado){
		empleado.nuevaListaDeHabilidades(habilidadesRequeridas)
	}
}

class Oficinista{
	var cantidadEstrellas = 0
	method saludCritica() = 40 - 5 * cantidadEstrellas
	method otorgarPremio(){cantidadEstrellas += 1}
}

class Mision{
	
	var peligrosidad
	
	const habilidadesRequeridas = []
	
	
	method serCumplidaPor(alguien){
		if(self.validadHabilidades(alguien)){
			alguien.recibirdanio(peligrosidad)			
			alguien.otorgarPremio(habilidadesRequeridas)
		}
		else
			self.error("No se pudo cumplir la mision")
	}
	
	method validadHabilidades(alguien) = habilidadesRequeridas.all({habilidad => alguien.puedeUsar(habilidad)})
}

class Equipo{
	
	var empleados = []
	
	method puedeUsar(habilidad){
		empleados.any({empleado => empleado.puedeUsar(habilidad)})
	}
	
	method otorgarPremio(habilidadesRequeridas){
		empleados.forEach({empleado => empleado.otorgarPremio(habilidadesRequeridas)})
	}	

	method recibirdanio(peligrosidad){
		empleados.forEach({empleado => empleado.recibirdanio(peligrosidad/3)})
	}
}