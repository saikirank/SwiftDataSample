//
//  EditDestination.swift
//  SwiftDataSample
//
//  Created by Saikiran K on 19/04/25.
//

import SwiftUI
import SwiftData

struct EditDestination: View {
    @Bindable var destination: Destination
    var body: some View {
        Form {
            TextField(destination.name, text: $destination.name)
            DatePicker("Date", selection: $destination.date)

            Section("Priority") {
                Picker("Priority", selection: $destination.priority) {
                    Text("Meh").tag(0)
                    Text("Maybe").tag(1)
                    Text("Must").tag(2)
                }.pickerStyle(.segmented)
            }
        }.navigationTitle("Edit Destination")
            .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Destination.self, configurations: config)
        let dest = Destination(name: "Heelo", details: "")
            
        return EditDestination(destination: dest)
            .modelContainer(container)
    } catch  {
        fatalError("fff")
    }
   
}
