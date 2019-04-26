//
//  TrailerObject.swift
//  TrailerApp500781101
//
//  Created by Jamal Aartsen on 4/22/19.
//  Copyright © 2019 HvA. All rights reserved.
//

import Foundation

struct TrailerObject: Codable {
    let id: Int
    let title: String
    let url: String
    let posterImage: String
    let stillImage: String
    let description: String
    
    enum  CodingKeys: String, CodingKey {
        case id
        case title
        case url
        case posterImage
        case stillImage
        case description
    }
}
