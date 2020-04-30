//
//  ActivityUtil.swift
//  Teste Jeronimo
//
//  Created by Jeronimo Junior on 30/04/20.
//  Copyright © 2020 Jeronimo Junior. All rights reserved.
//

import Foundation
import UIKit

class ActivyUtil {
    
    static let shared: ActivyUtil = {
        return ActivyUtil()
    }()
    
    private lazy var activity: UIActivityIndicatorView = {
        return UIActivityIndicatorView(style: .medium)
    }()
    
    func showAdded(to: UIView) {
        activity.hidesWhenStopped  = true
        to.addSubview(activity)
        
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.centerXAnchor.constraint(equalTo: to.centerXAnchor).isActive = true
        activity.centerYAnchor.constraint(equalTo: to.centerYAnchor).isActive = true
        activity.startAnimating()
    }
    
    func hide(for: UIView) {
        activity.stopAnimating()
    }
    
}
