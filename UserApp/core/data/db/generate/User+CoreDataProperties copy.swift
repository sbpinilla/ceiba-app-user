//
//  User+CoreDataProperties.swift
//  
//
//  Created by Sergio pinilla on 13/11/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var phone: String?

}
