import Foundation

func felizNavidad() {
    let mensaje = "¡Feliz Navidad!"

    for (indice, _) in mensaje.enumerated() {
        let subcadena = mensaje.prefix(indice + 1)

        let emojisFiesta = ["🎉", "🥳", "🎊", "🕺", "💃"] // Emojis de fiesta

        print("\(subcadena) \(emojisFiesta.randomElement() ?? "")")
        fflush(stdout)
        usleep(500000)  // Pausa de 0.5 segundos entre cada línea
    }
}

felizNavidad()
