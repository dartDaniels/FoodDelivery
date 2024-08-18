//
//  DatabaseService.swift
//  FoodDelivery
//
//  Created by Данила Казмирук on 19.08.2024.
//

import Foundation
import FirebaseFirestore

class DatabaseService {
    
    static let shared = DatabaseService()
    
    private let Database = Firestore.firestore()
    
    private var userRef: CollectionReference {
        return Database.collection("users")
    }
    
    private init() { }
    
    func setUser(user: ProfileModel, completion: @escaping (Result<ProfileModel, Error>) -> Void) {
        
        userRef.document(user.id).setData(user.usersData) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }
    
    func getProfile(completion: @escaping (Result<ProfileModel, Error>) -> Void) {
        userRef.document(AuthService.shared.currentUser!.uid).getDocument { docSnapshot, error in
            guard let snap = docSnapshot else {return}
            guard let data = snap.data() else {return}
            
            guard let userName = data["name"] as? String else {return}
            guard let id = data["id"] as? String else {return}
            guard let phoneNumber = data["phoneNumber"] as? Int else {return}
            guard let adress = data["adress"] as? String else {return}
            
            let user = ProfileModel(id: id, name: userName, phoneNumber: phoneNumber, adress: adress)
            
            completion(.success(user))
        }
    }
}
