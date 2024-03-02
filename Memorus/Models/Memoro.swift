//
//  Memori.swift
//  Memorus
//  Created by Paul-Edouard Boudier on 28/02/2024.
//

import Foundation
import SwiftData


@Model
/// From Espéranto => memory; plural = Memoroj
/// Class that represent a card with informations that we value and we think that we need to remember
/// It has a short title, a body that can be improved later with some markdown maybe, some images that we
/// could add to it like screenshots
/// It will have a Tag to group  Memoroj
/// it will have some questions linked to it to know if we actually remember the memoro
/// It will have some answers linked to it, or maybe the answers are linked to the questions (i think so)
/// And it could have other stuff but we can always add it later
class Memoro {
    
    var title: String = ""
    var body: String = ""
    var tag: Tag?
//    var image: Image?
//    var questions: Question?
//    var answers: Answer?
    
    /// initializer of class Memoro
    /// - Parameters:
    ///   - title: short string that give the context of the Memoro
    ///   - body: can be huge text that describe a particular piece of information i deem worthy of interest
    ///   - tag: tag of the memoro
    init(title: String, body: String, tag: Tag? = nil) {
        self.title = title
        self.body = body
        self.tag = tag
    }
}
