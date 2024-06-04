//
//  PostData.swift
//  HXR News
//
//  Created by Raymond Kim on 6/2/24.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable { // Identifiable needs "id" property
    var id: String { return objectID }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
