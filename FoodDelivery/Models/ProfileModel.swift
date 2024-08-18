//
//  ProfileModel.swift
//  FoodDelivery
//
//  Created by Данила Казмирук on 19.08.2024.
//

import Foundation

struct ProfileModel: Identifiable {
    var id: String
    var name: String
    var phoneNumber: Int
    var adress: String
    
    var usersData: [String : Any] {
        var userData = [String : Any]()
        userData["id"] = self.id
        userData["name"] = self.name
        userData["phoneNumber"] = self.phoneNumber
        userData["adress"] = self.adress
        
        return userData
    }
}

