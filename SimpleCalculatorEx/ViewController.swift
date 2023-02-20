//
//  ViewController.swift
//  SimpleCalculatorEx
//
//  Created by hakulee on 2023/02/17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var signLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clearButtonClicked(_ sender: Any) {
        print(#function)
        firstTextField.text = ""
        secondTextField.text = ""
        resultLabel.text = ""
        signLabel.text = ""
    }
    
    func getResult(result: Double) {
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            resultLabel.text = "= \(Int(result))"
        } else {
            resultLabel.text = "= \(result)"
        }
    }
    
    //input, output 자릿수 제한 걸기 미해결
    @IBAction func plusButtonClicked(_ sender: Any) {
        print(#function)
        signLabel.text = "+"
        
        if let firstNumber = Double(firstTextField.text!), let secondNumber = Double(secondTextField.text!) {
            let result = firstNumber + secondNumber
            
            getResult(result: result)
        } else {
            resultLabel.text = "입력값이 잘못되었습니다."
        }
    }
    
    @IBAction func minusButtonClicked(_ sender: Any) {
        print(#function)
        signLabel.text = "-"
        
        if let firstNumber = Double(firstTextField.text!), let secondNumber = Double(secondTextField.text!) {
            let result = firstNumber - secondNumber
            
            getResult(result: result)
        } else {
            resultLabel.text = "입력값이 잘못되었습니다."
        }
    }
    
    @IBAction func multiplyButtonClicked(_ sender: Any) {
        print(#function)
        signLabel.text = "x"
        
        if let firstNumber = Double(firstTextField.text!), let secondNumber = Double(secondTextField.text!) {
            let result = firstNumber * secondNumber
            
            getResult(result: result)
        } else {
            resultLabel.text = "입력값이 잘못되었습니다."
        }
    }
    
    @IBAction func divideButtonClicked(_ sender: Any) {
        signLabel.text = "÷"
        print(#function)
        
        if let firstNumber = Double(firstTextField.text!), let secondNumber = Double(secondTextField.text!) {
            if secondNumber != 0 {
                let result = firstNumber / secondNumber
                
                getResult(result: result)
            } else {
                resultLabel.text = "0은 안됩니다"
            }
        } else {
            resultLabel.text = "입력값이 잘못되었습니다."
        }
    }
    
    @IBAction func squareButtonClicked(_ sender: Any) {
        signLabel.text = "^"
        print(#function)
        
        if let firstNumber = Double(firstTextField.text!), let secondNumber = Double(secondTextField.text!) {
            let result = pow(firstNumber, secondNumber)
            
            getResult(result: result)
        } else {
            resultLabel.text = "입력값이 잘못되었습니다."
        }
    }
}
