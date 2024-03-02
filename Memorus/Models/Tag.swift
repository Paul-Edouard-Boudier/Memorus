//
//  Tag.swift
//  Memorus
//
//  Created by Paul-Edouard Boudier on 28/02/2024.
//

import Foundation
import SwiftData

@Model
/// Just a Tag to regroup Memoroj under same themes
class Tag {
    
    var tagName: String = ""
//    var imageDescription: ??
    var memoroj: [Memoro]? = [Memoro]()
    
    /// initializer of class
    /// - Parameter tagName: String simply the name of the tag
    /// - Parameter memoroj: list of  memoro linked to this tag
    init(tagName: String) {
        self.tagName = tagName
//        self.memoroj = memoroj
    }
}
