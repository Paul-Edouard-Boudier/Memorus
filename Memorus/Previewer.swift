//
//  Previewer.swift
//  Memorus
//
//  Created by Paul-Edouard Boudier on 01/03/2024.
// PREVIEWER IS BUGGED, CAN'T USE IT FOR NOW.

import Foundation
import SwiftData


@MainActor
struct Previewer {
    let container: ModelContainer
    let tag, secondTag, thirdTag, fourthTag, fifthTag: Tag
    let memoro, secondMemoro, thirdMemoro, fourthMemoro, fifthMemoro, sixthMemoro: Memoro
    
    init() throws {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        container = try ModelContainer(for: Memoro.self, configurations: config)
        
        tag = Tag(tagName: "Test tag")
        secondTag = Tag(tagName: "second tag")
        thirdTag = Tag(tagName: "troisième tag")
        fourthTag = Tag(tagName: "Système et réseaux")
        fifthTag = Tag(tagName: "Python")
            
        memoro = Memoro(title: "Basic infos", body: "La on explique plein de trucs chiants et c'est super long wesh, on pourrait mettre des liens wikipedia https://wikipedia.com/random et-ce que celui là existe ? je ne sais pas. J'ai commandé un clavier sans fil keychron, on va voir si c'est bien. J'aime bien la sensatoin du clavier du mac, apple est vraiment balaise pour ça. Par contre la magic mouse pue la pisse.", tag: tag)
        
        secondMemoro = Memoro(title: "Notre deuxième memoro", body: "La on est sur une autre infos de type test, pas mal de trucs à dire aussi mais bon on va juste blablater au lieu de lorem ipsum. donc on blablate, on regarde speedon, on est fatigué, on avance pas trop à cause de swift playgroudn qui pue la pisse et qui fait que de crash donc c'est chiant pour apprendre l'ui en fait, vu que je connais R. Bref.", tag: secondTag)
        
        thirdMemoro = Memoro(title: "Le troisième memoro, c'est pour le test de grid", body: "Juste un petit corps de texte cette fois, pas grand chose à dire même si bon, on a quand même un peu de texte à mettre. On va pas tarder à aller se coucher.")
            
            
        fourthMemoro = Memoro(title: "Un quatrième memoro", body: "On va désormais tester le scrolling horizontal dans des sous parties, on devrait avoir des espaces segmentés par Tag et ensuite scrolling horizontal dedans bref.", tag: tag)
        
        fifthMemoro = Memoro(title: "Un cinquième memoro", body: "donc la on est sur du memoro pour tester le scrolling vertiacl dans notre appli et l'affichage de nos partie tout simplement. Rien de bien fou mais il faut continuer à écrire pour faire genre", tag: fourthTag)
            
        sixthMemoro = Memoro(title: "python et le web", body: "Pour faire du web avec Python le mieux ça serait quand même de regarder du côté de Django et d'aller voir sur internet. La on devrait plutôt mettre des astuces de codes python, des bouts de codes rigolo ou utiles et puissant. Pas trop de la doc qu'on peut avoir facilement sur internet (je pense ?)", tag: fifthTag)
            
        container.mainContext.insert(memoro)
        container.mainContext.insert(secondMemoro)
        container.mainContext.insert(thirdMemoro)
        container.mainContext.insert(fourthMemoro)
        container.mainContext.insert(fifthMemoro)
        container.mainContext.insert(sixthMemoro)
    }
    
}
