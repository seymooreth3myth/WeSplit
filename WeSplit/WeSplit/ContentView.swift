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
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10,15,20,25,0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var totalValue:Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        return checkAmount + tipValue
    }
    
    var body: some View {
        NavigationView {
            Form {
//                Section {
//                    HStack {
//                        Image(systemName: "globe")
//                            .imageScale(.large)
//                            .foregroundColor(.accentColor)
//                        Text("Hello, world!")
//                    }
//                }
//
//                Section {
//                    Text("Hello, world! 2")
//                }
//
//                Section {
//                    Button("Tap to count \(count)") {
//                        count += 1
//                    }
//                }
//                Section {
//                    TextField("Enter your name", text: $name)
//                    Text("Your name is \(name)")
//                }
//                Section {
//                    Picker("Select your student", selection: $selectedStudent) {
//                        //is the same ForEach(students, {student in Text(\(student))})
//                        ForEach(students, id: \.self) {
//                            Text($0)
//                        }
//                    }
//                }
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section {
                    Picker("Tip a person", selection: $tipPercentage) {
                        ForEach(0..<101, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                  
                } header: {
                    Text("How much tip do you want to leave?")
                }
                Section {
                    Text(totalValue, format: .currency(code: Locale.current.currency?.identifier ?? "USB"))
                } header: {
                    Text("Amount")
                }
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Amount per person:")
                }
              
            }
            .navigationTitle("WeSplit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
