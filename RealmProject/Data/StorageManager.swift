//
//  StorageManager.swift
//  RealmProject
//
//  Created by Интеллект Софт on 15.07.2021.
//

import RealmSwift

let realm = try! Realm()

struct StorageManager {

    static func saveObject<T: Object>(_ object: T) {
        try! realm.write {
            realm.add(object, update: .modified)
        }
    }

    static func getObjectById<T: Object>(_ id: String) -> Results<T> {
        
        let predicate = NSPredicate(format: "id = %@", id)
        return realm.objects(T.self).filter(predicate)
    }
    
    static func updateObject(_ action: @escaping () -> () ) {
        try! realm.write{
            action()
        }
    }
}
