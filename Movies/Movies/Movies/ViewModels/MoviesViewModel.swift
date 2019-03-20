//
//  MoviesViewModel.swift
//  Movies
//
//  Created by Mathieu Villeneuve on 2019-03-19.
//  Copyright © 2019 none. All rights reserved.
//

import RxSwift
import RxCocoa

class MoviesViewModel {
    
    // MARK: - Private Properties
    private let moviesUseCase = MoviesUseCase()
    private let disposeBag = DisposeBag()
    
    struct Output {
        let movies: Observable<[Movie]>
        let errorMessage: Observable<String>
    }
    
    // MARK: - Functions
    func prepare() -> Output {
        let moviesBR = PublishRelay<[Movie]>()
        let errorMessage = PublishRelay<String>()
    
        moviesUseCase.getMovies()
            .subscribe(onNext: { movies in
                moviesBR.accept(movies)
            }, onError: { error in
                errorMessage.accept("Error loading data")
            }).disposed(by: disposeBag)
        
        return Output(movies: moviesBR.asObservable(), errorMessage: errorMessage.asObservable())
    }
}
