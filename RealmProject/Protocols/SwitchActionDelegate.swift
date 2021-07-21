//
//  SwitchActionDelegate.swift
//  RealmProject
//
//  Created by Интеллект Софт on 15.07.2021.
//

import Foundation

protocol SwitchActionDelegate: AnyObject {
    
    func switchValueChanged(for objectId: String?)
}
