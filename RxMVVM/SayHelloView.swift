//
//  SayHelloView.swift
//  RxMVVM
//
//  Created by Harvey He on 2019/8/28.
//  Copyright © 2019 Harvey He. All rights reserved.
//

import UIKit

class SayHelloView: View {
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    lazy var validateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Validate", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        return label
    }()
    
    override func makeUI() {
        super.makeUI()
 
        addSubview(nameTextField)
        addSubview(validateButton)
        addSubview(greetingLabel)
        
        nameTextField.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.height.equalTo(30)
            make.top.equalTo(40)
            make.centerX.equalTo(snp.centerX)
        }
        
        validateButton.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.top.equalTo(nameTextField.snp.bottom).offset(40)
            make.centerX.equalTo(snp.centerX)
        }
        
        greetingLabel.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.height.equalTo(30)
            make.top.equalTo(validateButton.snp.bottom).offset(80)
            make.centerX.equalTo(snp.centerX)
        }
    }
}
