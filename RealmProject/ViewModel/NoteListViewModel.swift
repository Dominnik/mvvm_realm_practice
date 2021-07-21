//
//  NoteListViewModel.swift
//  RealmProject
//
//  Created by Интеллект Софт on 09.07.2021.
//

import Foundation
import RealmSwift

public class NoteListViewModel: TableViewModelType {
    
    var notes: Results<Note>!
    
    init() {
        self.notes = realm.objects(Note.self)
                           .sorted(byKeyPath: "dateCreate", ascending: false)
    }

    func numberOfRows() -> Int {
        return notes.count
    }

    func cellViewModel(for indexPath: IndexPath) -> NoteModelType? {
        
        let note = notes[indexPath.row]
        return NoteViewModel(note: note)
    }

    func addNote(note: Note) {
        StorageManager.saveObject(note)
    }
}
