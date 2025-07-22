//
//  OrderView.swift
//  Appetizers
//
//  Created by Amjed Mohamed Babiker on 16/07/2025.
//



import SwiftUI

struct OrderView: View {
    
    @State private var orderItems = MockData.orders
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(orderItems) { order in
                        AppetizerItemView(appetizer: order)
                    }
                    .onDelete { indexSet in
                        orderItems.remove(atOffsets: indexSet)
                    }
                    
                }
                .listStyle(PlainListStyle())
                Button {
                } label: {
                    
                    PriceButton()
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.regular)
                .tint(.primaryBrand)
                .frame(width: 260, height: 50)
                .padding(25)
            }
            
                .navigationTitle("💵 Orders")
        }
    }
    
    
}


#Preview {
    OrderView()
}
