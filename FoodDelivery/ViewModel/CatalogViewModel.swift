//
//  CatalogViewModel.swift
//  FoodDelivery
//
//  Created by Данила Казмирук on 26.07.2024.
//

import Foundation

class CatalogViewModel: ObservableObject {
    
    static let shared = CatalogViewModel()
    
    var products = [ ProductModel(id: "1", name: "coca-cola", cost: 100, description: "hueta", imageURL: "Not found"),
                    ProductModel(id: "2", name: "coca-cola", cost: 100, description: "tasty", imageURL: "Not found"),
                    ProductModel(id: "3", name: "coca-cola", cost: 100, description: "tasty", imageURL: "Not found"),
                    ProductModel(id: "4", name: "coca-cola", cost: 100, description: "tasty", imageURL: "Not found"),
                    ProductModel(id: "5", name: "coca-cola", cost: 100, description: "tasty", imageURL: "Not found")
    ]
}
