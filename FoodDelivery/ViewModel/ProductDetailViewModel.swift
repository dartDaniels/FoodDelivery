//
//  ProductDetailViewModel.swift
//  FoodDelivery
//
//  Created by Данила Казмирук on 29.07.2024.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    
    @Published var product: ProductModel
    @Published var count = [12, 24, 36, 48]
    
    init(product: ProductModel) {
        self.product = product
    }
    
}
