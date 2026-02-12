//
//  CoreDataStorage.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 29.06.2025.
//

import Foundation
import CoreData

final class CoreDataStorage: StorageModel{
    static var shared: CoreDataStorage = CoreDataStorage()
    
    private init() {
        checkNillId()
        loadData()
    }
    
    var selectedField: Field?
    var fields: [Field] = []
    
    //MARK: Container
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "db")
        container.loadPersistentStores { storeDescriptional, error in
            if let error = error as NSError? {
                fatalError("\(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do{
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("\(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    func saveData(name: String, row: Int, col: Int, bombs: [CoordField]) {
        let model = ModelField_(context: persistentContainer.viewContext)
        model.name_ = name
        model.row_ = Int16(row)
        model.column_ = Int16(col)
        model.id_ = UUID().uuidString
        
        for bomb in bombs {
            let coordField = CoordField_(context: persistentContainer.viewContext)
            coordField.x_ = Int16(bomb.x)
            coordField.y_ = Int16(bomb.y)
            coordField.field_ = model
        }
        loadData()
        saveContext()
    }
    
    func loadData() {
        let req = ModelField_.fetchRequest()
        guard let fields = try? persistentContainer.viewContext.fetch(req), !fields.isEmpty else { return }
        self.fields = fields.map{convert($0)}
    }
    
    func deleteData(id: String) {
        
        let req = ModelField_.fetchRequest()
        req.predicate = NSPredicate(format: "id_ == %@", id)
        
        if let field = try? persistentContainer.viewContext.fetch(req), !field.isEmpty, let newField = field.first {
                persistentContainer.viewContext.delete(newField)
            
        }
        saveContext()
        loadData()
        
        
    }
    
    private func checkNillId() {
        let req = ModelField_.fetchRequest()
        guard let fields = try? persistentContainer.viewContext.fetch(req), !fields.isEmpty else { return }
        
        let _ = fields.map {
            if $0.id_ == nil {
                let id = UUID().uuidString
                $0.id_ = id
            }
        }
        saveContext()
    }
    
    private func convert(_ field: ModelField_) -> Field {
        let id = field.id_!
        let name = field.name_
        let row = Int(field.row_)
        let column = Int(field.column_)
        var bombs = [CoordField]()
        
        let req = CoordField_.fetchRequest()
        if let bombs_ = try? persistentContainer.viewContext.fetch(req) {
            let _ = bombs_.map {
                if $0.field_ == field {
                    let bomb = $0.convert()
                    bombs.append(bomb)
                }
            }
        }
        return Field(name: name, rows: row, columns: column, bombs: bombs, id: id)
    }
}
