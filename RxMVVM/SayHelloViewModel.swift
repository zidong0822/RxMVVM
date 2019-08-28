//
//  SayHelloViewModel.swift
//  RxMVVM
//
//  Created by Harvey He on 2019/8/28.
//  Copyright © 2019 Harvey He. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SayHelloViewModel: ViewModelType {
    
    struct Input {
        let name: Observable<String>
        let validate: Observable<Void>
    }
    
    struct Output {
        let greeting: Driver<String>
    }
    
    func transform(input: Input) -> Output {
        let greeting = input.validate.withLatestFrom(input.name).map { name in
            return "Hello \(name)!"
            }.startWith("").asDriver(onErrorJustReturn: ":-(")
        return Output(greeting: greeting)
    }
    
}
