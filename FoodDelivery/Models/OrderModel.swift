//
//  OrderModel.swift
//  FoodDelivery
//
//  Created by Данила Казмирук on 16.08.2024.
//

import Foundation

struct OrderModel: Identifiable {
    var id: String
    var product: ProductModel
    var count: Int
    var amount: Int {
        return product.cost * self.count
    }
}
