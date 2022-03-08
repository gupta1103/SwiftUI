//
//  ContentView.swift
//  WeSplit
//
//  Created by Akanksha Gupta on 07/03/22.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    @State private var showForm = true
    @State private var tapCount = 0
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 3
    @State private var tipPercentage = ""
    let students = ["IronMan", "Thor", "Hulk", "Barton", "Loki"]
    let tipPercentages = [10, 15, 20, 25, 0]
    @State private var selectedStudent = ""
    var body: some View {
        NavigationView {
            Form {
                Section{
                    Toggle("Greeting Message With Name", isOn: $showForm)
                    if showForm {
                        TextField("Enter your name:", text: $name)
                        Text("Hello \(name), Good Morning!")
                        Button(action: {
                            print("Hello \(name), Good Morning!")
                            tapCount += 1
                            print("Tap Count: \(tapCount)")
                        }, label: {
                            Text("Done")
                                .foregroundColor(.white)
                                .bold()
                                .frame(width: 200, height: 50, alignment: .center)
                                .background(Color.blue)
                                .cornerRadius(8)
                        }) .padding()
                    }
                    Picker("Select your student", selection: $selectedStudent) {
                        ForEach(students, id: \.self) {
                            Text($0)
                        }
                        .navigationTitle("Students")
                    }
                    Text("You selected: \(selectedStudent)")
                }

                Section {
                    if #available(iOS 15.0, *) {
                        TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                            .keyboardType(.decimalPad)
                    } else {
                        // Fallback on earlier versions
                    }
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                    Text("Number of people selected: \(numberOfPeople)")
                }
                
                if #available(iOS 15.0, *) {
                    Section {
                        Picker("Tip percentage", selection: $tipPercentage) {
                            ForEach(tipPercentages, id: \.self) {
                                Text("\($0) Tip")
                            }
                        }
                        .pickerStyle(.automatic)
                    } header: {
                        Text("How much tip do you want to leave?")
                    }
                    .padding()
                } else {
                    // Fallback on earlier versions
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
