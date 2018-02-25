//
//  ViewController.swift
//  PatternCalc
//
//  Created by Ildar Zalyalov on 23.02.2018.
//  Copyright © 2018 iOSMobileLab. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, CalculatorView {
    
    @IBOutlet weak var digitsLabel: UILabel!
    let errorMessage = "Ошибка"
    let okeyMessage = "Окей"
    
    var presenter: CalculatorPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Buttons presses
    
    @IBAction func onNumbersButtonPressed(_ sender: UIButton) {
        guard let numberTitle = sender.title(for: .normal), let digitsText = digitsLabel.text else { return }
        presenter.onNumbersButtonPressed(with: numberTitle, and: digitsText)
    }
    
    @IBAction func onCommaButtonPressed(_ sender: UIButton) {
        guard let digitsText = digitsLabel.text else { return }
        presenter.onCommaButtonPressed(with: digitsText)
    }
    
    @IBAction func onClearButtonPressed(_ sender: Any) {
        presenter.onClearButtonPressed()
    }
    
    @IBAction func onSingleOperationButtonPressed(_ sender: UIButton) {
        guard let operationTitle = sender.title(for: .normal), let digitsText = digitsLabel.text else { return }
        presenter.onSingleOperationButtonPressed(value: digitsText, operationTitle: operationTitle)
    }
    
    @IBAction func onMultiplayButtonPressed(_ sender: UIButton) {
        guard let operationTitle = sender.title(for: .normal), let digitsText = digitsLabel.text else { return }
        presenter.onMultiplayOperationButtonPressed(value: digitsText, operationTitle: operationTitle)
    }
    
    
    @IBAction func onEqualityButtonPressed(_ sender: UIButton) {
        guard let digitsText = digitsLabel.text else { return }
        presenter.onEqullyButtonPressed(value: digitsText)
    }
    
    // MARK: - Calculator View Protocol
    
    func setTextToDigitsLabel(text: String) {
        digitsLabel.text = text
    }
    
    func showErrorAlert(with message: String) {
        let alert = UIAlertController(title: errorMessage, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: okeyMessage, style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}

