//
//  AppetizerItemView.swift
//  Appetizers
//
//  Created by Amjed Mohamed Babiker on 16/07/2025.
//

import SwiftUI

struct AppetizerItemView: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
            Image("steak")
                .resizable()
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            VStack (alignment: .leading) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("\(appetizer.price, specifier: "%.2f")")
                
                    
            }
            .padding()
        }
        
    }
}

#Preview {
    AppetizerItemView(appetizer: MockData.sampleAppetizer)
}
