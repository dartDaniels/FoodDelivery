//
//  OrderModel.swift
//  FoodDelivery
//
//  Created by Данила Казмирук on 16.08.2024.
//

import Foundation
import FirebaseFirestore

struct OrderModel: Identifiable {
    var id: String
    var product: ProductModel
    var count: Int
    
    var amount: Int {
        return product.cost * self.count
    }
    
    var represent: [String : Any] {
        var rep = [String : Any]()
        
        rep["id"] = id
        rep["count"] = count
        rep["name"] = product.name
        rep["price"] = product.cost
        rep["amount"] = self.amount
        
        return rep
    }
    
    internal init(id: String, product: ProductModel, count: Int) {
        self.id = id
        self.product = product
        self.count = count
    }
    
    init?(doc: QueryDocumentSnapshot) {
        let data = doc.data()
        
        guard let id = data["id"] as? String else {return nil}
        guard let name = data["name"] as? String else {return nil}
        guard let cost = data["cost"] as? Int else {return nil}
        guard let count = data["count"] as? Int else {return nil}
        let product: ProductModel = ProductModel(id: "", name: name, cost: cost, description: "", imageURL: "")
        
        self.id = id
        self.product = product
        self.count = count
    }
}
