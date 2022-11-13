//
//  Post+CoreDataProperties.swift
//  
//
//  Created by Sergio pinilla on 13/11/22.
//
//

import Foundation
import CoreData


extension Post {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Post> {
        return NSFetchRequest<Post>(entityName: "Post")
    }

    @NSManaged public var body: String?
    @NSManaged public var id: Int32
    @NSManaged public var title: String?
    @NSManaged public var userId: Int32

}
