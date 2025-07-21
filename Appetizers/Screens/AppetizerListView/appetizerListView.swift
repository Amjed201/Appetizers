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
        ZStack {
            
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    AppetizerItemView(appetizer: appetizer)
                        .onTapGesture {
                            viewModel.isShwoingDetails = true
                            viewModel.selectedAppetizer = appetizer
                        }
                }
                .padding()
                .navigationTitle("🍟 Appetizers")
                .disabled( viewModel.isShwoingDetails)
            }
            .blur(radius:  viewModel.isShwoingDetails ? 20 : 0)
            
            if  viewModel.isShwoingDetails {
                AppetizerDetailsView(appetizer: viewModel.selectedAppetizer!,
                                     isShowingDetails: $viewModel.isShwoingDetails)
            }
            
            if viewModel.isLoading {
                ProgressView()
            }
        }
        .onAppear {
            viewModel.getAppetizers()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
    
  
}


#Preview {
    AppetizerTabView()
}
