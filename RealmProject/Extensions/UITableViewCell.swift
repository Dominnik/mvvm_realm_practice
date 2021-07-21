//
//  UITableViewCell.swift
//  RealmProject
//
//  Created by Интеллект Софт on 15.07.2021.
//

import UIKit

extension UITableViewCell {

    var indexPath: IndexPath? {
        guard let superView = self.superview as? UITableView else {
            print("superview is not a UITableView - getIndexPath")
            return nil
        }
        return superView.indexPath(for: self)
    }
}
