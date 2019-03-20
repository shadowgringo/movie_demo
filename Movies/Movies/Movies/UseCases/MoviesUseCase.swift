//
//  MoviesUseCase.swift
//  Movies
//
//  Created by Mathieu Villeneuve on 2019-03-20.
//  Copyright © 2019 none. All rights reserved.
//

import RxSwift

class MoviesUseCase {
    
     // MARK: - Private Properties
    private let dataProvider = DataProvider()
    
    // MARK: - Functions
    func getMovies() -> Observable<[Movie]> {
        return dataProvider.send(apiRequest: MoviesRequest(), entityType: ResultEntity.self)
            .map { result in
                return result.results
            }.map { movies in
                return movies.reduce([Movie](), { array, movie in
                    var result = array
                    if let model = movie.getModel() {
                        result.append(model)
                    }
                    return result
                })
            }
        
        
    }
}
