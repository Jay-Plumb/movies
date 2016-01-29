
//
//  MovieCell.swift
//  movies
//
//  Created by Jason Plumb on 2016. 1. 28..
//  Copyright © 2016년 JasonPlumb. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieTitleCell: UILabel!
    @IBOutlet weak var movieDescriptionCell: UILabel!
    @IBOutlet weak  var movieUrlCell: UILabel!
    @IBOutlet weak var movieImageCell: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        movieImageCell.layer.cornerRadius = 4.0
        movieImageCell.clipsToBounds = true
    }

    func configureCell(movie: Movie) {
        movieTitleCell.text = movie.movieTitle
        movieDescriptionCell.text = movie.movieDescription
        //movieUrlCell.text = movie.movieUrl
        movieImageCell.image = movie.getMovieImage()
    }

}
