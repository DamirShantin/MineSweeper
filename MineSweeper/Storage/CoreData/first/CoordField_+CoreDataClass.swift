//
//  CoordField_+CoreDataClass.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 30.06.2025.
//
//

import Foundation
import CoreData

@objc(CoordField_)
public class CoordField_: NSManagedObject {

}
extension CoordField_ {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoordField_> {
        return NSFetchRequest<CoordField_>(entityName: "CoordField_")
    }

    @NSManaged public var x_: Int16
    @NSManaged public var y_: Int16
    @NSManaged public var field_: ModelField_?

}

extension CoordField_ : Identifiable {
    func convert() -> CoordField {
        return CoordField(x: Int(self.x_), y: Int(self.y_))
    }
}
