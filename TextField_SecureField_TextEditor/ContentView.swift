//
    // Project: TextField_SecureField_TextEditor
    //  File: ContentView.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@noahdoescoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    

import SwiftUI

enum Field: Hashable {
    case username, password
}

struct ContentView: View {
    @State private var search: String = ""
    @State private var password: String = ""
    @State private var notes: String = "Type your notes here"
    
    @FocusState private var focusField: Field?
    
    var body: some View {
        VStack(spacing: 8) {
            Text("TextField, SecureField & TextEditor Demo")
                .font(.largeTitle.bold())
                .foregroundStyle(.blue)
                .padding(.bottom, 16)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("TextField")
                    .font(.headline)
                    .foregroundStyle(.purple)
                TextField("Enter username", text: $search)
                    .focused($focusField, equals: .username)
                    .font(.title3)
                    .foregroundStyle(.purple)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 2))
                    .onSubmit {
                        //function or task goes here
                    }
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("SecureField")
                    .font(.headline)
                    .foregroundStyle(.green)
                SecureField("Enter Password", text: $password)
                    .keyboardType(.numberPad)
                    .focused($focusField, equals: .password)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("TextEditor")
                    .font(.headline)
                    .foregroundStyle(.orange)
                TextEditor(text: $notes)
                    .frame(height: 100)
                    .border(Color.yellow)
                    .keyboardType(.URL)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
