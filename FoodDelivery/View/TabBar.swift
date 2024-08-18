//
//  TabBar.swift
//  FoodDelivery
//
//  Created by Данила Казмирук on 26.07.2024.
//

import SwiftUI
struct TabBar: View {
    @State private var selectedTab = 0
    var viewModel: TabBarViewModel

    var body: some View {
        TabView(selection: $selectedTab) {
            CatalogView()
                .tabItem {
                    VStack {
                        Image(selectedTab == 0 ? "CatalogButtonActive" : "CatalogButton")
                        Text("Catalog")
                    }
                }.tag(0)
            CartView(viewModel: CartViewModel.shared)
                .tabItem {
                VStack {
                    Image(selectedTab == 1 ? "CartButtonActive" : "Cart")
                    Text("Cart")
                }
                }.tag(1)
            ProfileView(viewModel: ProfileViewModel(profile: ProfileModel(id: "", name: "", phoneNumber: 0, adress: "")))
                .tabItem {
                VStack {
                    Image("Profile")
                    Text("Cabinet")
                }
                }.tag(2)
        }
    }
}


