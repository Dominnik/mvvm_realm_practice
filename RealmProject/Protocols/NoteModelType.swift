//
//  NoteModelType.swift
//  RealmProject
//
//  Created by Интеллект Софт on 15.07.2021.
//

import Foundation

protocol NoteModelType: AnyObject {

    var id: String { get }
    var noteText: String { get }
    var isDone: Bool { get set }
}
