//
//  ProfileView.swift
//  FoodDelivery
//
//  Created by Данила Казмирук on 26.07.2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewModel
    @State private var isSignedIn = false
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    TextField("Name", text: $viewModel.profile.name)
                        .font(.system(size: 24))
                        .bold()
                    HStack {
                        Text("+7 (913)")
                            .font(.system(size: 16))
                        TextField("Phone number", value: $viewModel.profile.phoneNumber, format: .number)
                            .font(.system(size: 16))
                    }
                        
                }
                
                Spacer()
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .frame(width: 80, height: 80)
                    .background(Color.secondaryGreen)
                    .clipShape(Circle())
            }
            .padding(.top, 16)
            .padding(.horizontal, 16)
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    VStack(alignment: .leading) {
                        Text("Delivery adress: ").font(.system(size: 24))
                            .padding(.leading, 16)
                        TextField("Delivery adress", text: $viewModel.profile.adress)
                            .font(.system(size: 16))
                            .bold().font(.system(size: 16))
                            .padding(.bottom, 16)
                            .padding(.leading, 16)
                    }
                }.padding(.trailing, 30)

            }
            List {
                if viewModel.orders.count == 0 {
                    Text("Here you can check your orders")
                } else {
                    ForEach(viewModel.orders, id: \.id) { order in
                        OrderCell(order: order)
                    }
                }
            }
            VStack {
                CustomButton(action: {
                    AuthService.shared.signOut()
                    isSignedIn.toggle()
                }, label: "Sign Out")
            }
            Spacer()
        }.fullScreenCover(isPresented: $isSignedIn, content: {
            withAnimation() {
                AuthView()
            }
        })
        .onSubmit {
            viewModel.setProfile()
        }
        
        .onAppear {
            self.viewModel.getProfile()
            viewModel.getOrders()
        }
        
        
    }
}

#Preview {
    ProfileView(viewModel: ProfileViewModel(profile: ProfileModel(id: "", name: "Daniel", phoneNumber: 6254090, adress: "Russia, Omsk, Lermontova, 136, 188, 644001")))
}
