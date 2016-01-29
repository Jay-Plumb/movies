
//
//  DetailsVC.swift
//  movies
//
//  Created by Jason Plumb on 2016. 1. 29..
//  Copyright © 2016년 JasonPlumb. All rights reserved.
//

import UIKit
import CoreData

class MovieDetailsVC: UIViewController {
    var movie:Movie?
    @IBOutlet weak var detailsTitle: UILabel!
    @IBOutlet weak var detailsDescription: UILabel!
    @IBOutlet weak var detailsImage: UIImageView!
    @IBOutlet weak var ibmdLinkButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated: Bool) {
       self.detailsTitle.text  = movie?.movieTitle
       self.detailsDescription.text = movie?.movieDescription
        self.detailsImage.image = movie?.getMovieImage()
    }
    
    @IBAction func urlButtonPressed(sender: AnyObject!) {
        print(movie?.movieUrl)
        let url = NSURL(string: (movie?.movieUrl)!)!
       UIApplication.sharedApplication().openURL(url)
        
    }
    

}
