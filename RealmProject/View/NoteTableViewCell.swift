//
//  NoteTableViewCell.swift
//  RealmProject
//
//  Created by Интеллект Софт on 15.07.2021.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    @IBOutlet weak var backView: ShadowView!
    
    @IBOutlet weak var noteTextLabel: UILabel!
    @IBOutlet weak var isDoneSwitch: UISwitch!
    
    weak var switchActionDelegate: SwitchActionDelegate?
    
    var viewModel: NoteModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            noteTextLabel.text = viewModel.noteText
            isDoneSwitch.isOn = viewModel.isDone
        }
    }

    @IBAction func toggleSwitchAction(_ sender: UISwitch) {
        guard let viewModel = viewModel else { return }
        self.switchActionDelegate?.switchValueChanged(for: viewModel.id)
    }
}
