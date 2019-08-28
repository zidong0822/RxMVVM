//
//  ViewController.swift
//  RxMVVM
//
//  Created by Harvey He on 2019/8/28.
//  Copyright © 2019 Harvey He. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    lazy var sayHelloView:SayHelloView = {
        let sayHelloView = SayHelloView()
        return sayHelloView
    }()
    let viewModel = SayHelloViewModel()
    let bag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }

    func makeUI() {
        
        view.addSubview(sayHelloView)
        sayHelloView.snp.makeConstraints { (make) in
            make.left.top.equalTo(0)
            make.width.equalTo(view.snp.width)
            make.height.equalTo(300)
        }
        
        bindViewModel()
    }
    
    func bindViewModel() {
         let input = SayHelloViewModel.Input(name: sayHelloView.nameTextField.rx.text.orEmpty.asObservable(), validate: sayHelloView.validateButton.rx.tap.asObservable())
        let output = viewModel.transform(input: input)
        output.greeting.drive(sayHelloView.greetingLabel.rx.text).disposed(by: bag)
    }

    
}

