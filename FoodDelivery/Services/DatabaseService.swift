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
    
    private var orderRef: CollectionReference {
        return Database.collection("orders")
    }
    
    private init() { }
    
    func getPositions(by orderID: String, completion: @escaping (Result<[OrderModel], Error>) -> Void) {
        let positionRef = orderRef.document(orderID).collection("positions")
        
        positionRef.getDocuments { QuerySnapshot, error in
            if let querrySnapshot = QuerySnapshot {
                var positions = [OrderModel]()
                
                for doc in querrySnapshot.documents {
                    if let position = OrderModel(doc: doc) {
                        positions.append(position)
                    }
                }
                completion(.success(positions))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func getOrders(by userID: String?, completion: @escaping (Result<[DeliveryModel], Error>) -> Void) {
        self.orderRef.getDocuments { QuerySnapshot, error in
            if let QuerySnapshot = QuerySnapshot {
                var orders = [DeliveryModel]()
                for doc in QuerySnapshot.documents {
                    if let userID = userID {
                        if let order = DeliveryModel(doc: doc), order.userID == userID {
                            orders.append(order)
                        }
                    } else {
                        if let order = DeliveryModel(doc: doc) {
                            orders.append(order)
                        }
                    }
                    
                }
                completion(.success(orders))
            } else if let error = error {
                completion(.failure(error))
            }
            
        }
    }
    
    func makeOrder(order: DeliveryModel, completion: @escaping (Result<DeliveryModel, Error>) -> Void) {
        
        orderRef.document(order.id).setData(order.represent) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                self.setPositions(to: order.id, positions: order.positions) { result in
                    switch result {
                    case .success(let positions):
                        print(positions.count)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
                completion(.success(order))
            }
        }
    }
    
    func setPositions(to orderID: String, positions: [OrderModel], completion: @escaping (Result<[OrderModel], Error>) -> Void) {
        let positionRef = orderRef.document(orderID).collection("positions")
        for position in positions {
            positionRef.document(position.id).setData(position.represent)
        }
        
        completion(.success(positions))
    }
    
    func setUser(user: ProfileModel, completion: @escaping (Result<ProfileModel, Error>) -> Void) {
        
        userRef.document(user.id).setData(user.usersData) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }
    
//    func getProfile(completion: @escaping (Result<ProfileModel, Error>) -> Void) {
//        userRef.document(AuthService.shared.currentUser!.uid).getDocument { docSnapshot, error in
//            guard let snap = docSnapshot else {return}
//            guard let data = snap.data() else {return}
//            
//            guard let userName = data["name"] as? String else {return}
//            guard let id = data["id"] as? String else {return}
//            guard let phoneNumber = data["phoneNumber"] as? Int else {return}
//            guard let adress = data["adress"] as? String else {return}
//            
//            let user = ProfileModel(id: id, name: userName, phoneNumber: phoneNumber, adress: adress)
//            
//            completion(.success(user))
//        }
//    }
    func getProfile(completion: @escaping (Result<ProfileModel, Error>) -> Void) {
        guard let currentUser = AuthService.shared.currentUser else {
            completion(.failure(NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: "User is not signed in."])))
            return
        }

        userRef.document(currentUser.uid).getDocument { docSnapshot, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let snap = docSnapshot, let data = snap.data() else {
                completion(.failure(NSError(domain: "", code: 404, userInfo: [NSLocalizedDescriptionKey: "Document not found."])))
                return
            }
            
            guard let userName = data["name"] as? String,
                  let id = data["id"] as? String,
                  let phoneNumber = data["phoneNumber"] as? Int,
                  let adress = data["adress"] as? String else {
                completion(.failure(NSError(domain: "", code: 422, userInfo: [NSLocalizedDescriptionKey: "Invalid data in document."])))
                return
            }
            
            let user = ProfileModel(id: id, name: userName, phoneNumber: phoneNumber, adress: adress)
            
            completion(.success(user))
        }
    }
}
