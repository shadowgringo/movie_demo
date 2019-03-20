//
//  ResultEntity.swift
//  Movies
//
//  Created by Mathieu Villeneuve on 2019-03-19.
//  Copyright © 2019 none. All rights reserved.
//

import Foundation

struct ResultEntity {
    
    // MARK: - Properties
    let results: [MovieEntity]
   
    private enum CodingKeys: String, CodingKey {
        case results
    }
}

extension ResultEntity: Codable {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        results = try values.decode([MovieEntity].self, forKey: .results)
    }
}
