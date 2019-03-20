//
//  Movie.swift
//  Movies
//
//  Created by Mathieu Villeneuve on 2019-03-19.
//  Copyright © 2019 none. All rights reserved.
//

import Foundation

struct MovieEntity {
    
    // MARK: - Public Properties
    let title: String?
    let posterPath: String?
    let releaseDate: String?
    
    // MARK: - Private Properties
    private enum CodingKeys: String, CodingKey {
        case title
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
    
    // MARK: - Functions
    func getModel() -> Movie? {
        
        guard let title = title, let posterPath = posterPath,
            let releaseDate = releaseDate else { return nil }
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
        
            if let date = dateFormatter.date(from:releaseDate) {
                return Movie(title: title, posterPath: posterPath, releaseDate: date)
            }
            
        return nil
        
    }
}

extension MovieEntity: Codable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        posterPath = try values.decode(String.self, forKey: .posterPath)
        releaseDate = try values.decode(String.self, forKey: .releaseDate)     
    }
}
