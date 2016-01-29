//
//  Movie+CoreDataProperties.swift
//  movies
//
//  Created by Jason Plumb on 2016. 1. 28..
//  Copyright © 2016년 JasonPlumb. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movie {

    @NSManaged var movieImg: NSData?
    @NSManaged var movieTitle: String?
    @NSManaged var movieDescription: String?
    @NSManaged var movieUrl: String?

}
