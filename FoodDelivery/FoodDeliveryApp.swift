//
//  FoodDeliveryApp.swift
//  FoodDelivery
//
//  Created by Данила Казмирук on 18.07.2024.
//

import SwiftUI

let screen = UIScreen.main.bounds

@main
struct FoodDeliveryApp: App {
    var body: some Scene {
        WindowGroup {
            AuthView()
        }
    }
}
