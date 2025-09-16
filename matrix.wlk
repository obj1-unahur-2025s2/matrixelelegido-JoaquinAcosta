object neo {

    var energia = 100

    method esElElegido() {
        return true
    }

    method saltar() {
        energia = energia / 2
    }

    method vitalidad() {
        return energia / 10
    } 

}

object morfeo {

    var vitalidad = 8
    var cansado = false

    method esElElegido() {
        return false
    }

    method vitalidad() {
        return vitalidad
    }

    method saltar() {
        vitalidad = (vitalidad - 1).max(0)
        cansado = not cansado
    }

    method estaCansado() {
        return cansado
    }

}

object trinity {
    method vitalidad() {
        return 0
    }

    method esElElegido() {
        return false
    }
    method saltar() {
      
    }

}

object nave {
    const pasajeros = #{neo, morfeo, trinity}

    method cantidadDePasajeros() =  pasajeros.size()

    method pasajeroConMayorVitalidad() = pasajeros.max({p=>p.vitalidad()})


    /*
    method estaEquilibrada() = pasajeros.map({ p => p.vitalidad() * 2 }).all(
            { v => v > self.pasajeroConMayorVitalidad().vitalidad() }
        )
    */

    method estaElElegido() = pasajeros.any({p => p.esElElegido()})

    method chocar() {
        pasajeros.forEach({p => p.saltar()})
        pasajeros.clear()
    }

    method pasajerosQueNoSonElegidos() =  pasajeros.filter({ p => not p.esElElegido()})

    method acelerar() {
        self.pasajerosQueNoSonElegidos().forEach({ p => p.saltar()})
    }
}