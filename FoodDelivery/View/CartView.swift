//
//  CartView.swift
//  FoodDelivery
//
//  Created by Данила Казмирук on 26.07.2024.
//

import SwiftUI

struct CartView: View {
    
    @StateObject var viewModel: CartViewModel
    
    var body: some View {
        VStack {
            List(viewModel.cart, id: \.id) { position in
                PositionCell(position: position)
                    .swipeActions {
                        Button(action: {
                            withAnimation {
                                viewModel.cart.removeAll { el in
                                    el.id == position.id
                                }
                            }
                            
                        }, label: {
                            Text("Remove").accentColor(.secondaryGreen)
                                .foregroundColor(.white)
                        })
                    }
            }
            .listStyle(.plain)
            HStack {
                Text("amount: ")
                Spacer()
                Text("\(self.viewModel.cost) ₽")
            }.padding(.all)
            VStack {
                CustomButton(action: {
                    print("canceled")
                }, label: "REMOVE ORDER")
                CustomButton(action: {
                    guard let user = AuthService.shared.currentUser else {
                        print("User is not authenticated")
                        return
                    }
                    var order = DeliveryModel(userID: AuthService.shared.currentUser!.uid, date: Date(), status: StatusModel.completed.rawValue)
                    order.positions = self.viewModel.cart
                    
                    DatabaseService.shared.makeOrder(order: order) { result in
                        switch result {
                            
                        case .success(let order):
                            print(order.amount)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                }, label: "ORDER NOW")
            }

        }
        
        
    }
}

#Preview {
    CartView(viewModel: CartViewModel.shared)
}
