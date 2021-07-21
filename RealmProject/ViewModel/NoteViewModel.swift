//
//  NoteViewModel.swift
//  RealmProject
//
//  Created by Интеллект Софт on 09.07.2021.
//

import Foundation

public class NoteViewModel: NoteModelType {

    private var note: Note
    
    public init(note: Note) {
        self.note = note
    }
    
    public var id: String {
        return note.id
    }

    public var noteText: String {
        return note.text
    }

    public var isDone: Bool {
        get {
            return note.isDone
        }
        set {}
    }
}
