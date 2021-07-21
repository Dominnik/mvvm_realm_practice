//
//  InterfaceHelper.swift
//  RealmProject
//
//  Created by Интеллект Софт on 16.07.2021.
//

import UIKit

public class InterfaceHelper {
    
    public static func showAlertWithTextfield(title: String, message: String, placeholder: String, presentingVC: UIViewController, action: @escaping (String?) -> ()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = placeholder
            textField.autocapitalizationType = .sentences
        }
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            action(textField?.text)
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        presentingVC.present(alert, animated: true, completion: nil)
    }
}
