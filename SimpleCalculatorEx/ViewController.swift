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
    
    var op: Operator = .plus
    
    enum Operator: String {
        case plus = "+"
        case minus = "-"
        case divide = "÷"
        case mulyiply = "x"
        case square = "^"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clearButtonClicked(_ sender: Any) {
        firstTextField.text = ""
        secondTextField.text = ""
        resultLabel.text = ""
        signLabel.text = ""
    }
    
    func getResult(oper: Operator) {
        op = oper
        signLabel.text = oper.rawValue
        
        if let firstNumber = Double(firstTextField.text!), let secondNumber = Double(secondTextField.text!) {
            if op == .divide {
                if secondNumber != 0 {
                    calculate(firstNumber: firstNumber, secondNumber: secondNumber)
                } else {
                    resultLabel.text = "0은 안됩니다"
                }
            } else {
                calculate(firstNumber: firstNumber, secondNumber: secondNumber)
            }
        } else {
            resultLabel.text = "입력값이 잘못되었습니다."
        }
    }
    
    func calculate(firstNumber: Double, secondNumber: Double) {
        var result: Double = 0
        
        //연산자 기호에 따라 다르게 연산
        switch op {
        case .plus:
            result = firstNumber + secondNumber
        case .minus:
            result = firstNumber - secondNumber
        case .divide:
            result = firstNumber / secondNumber
        case .mulyiply:
            result = firstNumber * secondNumber
        case .square:
            result = pow(firstNumber, secondNumber)
        }
        
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            resultLabel.text = "= \(Int(result))"
        } else {
            resultLabel.text = "= \(result)"
        }
    }
    
    //input, output 자릿수 제한 걸기 미해결
    @IBAction func plusButtonClicked(_ sender: Any) {
        getResult(oper: .plus)
    }
    
    @IBAction func minusButtonClicked(_ sender: Any) {
        getResult(oper: .minus)
    }
    
    @IBAction func multiplyButtonClicked(_ sender: Any) {
        getResult(oper: .mulyiply)
    }
    
    @IBAction func divideButtonClicked(_ sender: Any) {
        getResult(oper: .divide)
    }
    
    @IBAction func squareButtonClicked(_ sender: Any) {
        getResult(oper: .square)
    }
}
