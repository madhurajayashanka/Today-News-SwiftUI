//
//  PostData.swift
//  HackerNews
//
//  Created by Madhura on 2023-01-06.
//

import Foundation
struct Results: Decodable{
    let hits: [Post]
}

struct Post: Decodable, Identifiable{
    var id: String{
        return objectID
    }
    let objectID: String
    let title: String
    let points: Int
    let url: String?
}
