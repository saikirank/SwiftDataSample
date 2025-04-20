//
//  SwiftDataSampleApp.swift
//  SwiftDataSample
//
//  Created by Saikiran K on 18/04/25.
//

import SwiftUI
import SwiftData
@main
struct SwiftDataSampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Destination.self)
        
    }
}
