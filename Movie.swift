//
//  Movie.swift
//  movies
//
//  Created by Jason Plumb on 2016. 1. 28..
//  Copyright © 2016년 JasonPlumb. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Movie: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    func setMovieImage(img: UIImage!) {
        let data = UIImagePNGRepresentation(img)
        self.movieImg = data
    }
    
    func getMovieImage() -> UIImage {
        let img = UIImage(data: self.movieImg!)!
        return img
    }
}
