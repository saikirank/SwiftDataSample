//
//  Destination.swift
//  SwiftDataSample
//
//  Created by Saikiran K on 18/04/25.
//

import Foundation
import SwiftData

@Model
class Destination {
    @Attribute(.unique)
    var name: String
    var details: String
    var date: Date
    var priority: Int
    
    init(name: String = "", details: String = "", date: Date = .now , priority: Int = 2) {
        self.name = name
        self.details = details
        self.date = date
        self.priority = priority
    }
}
