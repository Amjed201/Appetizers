//
//  SwiftUIView.swift
//  Appetizers
//
//  Created by Amjed Mohamed Babiker on 21/07/2025.
//

import SwiftUI

struct AppetizerDetailsView: View {
    var appetizer: Appetizer
    @Binding var isShowingDetails: Bool
    
    var body: some View {
        VStack {
            AppetizerItemImage(urlString: appetizer.image)
                .aspectRatio(contentMode: .fit)
                .frame(width: 320 , height: 200)
            
            Text(appetizer.title)
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(appetizer.description)
                .multilineTextAlignment(.center)
                .font(.body)
                .fontWeight(.light)
                
            
            
            HStack (spacing: 30) {
                NutritionCellView(title: "Calories", value: "650")
                NutritionCellView(title: "Carbs", value: "11g")
                NutritionCellView(title: "Protein", value: "22g")
            }
            .padding(.top)
            
            
            Button {
                isShowingDetails = false
            } label: {
                
                PriceButton()
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.regular)
            .tint(.primaryBrand)
            .frame(width: 260, height: 50)
            .padding(.top)

            
        }
        .padding()
        .frame(width: 330, height: 520)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) {
            
                Button {
                    isShowingDetails = false
                } label: {
                    DismissButton()
                }
                .padding()
                

            
        }
        
    }
}

#Preview {
    AppetizerDetailsView(appetizer: MockData.sampleAppetizer,
                         isShowingDetails: .constant(true))
}


struct NutritionCellView: View {
    var title: String
    var value: String
    var body: some View {
        
        VStack(spacing: 5) {
            Text(title)
                .font(.title2)
                .fontWeight(.medium)
            
            Text(value)
                .font(.title3)
                .fontWeight(.light)
            
        }
    }
}

struct PriceButton: View {
    var body: some View {
        Text("20$ - Add To Order")
            .foregroundStyle(.white)
            .font(.title2)
            .padding(.all, 5)
    }
}

struct DismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundStyle(.white.opacity(0.6))
            Image(systemName: "xmark")
                .frame(width: 44, height: 44)
                .foregroundStyle(.black)
        }
    }
}
