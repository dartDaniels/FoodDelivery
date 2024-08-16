//
//  PositionCell.swift
//  FoodDelivery
//
//  Created by Данила Казмирук on 16.08.2024.
//

import SwiftUI

struct PositionCell: View {
    let position: OrderModel
    var body: some View {
        HStack {
            
            VStack(alignment: .leading) {
                Divider()
                Text(position.product.name)
                    .fontWeight(.bold)
                    .font(.title)
                Text("\(position.count) count")
                    .font(.title2)
                Text("\(position.amount) ₽")
                    .font(.title2)
                Divider()
            }
            
        }.padding(.horizontal)
    }
}

#Preview {
    PositionCell(position: OrderModel(id: UUID().uuidString,
                                      product: ProductModel(
                                        id: UUID().uuidString,
                                        name: "coca-cola",
                                        cost: 500,
                                        description: "tasty",
                                        imageURL: "Not found"), count: 1))
}
