//
//  Data.swift
//  ToolKit
//
//  Created by Niklas Sauer on 13.06.18.
//  Copyright © 2018 SauerStudios. All rights reserved.
//

import Foundation

public extension Data {
    public func hexEncodedString() -> String {
        return map({ String(format: "%02hhx", $0) }).joined()
    }
}
