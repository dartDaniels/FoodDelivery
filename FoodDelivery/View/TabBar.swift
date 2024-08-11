//
//  TabBar.swift
//  FoodDelivery
//
//  Created by Данила Казмирук on 26.07.2024.
//

import SwiftUI
struct TabBar: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            CatalogView()
                .tabItem {
                    VStack {
                        Image(selectedTab == 0 ? "CatalogButtonActive" : "CatalogButton")
                        Text("Catalog")
                    }
                }.tag(0)
            CartView()
                .tabItem {
                VStack {
                    Image(selectedTab == 1 ? "CartButtonActive" : "Cart")
                    Text("Cart")
                }
                }.tag(1)
            ProfileView()
                .tabItem {
                VStack {
                    Image("Profile")
                    Text("Cabinet")
                }
                }.tag(2)
        }
    }
}

#Preview {
    TabBar()
}
