//
//  FoodDeliveryApp.swift
//  FoodDelivery
//
//  Created by Данила Казмирук on 18.07.2024.
//

import SwiftUI
import Firebase

let screen = UIScreen.main.bounds

@main
struct FoodDeliveryApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            if let user = AuthService.shared.currentUser {
                TabBar(viewModel: TabBarViewModel(user: user))
            } else {
                AuthView()
            }
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            
            FirebaseApp.configure()
            print("ok")
            
            return true
        }
    }
    
}
