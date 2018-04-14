//
//  ViewController.swift
//  window-shopper
//
//  Created by Ryan Hutchison on 4/9/18.
//  Copyright © 2018 Ryan Hutchison. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    // MARK: - Define variables belonging to MainVC
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage.init(named: "windowShopperBG")
        return imageView
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "windowShopperIcon")
        return imageView
    }()
    
    let hourlyWageTextField: CurrencyTextField = {
        let tf = CurrencyTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.attributedPlaceholder = NSMutableAttributedString(string: "Your hourly wage", attributes: [.foregroundColor: UIColor.white])
        tf.keyboardType = .decimalPad
        tf.textColor = UIColor.white
        return tf
    }()
    
    let itemPriceTextField: CurrencyTextField = {
        let tf = CurrencyTextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.attributedPlaceholder = NSMutableAttributedString(string: "Item price", attributes: [.foregroundColor: UIColor.white])
        tf.keyboardType = .decimalPad
        tf.textColor = UIColor.white
        return tf
    }()
    
    let calculateButton: UIButton = {
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 60)
        let btn = UIButton(frame: frame)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        btn.setTitle("Calculate", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        return btn
    }()
    
    let hoursRequiredValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(52)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let attributedString = NSAttributedString(string: "32", attributes: [.paragraphStyle: paragraphStyle, .font: font,
                                                                             .foregroundColor:UIColor.white])
        label.attributedText = attributedString
        return label
    }()
    
    let hoursRequiredUnitsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(17)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let attributedString = NSAttributedString(string: "hours", attributes: [.paragraphStyle: paragraphStyle, .font: font,
                                                                             .foregroundColor:UIColor.white])
        label.attributedText = attributedString
        return label
    }()
    
    let clearCalculatorButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(16)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let attributedString = NSAttributedString(string: "Clear Calculator", attributes: [.paragraphStyle: paragraphStyle,
                                                                                           .font: font,
                                                                                           .foregroundColor:UIColor.white])
        btn.setAttributedTitle(attributedString, for: .normal)
        btn.addTarget(self, action: #selector(handleClearCalculator), for: .touchUpInside)
        return btn
    }()

    
    // MARK: - Overide Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        hoursRequiredValueLabel.isHidden = true
        hoursRequiredUnitsLabel.isHidden = true
    }
    
    
    // MARK: - Custom view setup
    
    private func setupViews() {
        setupBackgroundImageView()
        setupLogoImageView()
        setupCurrencyTextFields()
        setupAccessoryKeyboard()
        setupHoursRequiredLabels()
        setupClearCalculatorButton()
    }
    
    private func setupBackgroundImageView() {
        view.addSubview(backgroundImageView)
        
        NSLayoutConstraint.activate([
            backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backgroundImageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            backgroundImageView.heightAnchor.constraint(equalTo: view.heightAnchor)
            ])
    }
    
    private func setupLogoImageView() {
        view.addSubview(logoImageView)
        
        let logoSize: CGFloat = 60
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 35),
            logoImageView.widthAnchor.constraint(equalToConstant: logoSize),
            logoImageView.heightAnchor.constraint(equalToConstant: logoSize)
            ])
    }
    
    private func setupCurrencyTextFields() {
        view.addSubview(hourlyWageTextField)
        view.addSubview(itemPriceTextField)
        
        NSLayoutConstraint.activate([
            hourlyWageTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hourlyWageTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 25),
            hourlyWageTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40),
            hourlyWageTextField.heightAnchor.constraint(equalToConstant: 40),
            
            itemPriceTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            itemPriceTextField.topAnchor.constraint(equalTo: hourlyWageTextField.bottomAnchor, constant: 25),
            itemPriceTextField.widthAnchor.constraint(equalTo: hourlyWageTextField.widthAnchor),
            itemPriceTextField.heightAnchor.constraint(equalTo: hourlyWageTextField.heightAnchor)
            ])
    }
    
    private func setupAccessoryKeyboard() {
        hourlyWageTextField.inputAccessoryView = calculateButton
        itemPriceTextField.inputAccessoryView = calculateButton
        
        NSLayoutConstraint.activate([
            calculateButton.heightAnchor.constraint(equalToConstant: 60)
            ])
    }
    
    private func setupHoursRequiredLabels() {
        view.addSubview(hoursRequiredValueLabel)
        view.addSubview(hoursRequiredUnitsLabel)
        
        NSLayoutConstraint.activate([
            hoursRequiredValueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hoursRequiredValueLabel.topAnchor.constraint(equalTo: itemPriceTextField.bottomAnchor, constant: 45),
            hoursRequiredValueLabel.widthAnchor.constraint(equalTo: itemPriceTextField.widthAnchor),
            hoursRequiredValueLabel.heightAnchor.constraint(equalToConstant: 40),
            
            hoursRequiredUnitsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hoursRequiredUnitsLabel.topAnchor.constraint(equalTo: hoursRequiredValueLabel.bottomAnchor, constant: 5),
            hoursRequiredUnitsLabel.widthAnchor.constraint(equalTo: itemPriceTextField.widthAnchor),
            hoursRequiredUnitsLabel.heightAnchor.constraint(equalToConstant: 28)
            ])
    }
    
    private func setupClearCalculatorButton() {
        view.addSubview(clearCalculatorButton)
        
        NSLayoutConstraint.activate([
            clearCalculatorButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            clearCalculatorButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            clearCalculatorButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40),
            clearCalculatorButton.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    // MARK: - Custom functions
    
    @objc private func calculate() {
        if let wageText = hourlyWageTextField.text, let priceText = itemPriceTextField.text {
            if let wage = Double(wageText), let price = Double(priceText) {
                view.endEditing(true)
                
                hoursRequiredValueLabel.isHidden = false
                hoursRequiredValueLabel.isHidden = false
                
                let result = Wage.getHours(forWage: wage, andPrice: price)
                var font = UIFont.preferredFont(forTextStyle: .body).withSize(52)
                font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.alignment = .center
                let attributedString = NSAttributedString(string: "\(result)", attributes: [.paragraphStyle: paragraphStyle, .font: font,
                                                                                     .foregroundColor:UIColor.white])
                hoursRequiredValueLabel.attributedText = attributedString
            }
        }
        hoursRequiredValueLabel.isHidden = false
        hoursRequiredUnitsLabel.isHidden = false
    }
    
    @objc private func handleClearCalculator() {
        hoursRequiredValueLabel.isHidden = true
        hoursRequiredUnitsLabel.isHidden = true
        hourlyWageTextField.text = ""
        itemPriceTextField.text = ""
    }

}

