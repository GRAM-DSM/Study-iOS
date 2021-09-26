//
//  ViewController.swift
//  rxPractice
//
//  Created by 김기영 on 2021/09/17.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak private var txtField: UITextField!
    @IBOutlet weak private var label: UILabel!

    var bag = DisposeBag()
    

    override func viewDidLoad() {
        txtField.rx.text.orEmpty.subscribe(onNext: { [weak self] txt in
            self?.label.text = txt
        }).disposed(by: bag)
    }
}

