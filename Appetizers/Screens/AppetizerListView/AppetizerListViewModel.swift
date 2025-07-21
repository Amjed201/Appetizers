//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Amjed Mohamed Babiker on 16/07/2025.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
        
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShwoingDetails = false
    @Published var selectedAppetizer: Appetizer?
    
    
    func getAppetizers() {
        isLoading = true
            NetworkManager.shared.getAppetizers { result in
                
                DispatchQueue.main.async {
                    self.isLoading = false
                    switch result {
                    case .success(let appetizers) :
                        self.appetizers = appetizers
                    case .failure(let error):
                        switch error {
                        case .invalidData:
                            self.alertItem = AlertContext.invalidData
                            
                        case .invalidURL:
                            self.alertItem = AlertContext.invalidURL
                            
                        case .invalidResponse:
                            self.alertItem = AlertContext.invalidResponse
                            
                        case .unableToComplete:
                            self.alertItem = AlertContext.unableToComplete
                            
                        }
                        
                    }
                }
            }
        
    }
}
