//
//  MoviesViewController.swift
//  Movies
//
//  Created by Mathieu Villeneuve on 2019-03-19.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class MoviesViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var moviesTableView: UITableView!
    
    // MARK: - Private Properties
    
    private let disposeBag = DisposeBag()
    private let moviesViewModel = MoviesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareViewModel()
    }
    
    // MARK: - Functions
    private func prepareViewModel() {
        let output = moviesViewModel.prepare()
        
        setupTable(movies: output.movies)
    }
}

extension MoviesViewController {
    
    private func setupTable(movies: Observable<[Movie]>) {
        let dataSource = RxTableViewSectionedReloadDataSource<SectionOfMovies>(configureCell: { [weak self](_,_,_, movie) -> UITableViewCell in
            let cell = self?.moviesTableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.cellReuseIdentifier)
            
            if let cell = cell as? MovieTableViewCell {
                cell.configure(movie: movie)
            }
            
            return cell ?? UITableViewCell()
        })
        
        movies
            .map { movies -> [SectionOfMovies] in
                return [SectionOfMovies(items: movies)]
            }.bind(to: moviesTableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
}
