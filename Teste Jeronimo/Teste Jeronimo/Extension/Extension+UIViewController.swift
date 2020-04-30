//
//  Extension+UIViewController.swift
//  Teste Jeronimo
//
//  Created by Jeronimo Junior on 30/04/20.
//  Copyright © 2020 Jeronimo Junior. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    
    func alertMessage(title: String, msg: String, btn: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: btn, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showLoading() {
        DispatchQueue.main.async {
            ActivyUtil.shared.showAdded(to: self.view)
        }
    }

    func hideLoading() {
        DispatchQueue.main.async {
            ActivyUtil.shared.hide(for: self.view)
        }
    }

}


