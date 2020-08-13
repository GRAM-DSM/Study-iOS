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
    
    
    var firstNum : Int = 0 //입력되는 첫번째 숫자
    var secondNum : Int = 0 //입력되는 두번째 숫자
    var resultNum : Int = 0 //결과값
    var operat : String = "" //연산자
    var remember : Int = 0 //중간에 값을 담아둘 기억할 값
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func numberButton(_ sender: UIButton) {
        let digit = sender.currentTitle!//값을 받아서 저장
        if let number = label.text  {
            label.text = number + digit //입력이 끝날 때까지 다음 숫자를 받는다.
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

