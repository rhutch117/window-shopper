//
//  CurrencyTextField.swift
//  window-shopper
//
//  Created by Ryan Hutchison on 4/11/18.
//  Copyright © 2018 Ryan Hutchison. All rights reserved.
//

import UIKit

class CurrencyTextField: UITextField {
    
    // MARK: - init functions
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initTextField()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom text field properties
    
    func initTextField() {
        backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.25)
        layer.cornerRadius = 5.0
        textAlignment = .center
    }
}
