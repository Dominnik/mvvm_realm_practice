//
//  Note.swift
//  RealmProject
//
//  Created by Интеллект Софт on 09.07.2021.
//

import Foundation
import RealmSwift

public class Note: Object {

    @objc dynamic var id = ""
    @objc dynamic var text = ""
    @objc dynamic var isDone = false
    @objc dynamic var dateCreate = Date()
    
    override public class func primaryKey() -> String? {
        return "id"
    }

    required init(text: String, isDone: Bool) {
        super.init()
        self.id = UUID().uuidString
        self.text = text
        self.isDone = isDone
    }
    
    required override init() {
        id = UUID().uuidString
        super.init()
    }
}
