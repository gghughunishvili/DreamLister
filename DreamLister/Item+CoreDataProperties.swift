//
//  Item+CoreDataProperties.swift
//  DreamLister
//
//  Created by Giorgi Ghughunishvili on 1/24/17.
//  Copyright © 2017 Giorgi Ghughunishvili. All rights reserved.
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item");
    }

    @NSManaged public var created_at: NSDate?
    @NSManaged public var details: String?
    @NSManaged public var title: String?
    @NSManaged public var price: Double
    @NSManaged public var toImage: NSSet?
    @NSManaged public var toItemType: ItemType?
    @NSManaged public var toStore: Store?

}

// MARK: Generated accessors for toImage
extension Item {

    @objc(addToImageObject:)
    @NSManaged public func addToToImage(_ value: Image)

    @objc(removeToImageObject:)
    @NSManaged public func removeFromToImage(_ value: Image)

    @objc(addToImage:)
    @NSManaged public func addToToImage(_ values: NSSet)

    @objc(removeToImage:)
    @NSManaged public func removeFromToImage(_ values: NSSet)

}
