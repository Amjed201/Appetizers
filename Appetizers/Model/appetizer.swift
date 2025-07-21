//
//  appetizer.swift
//  Appetizers
//
//  Created by Amjed Mohamed Babiker on 16/07/2025.
//

struct Appetizer: Identifiable, Decodable {
    let id: Int
    //    let name: String
    let title: String
    let description: String
    let image: String
    //    let price: Double
    //    let imageURL: String
    //    let calories: Int
    //    let protein: Int
    //    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    //    static let sampleAppetizer = Appetizer(id: 001, name: "Steak",
    //                                    description: "Delicious well done steak , yummyyy",
    //                                    price: 45,
    //                                    imageURL: "",
    //                                    calories: 200,
    //                                    protein: 45,
    //                                    carbs: 20)
    static let sampleAppetizer = Appetizer(id: 001, title: "Steak",
                                           description: "Delicious well done steak , yummyyy",
                                           image: "")
                                           
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
                                        
                                           }
