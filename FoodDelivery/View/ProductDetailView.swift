//
//  ProductDetailView.swift
//  FoodDelivery
//
//  Created by Данила Казмирук on 28.07.2024.
//

import SwiftUI

struct ProductDetailView: View {
    
    var viewModel: ProductDetailViewModel
    @State var count = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Image("colaPH")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: 200)
                .clipped()
            HStack {
                Text("name: \(viewModel.product.name)")
                    .font(.title)
                Spacer()
                Text("cost: \(viewModel.product.cost)")
                    .font(.title2)
            }.padding(.horizontal)
            
            Text("\(viewModel.product.description)")
                .padding(.horizontal)
                .padding(.vertical, 4)
                .font(.title2)
            
            Picker("Count", selection: $count) {
                ForEach(viewModel.count, id: \.self) { count in // разобраться????
                    Text("\(count)")
                }
            }
            .pickerStyle(.segmented)
            .padding()
            Spacer()
            
        }.ignoresSafeArea()
            .padding(.top, 10)
        
    }
}

#Preview {
    ProductDetailView(viewModel: ProductDetailViewModel(product: ProductModel(id: "1", name: "coca-cola", cost: 500, description: "tasty", imageURL: "Not found")))
}
