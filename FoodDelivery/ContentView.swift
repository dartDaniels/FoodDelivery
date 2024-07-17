//
//  ContentView.swift
//  FoodDelivery
//
//  Created by Данила Казмирук on 18.07.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Food delivery!")
                .padding(5)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
