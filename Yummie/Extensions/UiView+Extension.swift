//
//  UiView+Extension.swift
//  Yummie
//
//  Created by Hashim Saffarini on 03/10/2025.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        } set {
            self.layer.cornerRadius = newValue
           
        }
    }
}
