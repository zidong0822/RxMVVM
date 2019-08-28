//
//  ViewModel.swift
//  RxMVVM
//
//  Created by Harvey He on 2019/8/28.
//  Copyright © 2019 Harvey He. All rights reserved.
//

import Foundation

//定义viewmodel的输入输出,以及提供输入到输出的转换
protocol ViewModelType {
   
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
