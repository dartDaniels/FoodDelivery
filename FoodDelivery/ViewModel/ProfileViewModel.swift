//
//  ProfileViewModel.swift
//  FoodDelivery
//
//  Created by Данила Казмирук on 19.08.2024.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var profile: ProfileModel
    
    init(profile: ProfileModel) {
        self.profile = profile
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
