//
//  ProductCell.swift
//  FoodDelivery
//
//  Created by Данила Казмирук on 26.07.2024.
//

import SwiftUI

struct ProductCell: View {
    var product: ProductModel
    
    var body: some View {
        VStack(alignment: .center) {
            Image("colaPH")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .clipped()
                
            
            HStack {
                Text(product.name)
                    .font(.title3)
                    .padding(.leading)
                Spacer()
                Text("\(product.cost) ₽")
                    .padding(.trailing)
                    .font(.title3)
            }
        }.frame(width: 185, height: 250)
            .background(.white)
            .cornerRadius(16)
            .shadow(radius: 4)
    }
}

#Preview {
    ProductCell(product: ProductModel(id: "1", name: "coca-cola", cost: 100, description: "tasty", imageURL: "Not found"))
}
