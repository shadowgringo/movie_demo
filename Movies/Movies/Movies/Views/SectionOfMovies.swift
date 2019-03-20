//
//  SectionOfMovies.swift
//  Movies
//
//  Created by Mathieu Villeneuve on 2019-03-20.
//  Copyright © 2019 none. All rights reserved.
//

import RxDataSources

struct SectionOfMovies {
    var items: [Item]
}

extension SectionOfMovies: SectionModelType {
    typealias Item = Movie
    
    // MARK: - Init
    init(original: SectionOfMovies, items: [Item]) {
        self = original
        self.items = items
    }
}
