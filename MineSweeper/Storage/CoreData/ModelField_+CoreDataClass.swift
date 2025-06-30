//
//  ModelField_+CoreDataClass.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 30.06.2025.
//
//

import Foundation
import CoreData

@objc(ModelField_)
public class ModelField_: NSManagedObject {

}
extension ModelField_ {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ModelField_> {
        return NSFetchRequest<ModelField_>(entityName: "ModelField_")
    }

    @NSManaged public var name_: String
    @NSManaged public var row_: Int16
    @NSManaged public var column_: Int16
    @NSManaged public var bombs_: NSSet

}

// MARK: Generated accessors for bombs_
extension ModelField_ {

    @objc(addBombs_Object:)
    @NSManaged public func addToBombs_(_ value: CoordField_)

    @objc(removeBombs_Object:)
    @NSManaged public func removeFromBombs_(_ value: CoordField_)

    @objc(addBombs_:)
    @NSManaged public func addToBombs_(_ values: NSSet)

    @objc(removeBombs_:)
    @NSManaged public func removeFromBombs_(_ values: NSSet)

}

extension ModelField_ : Identifiable {

}
