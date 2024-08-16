//
//  ProfileView.swift
//  FoodDelivery
//
//  Created by Данила Казмирук on 26.07.2024.
//

import SwiftUI

struct ProfileView: View {
    @State private var name = "Daniel"
    @State private var phoneNumber = "+7(913)6254090"
    @State private var adress = "Russia, Omsk, Lermontova, 136, 188, 644001"
    @State private var isSignedIn = false
    var body: some View {
        
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(name)
                        .font(.system(size: 24))
                        .bold()
                    Text(phoneNumber)
                        .font(.system(size: 16))
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
                    Text("Delivery adress: ").font(.system(size: 24))
                    Text(adress).font(.system(size: 16))
                        .padding(.bottom, 16)
                    
                }.padding(.trailing, 30)

            }
            VStack {
                CustomButton(action: {
                    isSignedIn.toggle()
                }, label: "Sign Out")
            }
            Spacer()
        }
        
        
    }
}

#Preview {
    ProfileView()
}
