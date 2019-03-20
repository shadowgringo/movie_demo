//
//  Movie.swift
//  Movies
//
//  Created by Mathieu Villeneuve on 2019-03-20.
//  Copyright © 2019 none. All rights reserved.
//

import Foundation

class Movie {
    
    // MARK: - Properties
    let title: String
    let posterPath: String
    let releaseDate: Date

    init(title: String, posterPath: String, releaseDate: Date) {
        self.title = title
        self.posterPath = posterPath
        self.releaseDate = releaseDate
    }
    
    
}
