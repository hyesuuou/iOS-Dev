//
//  ViewController.swift
//  RxSwift02
//
//  Created by 김혜수 on 2022/02/17.
//

import UIKit

import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var valueField: UITextField!
    @IBOutlet weak var valueLabel: UILabel!
    
    enum MyError: Error {
        case error
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewDidLoad - Start")
        lecture08DidLoad()
    }
    
    func practice() {
        Observable.just("Hello World")
            .subscribe { print($0) }
            .disposed(by: disposeBag)
    }
    
    // MARK: - 02. create
    
    func lecture02() {
        _ = Observable<Int>.create { (observer) -> Disposable in
            observer.on(.next(0))
            observer.onNext(1)
            observer.onCompleted()
            return Disposables.create()
        }
        
        _ = Observable<Int>.from([0, 1])
    }
    
    // MARK: - 03
    
    func lecture03() {
       
        let subject = PublishSubject<String>()
        
        // subscribe 이전에 전달된 데이터는 전달되지 않는다.
        subject.onNext("Subject Hello")
        
        let observer1 = subject.subscribe { print(">>1", $0) }
        observer1.disposed(by: disposeBag)
        
        subject.onNext("Subject Hello2")
        
        let observer2 = subject.subscribe { print(">>2", $0) }
        observer2.disposed(by: disposeBag)
        subject.onNext("Subject Hello3")
        
        //subject.onCompleted() // observer1, observer2 모두에게 전달된다.
        subject.onError(MyError.error)
        
        let observer3 = subject.subscribe { print(">>3", $0) }
        observer3.disposed(by: disposeBag) // error, complete는 여기도 전달된다.
    }
    
    // MARK: - 04. Just, of, from
    
    func lecture04() {
        let element = "^_^"
        let array = ["red", "green", "yellow", "purple", "pink", "blue"]
        
        // 1. just - 하나의 항목을 방출하고 complete되는 연산자
        Observable.just(element)
            .subscribe { print($0) }
            .disposed(by: disposeBag)
        
        Observable.just([1, 2, 3])
            .subscribe { print($0) }
            .disposed(by: disposeBag)
        
        // 2. of - 여러 개의 값을 동시에 전달하는 연산자
        Observable.of("apple", "orange", "peach")
            .subscribe { print($0) }
            .disposed(by: disposeBag)
        
        Observable.of([1, 2], [3, 4], [5])
            .subscribe { print($0) }
            .disposed(by: disposeBag)
        
        
        // 3. from - 배열의 요소가 하나씩 방출되는 연산자
        Observable.from(array)
            .subscribe { print($0) }
            .disposed(by: disposeBag)
    }
    
    // MARK: - 05. Filter
    
    func lecture05() {
        let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        
        // filter - True를 리턴하는 요소만 선택해서 리턴함
        Observable.from(numbers)
            .filter { $0.isMultiple(of: 2) }
            .subscribe { print($0) }
            .disposed(by: disposeBag)
    }
    
    // MARK: - 06. FlatMap
    
    func lecture06() {
        
        // flatMap - Observable로 변환하고, 값이 업데이트 될때마다 새로운 항목을 방출한다. -> 개별 Observable들이 모여 하나의 Observable로 반환된다.
        let a = BehaviorSubject(value: 1)
        let b = BehaviorSubject(value: 2)
        
        let subject = PublishSubject<BehaviorSubject<Int>>()
        subject
            .flatMap { $0.asObservable() }
            .subscribe { print($0) }
            .disposed(by: disposeBag)
        
        subject.onNext(a)
        subject.onNext(b)
        
        // 원래 옵저버블의 값이 업데이트 되면 -> 얘도 방출됨 (네트워크 요청시 자주 사용됨)
        a.onNext(11)
        b.onNext(22)
        
    }
    
    // MARK: - 07. Combine Latest
    
    func lecture07() {
        
        // combineLatest - Source Observable 2개를 병합(combine) - 최근에 방출된 것과 병합됨
        let greetings = PublishSubject<String>()
        let languages = PublishSubject<String>()
        
        Observable.combineLatest(greetings, languages) { lhs, rhs -> String in
            return "\(lhs) \(rhs)"
        }
        .subscribe { print($0) }
        .disposed(by: disposeBag)
        
        // 구독과 동시에 값을 방출하고 싶다면 -> start.. behavior
        
        greetings.onNext("Hello")
        languages.onNext("영어")
        languages.onNext("한글")
        
        // greetings.onCompleted()  //여기까지만 하면 아직까지 completed되지 않는
        greetings.onError(MyError.error) // 하나라도 error를 방출하면 끝
        languages.onNext("RxSwift")
        languages.onCompleted()
    }
    
    // MARK: - 08. RxCocoa Binding
    
    func lecture08() {
        
    }

    func lecture08DidLoad() {
        valueLabel.text = ""
        valueField.becomeFirstResponder()
        
//        valueField.rx.text
//            .observeOn(MainScheduler.instance)
//            .subscribe(onNext: { [weak self] str in
//                self?.valueLabel.text = str
//            })
//            .disposed(by: disposeBag)
        
        valueField.rx.text
            .bind(to: valueLabel.rx.text)
            .disposed(by: disposeBag)
        
    }

}

