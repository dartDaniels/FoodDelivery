//
//  ProfileViewModel.swift
//  FoodDelivery
//
//  Created by Данила Казмирук on 19.08.2024.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var profile: ProfileModel
    @Published var orders: [DeliveryModel] = [DeliveryModel]()
    
    init(profile: ProfileModel) {
        self.profile = profile
    }
    
    func getOrders() {
        guard let currentUser = AuthService.shared.currentUser else {
            print("Error: User is not signed in.")
            return
        }
        
        DatabaseService.shared.getOrders(by: AuthService.shared.currentUser!.accessibilityHint) { result in
            switch result {
                
            case .success(let orders):
                self.orders = orders
                for(index, order) in self.orders.enumerated() {
                    DatabaseService.shared.getPositions(by: order.id) { result in
                        switch result {
                            
                        case .success(let positions):
                            self.orders[index].positions = positions
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func setProfile() {
        DatabaseService.shared.setUser(user: self.profile) { result in
            switch result {
                
            case .success(let user):
                print(user.name)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    func getProfile() {
        DatabaseService.shared.getProfile { result in
            switch result {
                
            case .success(let user):
                self.profile = user
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
}
