//
//  ProductDetailView.swift
//  FoodDelivery
//
//  Created by Данила Казмирук on 28.07.2024.
//

import SwiftUI

struct ProductDetailView: View {
    
    var viewModel: ProductDetailViewModel
    @State var count = 12
    @State var package = 0
    
    @Environment(\.presentationMode) var presentationMode
    
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
                Text("cost: \(viewModel.product.cost) ₽")
                    .font(.title2)
            }.padding(.horizontal)
            
            Text("\(viewModel.product.description)")
                .padding(.horizontal)
                .padding(.vertical, 4)
                .font(.title2)
            
            Picker("Count", selection: $count) {
                ForEach(viewModel.count, id: \.self) { count in
                    Text("\(count)")
                }
            }
            .pickerStyle(.segmented)
            .padding()
//            VStack {
//                Stepper("choose count of packages \(package)") {
//                    package = package + 1
//                } onDecrement: {
//                    package = package - 1
//                }
//
//                    }
//            .padding(.horizontal)
            Spacer()
            HStack(alignment: .center) {
                CustomButton(action: {
                    let el = OrderModel(id: UUID().uuidString,
                                        product: viewModel.product,
                                        count: self.count)
                    
                    CartViewModel.shared.addToCart(position: el)
                    presentationMode.wrappedValue.dismiss()
                }, label: "ADD TO CART")
            }.padding(.bottom, 150)
            .frame(maxWidth: .infinity)
        }
        .ignoresSafeArea()
        .padding(.top, 10)
        
    }
}

#Preview {
    ProductDetailView(viewModel: ProductDetailViewModel(product: ProductModel(id: "1", name: "coca-cola", cost: 100, description: "tasty", imageURL: "Not found")))
}
