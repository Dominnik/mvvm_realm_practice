//
//  ViewController.swift
//  RealmProject
//
//  Created by Интеллект Софт on 09.07.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var notesTableView: UITableView!

    var noteListViewModel: TableViewModelType?

    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }

    private func commonInit() {
        notesTableView.register(UINib(nibName: CellIdentifiers.NOTE_TABLEVIEW_CELL.rawValue, bundle: nil), forCellReuseIdentifier: CellIdentifiers.NOTE_TABLEVIEW_CELL.rawValue)
        noteListViewModel = NoteListViewModel()
    }

    @IBAction func addNoteAction(_ sender: UIBarButtonItem) {

        InterfaceHelper.showAlertWithTextfield(title: "Add Note", message: "Enter a text", placeholder: "note text...", presentingVC: self) { noteText in
            let note = Note(text: noteText ?? "", isDone: false)
            self.noteListViewModel?.addNote(note: note)
            self.notesTableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteListViewModel?.numberOfRows() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.NOTE_TABLEVIEW_CELL.rawValue, for: indexPath) as? NoteTableViewCell

        guard let tableViewCell = cell, let noteListViewModel = noteListViewModel else { return UITableViewCell() }

        let cellViewModel = noteListViewModel.cellViewModel(for: indexPath)

        tableViewCell.switchActionDelegate = self
        tableViewCell.viewModel = cellViewModel

        return tableViewCell
    }
}

extension ViewController: SwitchActionDelegate {
    func switchValueChanged(for objectId: String?) {
        
        guard let id = objectId else { return }
        let currentNote: Note? = StorageManager.getObjectById(id).first
        guard let note = currentNote else { return }

        StorageManager.updateObject {
            note.isDone.toggle()

        }
    }
}
