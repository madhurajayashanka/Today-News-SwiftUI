//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Madhura on 2023-01-06.
//

import Foundation

class NetworkManager: ObservableObject{
    
   @Published var posts = [Post]()
    
    func fetchData(){
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
            
            let task = URLSession.shared.dataTask(with: url){
                data, response, error in
                
                if error == nil{
                    let decoder = JSONDecoder()
                    
                    if let data = data{
                        do{
                            let tasks = try decoder.decode(Results.self, from: data)
                            DispatchQueue.main.async {
                                self.posts = tasks.hits
                            }
                        }catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
            
    }
}
