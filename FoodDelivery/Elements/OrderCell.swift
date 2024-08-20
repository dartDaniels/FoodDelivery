//
//  OrderCell.swift
//  FoodDelivery
//
//  Created by Данила Казмирук on 21.08.2024.
//

import SwiftUI

struct OrderCell: View {
    var order: DeliveryModel
    
    var body: some View {
        HStack {
            Text("\(order.date)")
            Text(order.status)
            Text("\(order.amount)")
        }
        
    }
}

//#Preview {
//    OrderCell()
//}
