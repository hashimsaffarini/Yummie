//
//  String+Extension.swift
//  Yummie
//
//  Created by Hashim Saffarini on 04/10/2025.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
