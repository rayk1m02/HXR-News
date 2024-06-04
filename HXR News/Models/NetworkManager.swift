//
//  NetworkManager.swift
//  HXR News
//
//  Created by Raymond Kim on 6/2/24.
//

import Foundation

class NetworkManager: ObservableObject { // ObservableObject - able to broadcast to other objects
    
    @Published var posts = [Post]() // @Published - hear from it whenever the content changes
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }                            
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
