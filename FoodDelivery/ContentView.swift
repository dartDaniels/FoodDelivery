//
//  ContentView.swift
//  FoodDelivery
//
//  Created by Данила Казмирук on 18.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isRegistrated = true
    
    @State private var phoneNumber = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var passIsEmpty = false
    
    
    var body: some View {
        VStack(spacing: 10) {
            Text(isRegistrated ? "Authorization" : "Registration")
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
                SecureField("Введите пароль", text: $password)
                    .padding()
                    .background(password == "" ? Color("PrimaryGray") : Color("SecondaryGreen"))
                    .cornerRadius(12)
                    .padding()
            }
            
            if !isRegistrated {
                SecureField("Повторите пароль", text: $confirmPassword)
                    .padding()
                    .background(confirmPassword == "" ? Color("PrimaryGray") : Color("SecondaryGreen"))
                    .cornerRadius(12)
                    .padding()
            }
            
            Button {
                if password.isEmpty {
                    passIsEmpty = true
                }
            }
        label: {
            Text(isRegistrated ? "Enter" : "Create account")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(phoneNumber == "" || password == "" ?
                                Color("PrimaryGray") :
                                Color("SecondaryGreen"))
                    .cornerRadius(12)
                    .padding()
                    .accentColor(.black)
                    .font(.title3.bold())
            }.alert("Please, enter your password", isPresented: $passIsEmpty) {
                Text("OK")
            }
            
            Button(action: {
                isRegistrated.toggle()
            }, label: {
                Text(isRegistrated ? "Don't have account?" : "Have account")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("SecondaryGreen"))
                    .cornerRadius(12)
                    .padding()
                    .accentColor(.black)
                    .font(.title3.bold())
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Image("FdBackground").ignoresSafeArea().blur(radius: 3))
        .animation(Animation.easeInOut(duration: 0.5))
    }
}

#Preview {
    ContentView()
}
