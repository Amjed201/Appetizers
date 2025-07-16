//
//  appetizerListView.swift
//  Appetizers
//
//  Created by Amjed Mohamed Babiker on 16/07/2025.
//


import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.appetizers) { appetizer in
                AppetizerItemView(appetizer: appetizer)
                
            }
            .padding()
            .navigationTitle("🍟 Appetizers")
        }
        .onAppear {
            viewModel.getAppetizers()
        }
    }
    
  
}


#Preview {
    AppetizerTabView()
}
