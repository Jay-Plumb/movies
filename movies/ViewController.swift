//
//  ViewController.swift
//  movies
//
//  Created by Jason Plumb on 2016. 1. 27..
//  Copyright © 2016년 JasonPlumb. All rights reserved.
//  Images: https://thenounproject.com/search/?q=movie%20image&i=211314

import UIKit
import CoreData
class ViewController: UIViewController,
                      UITableViewDataSource,
                      UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var movies = [Movie]() // A list of movies using our movie class

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        tableView.reloadData()
    }
    
    func fetchAndSetResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate // Grab the app delegate
        let context = app.managedObjectContext // Scratch pad
        let fetchRequest = NSFetchRequest(entityName: "Movie") // Grab all entities with Movie
        
        do {
            let results = try context.executeFetchRequest(fetchRequest) // Talk to the database and grab data
            self.movies = results as! [Movie]
           
        }catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieCell {
            let movie = movies[indexPath.row]
            cell.configureCell(movie)
            return cell
        } else {
            return MovieCell()
        }
        //return UITableViewCell()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
   
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("showDetail", sender: self.movies ) // Send the specific data from table entry
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            let indexPath:NSIndexPath = self.tableView.indexPathForSelectedRow!
            let detailsVC: MovieDetailsVC = segue.destinationViewController as! MovieDetailsVC
            detailsVC.movie = movies[indexPath.row] as Movie
        }
    }
    
   

}

