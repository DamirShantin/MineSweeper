//
//  NewModelField_+CoreDataProperties.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 15.12.2025.
//
//

import Foundation
import CoreData


extension NewModelField_ {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewModelField_> {
        return NSFetchRequest<NewModelField_>(entityName: "NewModelField_")
    }

    @NSManaged public var row_: Int16
    @NSManaged public var name_: String?
    @NSManaged public var column_: Int16
    @NSManaged public var id: String?
    @NSManaged public var bombs_: NSSet?

}

// MARK: Generated accessors for bombs_
extension NewModelField_ {

    @objc(addBombs_Object:)
    @NSManaged public func addToBombs_(_ value: NewCoordField_)

    @objc(removeBombs_Object:)
    @NSManaged public func removeFromBombs_(_ value: NewCoordField_)

    @objc(addBombs_:)
    @NSManaged public func addToBombs_(_ values: NSSet)

    @objc(removeBombs_:)
    @NSManaged public func removeFromBombs_(_ values: NSSet)

}

extension NewModelField_ : Identifiable {

}
