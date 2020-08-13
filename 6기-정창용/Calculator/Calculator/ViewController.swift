//
//  ViewController.swift
//  Calculator
//
//  Created by 정창용 on 2020/08/05.
//  Copyright © 2020 정창용. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var userIsInTheMiddleOfTyping: Bool = false // 입력 중일 때
    var finalValue: Double = 0 // 결과 값
    var currentValue1: Int = 0 // 중간 값1
    var currentValue2: Int = 0 // 중간 값2
    var method = 0 // 연산 종류
    var operatorr: String = "+" // 연산자
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func numberButton(_ sender: UIButton) {
        let num = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = resultLabel.text!
            resultLabel.text = textCurrentlyInDisplay + num
        } else {
            resultLabel.text = num
        }
        
        userIsInTheMiddleOfTyping = true
        
    }
    
    @IBAction func eraseButton(_ sender: UIButton) {
        resultLabel.text = "0"
        userIsInTheMiddleOfTyping = false
        currentValue1 = 0
        currentValue2 = 0
        finalValue = 0
    }
    
    @IBAction func enterButton(_ sender: UIButton) {
        if let realValue = resultLabel.text {
            currentValue2 = Int(realValue) ?? 0
        }
        
        switch operatorr {
        case "+":
            finalValue = Double(currentValue1) + Double(currentValue2)
        case "-":
            finalValue = Double(currentValue1) - Double(currentValue2)
        case "*":
            finalValue = Double(currentValue1) * Double(currentValue2)
        case "/":
            finalValue = Double(currentValue1) / Double(currentValue2)
        default:
            finalValue = 0
        }
        
        resultLabel.text = "\(finalValue)"
        
    }
    
    @IBAction func operaterButton(_ sender: UIButton) {
        let operater = sender.currentTitle!
        
        operatorr = operater
        
        if let realValue = resultLabel.text {
            currentValue1 = Int(realValue) ?? 0
        }
        
        resultLabel.text = ""
        
    }
    
}
// 아 귀찮다아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ
