//
//  CartViewModel.swift
//  FoodDelivery
//
//  Created by Данила Казмирук on 16.08.2024.
//

import Foundation

class CartViewModel: ObservableObject {
    static let shared = CartViewModel()
    
    @Published var cart = [OrderModel]()
    
    func addToCart(position: OrderModel) {
        self.cart.append(position)
    }
    
    var cost: Int {
        var sum = 0
        for el in cart {
            sum = sum + el.amount
        }
        return sum
    }
}

