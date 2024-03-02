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
    let tag, secondTag, thirdTag: Tag
    let memoro, secondMemoro, thirdMemoro: Memoro
    
        init() throws {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        container = try ModelContainer(for: Memoro.self, configurations: config)
        
        tag = Tag(tagName: "Test tag")
        memoro = Memoro(title: "Basic infos", body: "La on explique plein de trucs chiants et c'est super long wesh, on pourrait mettre des liens wikipedia https://wikipedia.com/random et-ce que celui là existe ? je ne sais pas. J'ai commandé un clavier sans fil keychron, on va voir si c'est bien. J'aime bien la sensatoin du clavier du mac, apple est vraiment balaise pour ça. Par contre la magic mouse pue la pisse.", tag: tag)
        
//        container.mainContext.insert(tag)
            
        secondTag = Tag(tagName: "second tag")
        secondMemoro = Memoro(title: "Notre deuxième memoro", body: "La on est sur une autre infos de type test, pas mal de trucs à dire aussi mais bon on va juste blablater au lieu de lorem ipsum. donc on blablate, on regarde speedon, on est fatigué, on avance pas trop à cause de swift playgroudn qui pue la pisse et qui fait que de crash donc c'est chiant pour apprendre l'ui en fait, vu que je connais R. Bref.", tag: secondTag)
        
        thirdTag = Tag(tagName: "troisième tag")
        thirdMemoro = Memoro(title: "Le troisième memoro, c'est pour le test de grid", body: "Juste un petit corps de texte cette fois, pas grand chose à dire même si bon, on a quand même un peu de texte à mettre. On va pas tarder à aller se coucher.")
            
        container.mainContext.insert(memoro)
        container.mainContext.insert(secondMemoro)
        container.mainContext.insert(thirdMemoro)
    }
    
}
