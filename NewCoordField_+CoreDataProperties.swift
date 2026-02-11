//
//  NewCoordField_+CoreDataProperties.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 15.12.2025.
//
//

import Foundation
import CoreData


extension NewCoordField_ {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NewCoordField_> {
        return NSFetchRequest<NewCoordField_>(entityName: "NewCoordField_")
    }

    @NSManaged public var x_: Int16
    @NSManaged public var y_: Int16
    @NSManaged public var field_: NewModelField_?

}

extension NewCoordField_ : Identifiable {

}
