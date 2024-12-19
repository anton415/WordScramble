//
//  ContentView.swift
//  WordScramble
//
//  Created by Anton Serdyuchenko on 19.12.2024.
//

import SwiftUI

struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        VStack {
            List {
                Text("Static Row")

                ForEach(people, id: \.self) {
                    Text($0)
                }

                Text("Static Row")
            }.listStyle(.grouped)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
