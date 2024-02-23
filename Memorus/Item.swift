//
//  Item.swift
//  Memorus
//
//  Created by Paul-Edouard Boudier on 23/02/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
