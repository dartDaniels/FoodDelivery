//
//  CustomButton.swift
//  FoodDelivery
//
//  Created by Данила Казмирук on 12.08.2024.
//

import SwiftUI
// add to cart
struct CustomButton: View {
    let action: ()->Void
    let label: String
    var destination: AnyView?
    
    init(action: @escaping () -> Void, label: String, destination: AnyView? = nil) {
        self.action = action
        self.label = label
        self.destination = destination
    }
    var body: some View {
        VStack {
            if let destination = destination {
                NavigationLink(destination: destination) {
                    Button(action: action) {
                        HStack {
                            Text(label)
                                .bold()
                                .foregroundColor(.white)
                        }
                        .padding(.all)
                        .padding(.horizontal, 40)
                        .background(Color.secondaryGreen)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .shadow(color: Color.gray, radius: 8, x: 0, y: 0)
                        .mask(Rectangle().padding(.bottom, -20))
                    }
                }
            } else {
                Button(action: action) {
                    HStack {
                        Text(label)
                            .bold()
                            .foregroundColor(.white)
                    }.frame(maxWidth: .infinity)
                    .padding(.all)
                    //.padding(.horizontal, 40)
                    .background(Color.secondaryGreen)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(color: Color.gray, radius: 8, x: 0, y: 0)
                            .mask(Rectangle().padding(.bottom, -20))
                }.padding(.horizontal)
            }
        }
    }
}

#Preview {
    CustomButton(action: {print("tapped")}, label: "Add to cart")
}
