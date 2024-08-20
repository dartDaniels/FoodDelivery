//
//  AuthService.swift
//  FoodDelivery
//
//  Created by Данила Казмирук on 17.08.2024.
//

import Foundation
import FirebaseAuth

class AuthService {
    
    static let shared = AuthService()
    
    private init() {
        
    }
    private let authorization = Auth.auth()
    
    var currentUser: User? {
        return authorization.currentUser
    }
    
    func signUp(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        authorization.createUser(withEmail: email,
                        password: password) { result, error in
            
            if let result = result {
                let ProfileModel = ProfileModel(id: result.user.uid,
                                                name: "",
                                                phoneNumber: 0,
                                                adress: "")
                DatabaseService.shared.setUser(user: ProfileModel) { res in
                    switch res {
                        
                    case .success(_):
                        completion(.success(result.user))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func signIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        authorization.signIn(withEmail: email, password: password) { result, error in
            if let result = result {
                completion(.success(result.user))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func signOut() {
        do {
            try authorization.signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }    }
    
}
