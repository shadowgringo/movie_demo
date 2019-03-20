//
//  MoviesViewModel.swift
//  Movies
//
//  Created by Mathieu Villeneuve on 2019-03-19.
//  Copyright © 2019 none. All rights reserved.
//

import RxSwift

class MoviesViewModel {
    
    // MARK: - Private Properties
    private let moviesUseCase = MoviesUseCase()
    
    struct Output {
        let movies: Observable<[Movie]>
    }
    
    // MARK: - Functions
    func prepare() -> Output {
        return Output(movies: moviesUseCase.getMovies())
    }
}
