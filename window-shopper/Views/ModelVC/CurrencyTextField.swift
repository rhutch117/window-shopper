//
//  CurrencyTextField.swift
//  window-shopper
//
//  Created by Ryan Hutchison on 4/11/18.
//  Copyright © 2018 Ryan Hutchison. All rights reserved.
//

import UIKit

class CurrencyTextField: UITextField {
    
    override func draw(_ rect: CGRect) {
        let size: CGFloat = 20
        let currencyLabel = UILabel(frame: CGRect(x: 5, y: (frame.size.height / 2 - size / 2), width: size, height: size))
        currencyLabel.backgroundColor = #colorLiteral(red: 0.8343945551, green: 0.8343945551, blue: 0.8343945551, alpha: 0.8)
        currencyLabel.textAlignment = .center
        currencyLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        currencyLabel.layer.cornerRadius = 5.0
        currencyLabel.clipsToBounds = true
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .current
        currencyLabel.text = formatter.currencySymbol
        addSubview(currencyLabel)
    }
    
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
        clipsToBounds = true
    }
}
