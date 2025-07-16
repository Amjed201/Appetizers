//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Amjed Mohamed Babiker on 16/07/2025.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
        
    @Published var appetizers: [Appetizer] = []
    
    func getAppetizers() {
        DispatchQueue.main.async {
            NetworkManager.shared.getAppetizers { result in
                switch result {
                case .success(let appetizers) :
                    self.appetizers = appetizers
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
