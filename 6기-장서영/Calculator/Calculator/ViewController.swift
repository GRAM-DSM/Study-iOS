//
//  ViewController.swift
//  Calculator
//
//  Created by 장서영 on 2020/08/05.
//  Copyright © 2020 장서영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    
    var firstNum : Int = 0
    var secondNum : Int = 0
    var resultNum : Int = 0
    var operat : String = ""
    var remember : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func numberButton(_ sender: UIButton) {
        let digit = sender.currentTitle!//값을 받아서
        if let number = label.text  {
            label.text = number + digit
        } else {
            label.text = digit
        }
        
        //만약 값이 있으면 label.text+digit
        //값이 없으면
        
        
    }
    @IBAction func calcButton(_ sender: UIButton) {
        if let number = label.text {
            firstNum = Int(number) ?? 0
        }
        let op = sender.currentTitle!
        label.text = nil
        operat = op
        
        
    }
    @IBAction func resetButton(_ sender: UIButton) {
        label.text = ""
        firstNum = 0
        secondNum = 0
        resultNum = 0
    }
    @IBAction func enterButton(_ sender: UIButton) {
        if let number = label.text{
            secondNum = Int(number) ?? 0
        }
        switch operat {
        case "+": resultNum = firstNum + secondNum
        case "-": resultNum = firstNum - secondNum
        case "*": resultNum = firstNum * secondNum
        case "/": resultNum = firstNum / secondNum
        default : resultNum = 0
        }
        label.text = String(resultNum)
    }
}

