//
//  TableViewModelType.swift
//  RealmProject
//
//  Created by Интеллект Софт on 15.07.2021.
//

import Foundation

protocol TableViewModelType {

    func numberOfRows() -> Int
    func cellViewModel(for indexPath: IndexPath) -> NoteModelType?
    func addNote(note: Note)
}
