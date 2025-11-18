// SuperHeroesData.swift
// Usa el enum `PoderesSuperheroes` para las habilidades.

import Foundation

protocol Searchable {

    var searchableText: String { get }
}

struct SuperHero: Identifiable, Hashable, Searchable {
    let id = UUID()
    let nombreReal: String
    let apodo: String
    let descripcion: String
    let edad: Int
    let poderes: [PoderesSuperheroes]
    let imagen: String

    var searchableText: String {
        [nombreReal, apodo]
            .filter { !$0.isEmpty }
            .joined(separator: " ")
            .foldingDiacritics
    }

    init(nombreReal: String, apodo: String, descripcion: String, edad: Int, poderes: [PoderesSuperheroes], imagen: String) {
        self.nombreReal = nombreReal
        self.apodo = apodo
        self.descripcion = descripcion
        self.edad = edad
        self.poderes = poderes
        self.imagen = imagen
    }
}

let SUPERHEROES: [SuperHero] = [
    SuperHero(
        nombreReal: "Juan Martínez",
        apodo: "TeleMente",
        descripcion: "Después de un accidente en un laboratorio de neurociencia, Juan adquirió la capacidad de leer y manipular pensamientos.",
        edad: 32,
        poderes: [.telepatia],
        imagen: "telemente"
    ),
    SuperHero(
        nombreReal: "Laura Blanco",
        apodo: "Ala de Águila",
        descripcion: "Laura siempre soñó con volar. Un encuentro con un águila mística le otorgó el don del vuelo.",
        edad: 28,
        poderes: [.vuelo],
        imagen: "alaDeAguila"
    ),
    SuperHero(
        nombreReal: "Miguel Torres",
        apodo: "Roca",
        descripcion: "Miguel puede levantar objetos de toneladas sin esfuerzo gracias a una maldición de un dios olvidado.",
        edad: 35,
        poderes: [.superFuerza],
        imagen: "roca"
    ),
    SuperHero(
        nombreReal: "Elena García",
        apodo: "Sombra",
        descripcion: "Elena descubrió su habilidad para volverse invisible después de un misterioso encuentro en un bosque encantado. Ahora, utiliza su poder para operar en secreto y proteger a los inocentes.",
        edad: 29,
        poderes: [.invisibilidad, .teletransportacion],
        imagen: "sombra"
    ),
    SuperHero(
        nombreReal: "Daniel Ortiz",
        apodo: "Cronos",
        descripcion: "Daniel puede alterar y viajar en el tiempo después de encontrar un antiguo reloj en una excavación arqueológica. Con este poder, busca corregir errores del pasado y asegurar un futuro mejor.",
        edad: 34,
        poderes: [.manipulacionDelTiempo],
        imagen: "cronos"
    ),
    SuperHero(
        nombreReal: "Isabel Ruiz",
        apodo: "Elementa",
        descripcion: "Isabel puede controlar y manipular los elementos naturales. Un ritual ancestral le otorgó el don de dominar fuego, agua, tierra y aire a su antojo.",
        edad: 27,
        poderes: [.controlElemental, .telepatia],
        imagen: "elementa"
    ),
    SuperHero(
        nombreReal: "Luis Fernández",
        apodo: "Reflejo",
        descripcion: "Luis puede crear duplicados exactos de sí mismo que actúan de forma independiente. Estos duplicados son temporales y desaparecen después de un tiempo. Utiliza este poder para estar en múltiples lugares a la vez, ayudando a quien lo necesita.",
        edad: 28,
        poderes: [.duplicacion],
        imagen: "reflejo"
    ),
    SuperHero(
        nombreReal: "Carmen Morales",
        apodo: "Eco",
        descripcion: "Carmen puede imitar y amplificar cualquier sonido que haya escuchado, utilizando estas habilidades para comunicarse, desorientar a sus enemigos o incluso como una forma de sonar.",
        edad: 26,
        poderes: [.imitacionDeSonido, .amplificacionDelSonido],
        imagen: "eco"
    ),
    SuperHero(
        nombreReal: "Miguel Álvarez",
        apodo: "Pulso",
        descripcion: "Miguel puede generar y controlar vibraciones a su antojo. Ya sea para causar terremotos, crear barreras de ondas de choque o incluso volar al vibrar a altas velocidades.",
        edad: 30,
        poderes: [.generacionDeVibraciones, .controlDeVibraciones],
        imagen: "pulso"
    ),
    SuperHero(
        nombreReal: "Beatriz Jiménez",
        apodo: "LuzEstelar",
        descripcion: "Beatriz puede manipular y emitir luz de diferentes intensidades y colores. Utiliza esta habilidad para iluminar lugares oscuros, crear ilusiones ópticas o incluso emitir destellos cegadores para defenderse de adversarios.",
        edad: 29,
        poderes: [.manipulacionDeLaLuz, .emisionDeLuz],
        imagen: "luzEstelar"
    ),
    SuperHero(
        nombreReal: "Pedro Sánchez",
        apodo: "Giro",
        descripcion: "Pedro tiene la habilidad de girar sobre sí mismo a velocidades increíbles, creando tornados o simplemente moviéndose rápidamente de un lugar a otro. A menudo se le ve como un torbellino en movimiento cuando usa su poder al máximo.",
        edad: 31,
        poderes: [.giroRapido, .creacionDeTornados],
        imagen: "giro"
    ),
    SuperHero(
        nombreReal: "Sara López",
        apodo: "Geo",
        descripcion: "Sara puede manipular la tierra y las rocas a su antojo. Desde levantar muros de piedra hasta causar pequeños terremotos, Geo es una fuerza a tener en cuenta cuando está conectada con el suelo.",
        edad: 27,
        poderes: [.manipulacionDeLaTierra, .creacionDeRocas],
        imagen: "geo"
    ),
    SuperHero(
        nombreReal: "Lucas Ortega",
        apodo: "Vórtex",
        descripcion: "",
        edad: 29,
        poderes: [.manipulacionDelClima, .teletransportacion],
        imagen: "vortex"
    ),
    SuperHero(
        nombreReal: "Diana Ruiz",
        apodo: "Psique",
        descripcion: "",
        edad: 32,
        poderes: [.manipulacionMental, .telepatia],
        imagen: "psique"
    ),
    SuperHero(
        nombreReal: "Javier Molina",
        apodo: "Titán",
        descripcion: "",
        edad: 38,
        poderes: [.superFuerza, .invulnerabilidad],
        imagen: "titan"
    ),
    SuperHero(
        nombreReal: "Carla Martínez",
        apodo: "Armadura",
        descripcion: "",
        edad: 28,
        poderes: [.pielMetalica, .superFuerza],
        imagen: "armadura"
    ),
    SuperHero(
        nombreReal: "Hugo Valdez",
        apodo: "Tempestad",
        descripcion: "",
        edad: 34,
        poderes: [.manipulacionDelClima, .vuelo],
        imagen: "tempestad"
    ),
    SuperHero(
        nombreReal: "Lucía Ortega",
        apodo: "Sirena",
        descripcion: "",
        edad: 26,
        poderes: [.manipulacionDelAgua, .comunicacionConVidaMarina, .transformacionEnFormaAcuatica],
        imagen: "sirena"
    ),
    SuperHero(
        nombreReal: "Tomás Guerrero",
        apodo: "Eclipse",
        descripcion: "",
        edad: 31,
        poderes: [.manipulacionDeSombras, .teletransportacionATravesDeSombras],
        imagen: "eclipse"
    ),
    SuperHero(
        nombreReal: "Sofía Ríos",
        apodo: "Fénix",
        descripcion: "",
        edad: 29,
        poderes: [.regeneracion, .manipulacionDelFuego, .vuelo],
        imagen: "fenix"
    ),
]

// MARK: - Extensions

extension SuperHero {

    static let test = SUPERHEROES[7]
}
