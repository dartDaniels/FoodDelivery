//
//  CatalogView.swift
//  FoodDelivery
//
//  Created by Данила Казмирук on 26.07.2024.
//

import SwiftUI

struct CatalogView: View {
    private var titleFirst = "Recomend"
    private var titleSecond = "Catalog"
    let horizontalLayout = [GridItem(.adaptive(minimum: screen.width / 2.4))]
    let verticalLayout = [GridItem(.adaptive(minimum: screen.width / 2.4))]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                Section(titleFirst) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: horizontalLayout, spacing: 15, content: {
                            ForEach(CatalogViewModel.shared.products, id: \.id) { item in
                                NavigationLink {
                                    let viewModel = ProductDetailViewModel(product: item)
                                    ProductDetailView(viewModel: viewModel)
                                } label: {
                                    ProductCell(product: item)
                                }
                            }
                        }).padding(.all, 5)
                    }
                }
                Section() {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: verticalLayout, spacing: 15, content: {
                            ForEach(CatalogViewModel.shared.products, id: \.id) { item in
                                NavigationLink {
                                    let viewModel = ProductDetailViewModel(product: item)
                                    ProductDetailView(viewModel: viewModel)
                                } label: {
                                    ProductCell(product: item)
                                }
                                
                            }
                        }).padding(.all, 5)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(titleSecond)
                        .font(.title).bold()
                        .foregroundStyle(.purple)
                        .ignoresSafeArea()
                }
                
            }
        }.accentColor(.purple)
    }
}

#Preview {
    CatalogView()
}
