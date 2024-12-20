//
//  ContentView.swift
//  WordScramble
//
//  Created by Anton Serdyuchenko on 19.12.2024.
//

import SwiftUI

struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
        }
        .navigationTitle(rootWord)
        .onSubmit(addNewWord)
            
//        VStack {
//            List {
//                Text("Static Row")
//
//                ForEach(people, id: \.self) {
//                    Text($0)
//                }
//
//                Text("Static Row")
//            }.listStyle(.grouped)
//        }
//        .padding()
    }
    
    func addNewWord() {
        // lowercase and trim the word, to make sure we don't add duplicate words with case differences
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

        // exit if the remaining string is empty
        guard answer.count > 0 else { return }

        // extra validation to come

        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    
//    func testBundle() throws {
//        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
//            if let fileContents = try? String(contentsOf: fileURL) {
//                // we loaded the file into a string!
//            }
//        }
//    }
//    
//    func testString() throws {
//        let input = "a b c"
//        let letters = input.components(separatedBy: " ")
//        let letter = letters.randomElement()
//        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
//        
//        let word = "swift"
//        let checker = UITextChecker()
//        let range = NSRange(location: 0, length: word.utf16.count)
//        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
//        let allGood = misspelledRange.location == NSNotFound
//    }
}

#Preview {
    ContentView()
}
