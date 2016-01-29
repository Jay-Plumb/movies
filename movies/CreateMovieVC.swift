//
//  createMovieVC.swift
//  movies
//
//  Created by Jason Plumb on 2016. 1. 29..
//  Copyright © 2016년 JasonPlumb. All rights reserved.
//

import UIKit
import CoreData
class CreateMovieVC: UIViewController,
                     UIImagePickerControllerDelegate,
                     UINavigationControllerDelegate {
    
    @IBOutlet weak var movieTitle: UITextField!
    @IBOutlet weak var movieDesc: UITextField!
    @IBOutlet weak var movieUrl: UITextField!
    @IBOutlet weak var movieImg: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        movieImg.layer.cornerRadius = 4.0
        movieImg.clipsToBounds = true
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        movieImg.image = image
    }
    
    @IBAction func addImage(sender: AnyObject!) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func createMovie(sender: AnyObject!) {
        if let title = movieTitle.text where title != "" {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: context)!
            let movie = Movie(entity: entity, insertIntoManagedObjectContext: context)
            // Grap movie fields from Movie class and set to values inserted by the user
            movie.movieTitle = title
            movie.movieDescription = movieDesc.text
            movie.movieUrl = movieUrl.text
            movie.setMovieImage(movieImg.image!)
            
            // Save
            context.insertObject(movie)
            do {
                try context.save() // Move to perminant storage
            } catch {
                print("Could not save recipe")
            }
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
}
