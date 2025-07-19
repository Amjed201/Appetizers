//
//  NetworkManage.swift
//  Appetizers
//
//  Created by Amjed Mohamed Babiker on 16/07/2025.
//

import Foundation
import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
//    static let BaseUrl = "https://mzhyi8cn6zyp.manus.space/api/"
//    private let appetizerUrl = BaseUrl + "appetizers"
    static let BaseUrl = "https://api.sampleapis.com/"
    private let appetizerUrl = BaseUrl + "coffee/hot/"
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        
        guard let url = URL(string: appetizerUrl) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse , response.statusCode == 200 else {
                print(response!)
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try
                decoder.decode([Appetizer].self, from: data)
                completed(.success(decodedResponse))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
        
    }
    
    func downloadImage(urlFromString urlString : String , completed: @escaping (UIImage?) -> Void) {
        
          let cacheKey = NSString(string: urlString)
            if let image = cache.object(forKey: cacheKey) {
                completed(image)
                return
            }
        
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
            return
            
        }
        
        task.resume()
        
    }

}
    
    
    
    



