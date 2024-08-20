//
//  DeliveryModel.swift
//  FoodDelivery
//
//  Created by Данила Казмирук on 20.08.2024.
//

import Foundation
import FirebaseFirestore

struct DeliveryModel {
    var id: String = UUID().uuidString
    var userID: String
    var date: Date
    var status: String
    var positions = [OrderModel]()
    
    var amount: Int {
        var sum = 0
        for position in positions {
            sum += position.amount
        }
        return sum
    }
    
    var represent: [String : Any] {
        var rep = [String : Any]()
        
        rep["id"] = id
        rep["userID"] = userID
        rep["date"] = Timestamp(date: date)
        rep["status"] = status
        return rep
    }
    
    init(id: String = UUID().uuidString, userID: String, date: Date, status: String, positions: [OrderModel] = [OrderModel]()) {
        self.id = id
        self.userID = userID
        self.date = date
        self.status = status
        self.positions = positions
    }
    
    init?(doc: QueryDocumentSnapshot) {
        let data = doc.data()
        
        guard let id = data["id"] as? String else {return nil}
        guard let userID = data["userID"] as? String else {return nil}
        guard let date = data["date"] as? Timestamp else {return nil}
        guard let status = data["status"] as? String else {return nil}
        
        self.id = id
        self.userID = userID
        self.date = date.dateValue()
        self.status = status
    }
    
}
