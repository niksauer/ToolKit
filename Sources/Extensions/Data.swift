//
//  Data.swift
//  ToolKit
//
//  Created by Niklas Sauer on 13.06.18.
//  Copyright © 2018 SauerStudios. All rights reserved.
//

import Foundation

extension Data {
    func hexEncodedString() -> String {
        return map({ String(format: "%02hhx", $0) }).joined()
    }
}
