//
//  Extension+NavigationController.swift
//  Teste Jeronimo
//
//  Created by Jeronimo Junior on 30/04/20.
//  Copyright © 2020 Jeronimo Junior. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {

   open override var preferredStatusBarStyle: UIStatusBarStyle {
      return topViewController?.preferredStatusBarStyle ?? .default
   }
}
