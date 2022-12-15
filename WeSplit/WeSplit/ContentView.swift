//
//  ContentView.swift
//  WeSplit
//
//  Created by Fábio Carlos de Souza on 14/12/22.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"]
   @State private var count = 0
   @State private var name = ""
    @State private var selectedStudent = "Harry"
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Image(systemName: "globe")
                            .imageScale(.large)
                            .foregroundColor(.accentColor)
                        Text("Hello, world!")
                    }
                }
             
                Section {
                    Text("Hello, world! 2")
                }
                
                Section {
                    Button("Tap to count \(count)") {
                        count += 1
                    }
                }
                Section {
                    TextField("Enter your name", text: $name)
                    Text("Your name is \(name)")
                }
                Section {
                    Picker("Select your student", selection: $selectedStudent) {
                        //is the same ForEach(students, {student in Text(\(student))})
                        ForEach(students, id: \.self) {
                            Text($0)
                        }
                    }
                }
            
            }
            .navigationTitle("SwiftUi")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
