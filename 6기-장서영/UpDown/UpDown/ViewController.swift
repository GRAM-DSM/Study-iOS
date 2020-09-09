//
//  ViewController.swift
//  UpDown
//
//  Created by 장서영 on 2020/09/06.
//  Copyright © 2020 장서영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var UpDownLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var guessTxtField: UITextField!
    
    
    var randomNum : UInt32 = 0 //랜덤숫자
    var tryCount : Int = 0 //횟수
    
    @IBAction func submitTaped(_ sender: UIButton) {
        //입력된 값이 없을 시 실행되는 코드
        guard let inputguessNumTxt = self.guessTxtField.text,
            inputguessNumTxt.isEmpty == false else{
                print("입력된 값이 없습니다.")
                return
        }
        //잘못된 값을 입력했을 때의 코드
        guard let inputguessNumber : Int = Int(inputguessNumTxt) else{
            print("잘못된 값을 입력하셨습니다.")
            return
        }
        tryCount += 1 //횟수가 1번 추가된다.
        self.countLabel.text = "\(tryCount)" //추가된 횟수를 출력한다.
        // 입력된 값이 맞춰야 할 숫자보다 큰 경우 더 작은 값을 입력하라고 알려주는 코드
        if inputguessNumber > randomNum{
            UpDownLabel.text = "Down!!"
        }
        // 입력된 값이 맞춰야 할 숫자보다 작은 경우 더 큰 값을 입력하라고 알려주는 코드
        else if inputguessNumber < randomNum{
            UpDownLabel.text = "Up!!"
        }
        // 입력된 값과 맞춰야 할 숫자가 같은 경우 정답이라고 알려주는 코드
        else if inputguessNumber == randomNum{
            UpDownLabel.text = "Correct!!"
        }
    
        
    }
    // 다시 실행 버튼을 눌렀을 때 동작되는 코드
    @IBAction func retryTaped(_ sender: UIButton) {
        self.startGame()
    }
    // 게임 시작 함수
    func startGame(){
        self.randomNum = arc4random_uniform(100) 
        self.tryCount = 0
        self.UpDownLabel.text = "Game Start!!"
        self.countLabel.text = "\(tryCount)"
        self.guessTxtField.text = nil
        
        print("맞춰야 할 숫자는 \(self.randomNum)입니다.")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.startGame()
    }


}

