//
//  ContentView.swift
//  FoodDelivery
//
//  Created by Данила Казмирук on 18.07.2024.
//

import SwiftUI

struct AuthView: View {
    
    @State private var isRegistrated = true
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var passIsEmpty = false
    @State private var isTabViewEnable = false
    @State private var isButtonDisabled = true
    
    
    var body: some View {
        VStack(spacing: 10) {
            Text(isRegistrated ? "Authorization" : "Registration")
                .padding()
                .padding(.horizontal, 20)
                .font(.title2.bold())
                .background(Color("ButtonPurple"))
                .cornerRadius(30.0)
            
            VStack {
                TextField("Enter your email", text: $email)
                    .padding()
                    .background(email == "" ? Color("PrimaryGray") : Color("ButtonPurple"))
                    .cornerRadius(12)
                    .padding()
                    .textContentType(.oneTimeCode)
                SecureField("Enter password", text: $password)
                    .padding()
                    .background(password == "" ? Color("PrimaryGray") : Color("ButtonPurple"))
                    .cornerRadius(12)
                    .padding()
                    .textContentType(.oneTimeCode)
            }
            
            if !isRegistrated {
                SecureField("Repeat password", text: $confirmPassword)
                    .padding()
                    .background(confirmPassword == password ? Color("PrimaryGray") : Color("ButtonPurple"))
                    .cornerRadius(12)
                    .padding()
                    .textContentType(.oneTimeCode)
            }
            
            
            
            Button {
                if password.isEmpty {
                    passIsEmpty = true
                }
                if isRegistrated {
                    AuthService.shared.signIn(email: email,
                                              password: password) { result in
                        switch result {
                            
                        case .success(_):
                            isTabViewEnable.toggle()
                        case .failure(let error):
                            print("something goes wrong: \(error.localizedDescription)")
                        }
                    }
                    
                } else {
                    
                    AuthService.shared.signUp(email: self.email,
                                              password: self.password) { result in
                        switch result {
                            
                        case .success(_):
                            print("You are registrated!")
                            self.email = ""
                            self.password = ""
                            self.confirmPassword = ""
                            self.isRegistrated.toggle()
                        case .failure(let error):
                            print("Error\(error.localizedDescription)")
                        }
                    }
                    
                    
                }
            }
        label: {
            Text(isRegistrated ? "Enter" : "Create account")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(email == "" || password == "" ?
                                Color("PrimaryGray") :
                                Color("ButtonPurple"))
                    .cornerRadius(12)
                    .padding()
                    .accentColor(.black)
                    .font(.title3.bold())
            }.alert("Please, enter your password", isPresented: $passIsEmpty) {
                Text("OK")
            }.disabled(password == "" || email == "" ? isButtonDisabled == true : isButtonDisabled == false)
            
            Button(action: {
                isRegistrated.toggle()
            }, label: {
                Text(isRegistrated ? "Don't have account?" : "Have account")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("ButtonPurple"))
                    .cornerRadius(12)
                    .padding()
                    .accentColor(.black)
                    .font(.title3.bold())
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Image("FdBackground").resizable().ignoresSafeArea())
        .background(Color("BGPurple"))
        .animation(Animation.easeInOut(duration: 0.5), value: isRegistrated)
        .fullScreenCover(isPresented: $isTabViewEnable, content: {
            let tabBarViewModel = MainTabBarViewModel(user: AuthService.shared.currentUser!)
            
            TabBar(viewModel: tabBarViewModel)
        })
    }
}

#Preview {
    AuthView()
}
