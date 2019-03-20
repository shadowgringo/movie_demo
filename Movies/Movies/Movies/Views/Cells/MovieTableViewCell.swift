//
//  MovieTableViewCell.swift
//  Movies
//
//  Created by Mathieu Villeneuve on 2019-03-19.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var posterImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    // MARK: - properties
    static let cellReuseIdentifier = "MovieCell"
    
    func configure(movie: Movie) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        
        titleLbl.text = movie.title
        dateLbl.text = dateFormatter.string(from: movie.releaseDate)
        posterImg.image = UIImage()
        posterImg.downloaded(from: "https://image.tmdb.org/t/p/w1280/\(movie.posterPath)")
        
    }

}
