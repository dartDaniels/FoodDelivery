//
//  ContentView.swift
//  FoodDelivery
//
//  Created by Данила Казмирук on 18.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var phoneNumber = ""
    @State private var password = ""
    @State private var passIsEmpty = false
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Authorization")
                .padding()
                .padding(.horizontal, 20)
                .font(.title2.bold())
                .background(Color("SecondaryGreen"))
                .cornerRadius(30.0)
            
            VStack {
                TextField("Введите номер телефона", text: $phoneNumber)
                    .padding()
                    .background(phoneNumber == "" ? Color("PrimaryGray") : Color("SecondaryGreen"))
                    .cornerRadius(12)
                    .padding()
                SecureField("Введите номер телефона", text: $password)
                    .padding()
                    .background(password == "" ? Color("PrimaryGray") : Color("SecondaryGreen"))
                    .cornerRadius(12)
                    .padding()
            }
            
            Button {
                if password.isEmpty {
                    passIsEmpty = true
                }
            }
        label: {
                Text("Enter")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(phoneNumber == "" ? 
                                Color("PrimaryGray") :
                                Color("SecondaryGreen"))
                    .cornerRadius(12)
                    .padding()
                    .accentColor(.black)
                    .font(.title3.bold())
            }.alert("Please, enter your password", isPresented: $passIsEmpty) {
                Text("OK")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Image("FdBackground").ignoresSafeArea())
        
    }
}

#Preview {
    ContentView()
}
