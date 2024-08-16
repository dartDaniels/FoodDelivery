//
//  MainTabBarViewModel.swift
//  FoodDelivery
//
//  Created by Данила Казмирук on 17.08.2024.
//

import Foundation
import FirebaseAuth

class MainTabBarViewModel: ObservableObject {
    
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
}
