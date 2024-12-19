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
    
    func testBundle() throws {
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                // we loaded the file into a string!
            }
        }
    }
}

#Preview {
    ContentView()
}
