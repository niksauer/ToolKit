//
//  TextViewController.swift
//  ToolKit
//
//  Created by Niklas Sauer on 14.06.18.
//  Copyright © 2018 SauerStudios. All rights reserved.
//

import Foundation
import UIKit

open class TextViewController: UIViewController {
    
    // MARK: - Views
    public let textView = UITextView()
    
    // MARK: - Initialization
    public init(text: String) {
        super.init(nibName: nil, bundle: nil)
        
        textView.text = text
        
        view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.pin(to: view)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
