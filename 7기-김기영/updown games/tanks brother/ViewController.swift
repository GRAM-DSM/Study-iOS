//
//  ViewController.swift
//  tanks brother
//
//  Created by 김기영 on 2021/04/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var upDownLabel: UILabel!//업다운 나오는데 레이블 설정
    @IBOutlet weak var number:UILabel!//횟수 나오는데 레이블 설정
    @IBOutlet weak var text: UITextField!//숫자 넣는 텍스트 퓔드
    
    var randomNumber : UInt32 = 0//숫자를 랜덤으로 설정
    var num : Int = 0//횟수 레이블에 들어갈 값 0으로 지정
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startgame()
        // Do any additional setup after loading the view.
    }//처음 화면에 startgame 함수가 실행하도록 함

    @IBAction func submitButton(_ sender: UIButton){
        guard let inputguessNumTxt = self.text.text,
              inputguessNumTxt.isEmpty == false else{
            print("입력된 값이 없습니다.")//제출 버튼을 눌렀을 때 텍스트퓔드에 아무값이 없으면 텍스트 뜸
            return
        }
        guard let inputguessNumber : Int = Int(inputguessNumTxt) else{
            print("잘못된 값을 입력하셨습니다.")//정수가 입력되지 않으면 오류가 뜸
            return
        }
        num += 1//버튼을 누를 때마다 횟수 추가
        number.text = "\(num)"//아까 지정한 num값을 number 대입
        if randomNumber > inputguessNumber{
            upDownLabel.text = "Up!!"//랜덤 숫자가 text에 나오는 숫자보다 클 때 업다운레이블 텍스트는 업으로 바뀜
        }
        else if randomNumber < inputguessNumber{
            upDownLabel.text = "Down!!"//반대
        }
        else{
            upDownLabel.text = "추카요"//랜덤 숫자를 text에 쳐서 맞추면 텍스트 추카요가 나옴
        }
        
    }//submitButton 버튼을 눌렀을 때 발생하는 함수를 만들어줌

    @IBAction func restart(_ sendeer: UIButton){
        startgame()
    }//restart 버튼을 눌렀을 때 발생하는 함수를 만들어줌
    
    func startgame() {
        randomNumber = arc4random_uniform(100)// 'randomNumber'라는 변수에 랜덤으로 0~99까지 숫자 입력
        num = 0 //횟수가 0
        upDownLabel.text = "Game start"//업다운 레이블에 "Game start"입력
        number.text = "\(num)" //number lablel에 num에 0을 입력해서 0으로 만들어줌
        text.text = nil //시작할 때 텍스트 창에 아무것도 없게 만들어줌
        print("맞춰야 할 숫자는\(randomNumber)")//맥북 창에만 어떤 숫자를 만들어야 하는지 띄우게 해줌
    }
}


