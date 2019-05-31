import UIKit
import PlaygroundSupport
import RxSwift
import RxCocoa

let of = Observable.of("a","b","c")

of.subscribe(onNext: { (s) in
    print(s)
})
print("------------")

of.subscribe { (event) in
    print(event)
    // 获取事件里的数据
    print(event.element ?? "")
}
print("------------")

let from = Observable.from(["a","b","c"]).subscribe(onNext: { (s) in
    print(s)
})
print("------------")

let just = Observable.just("a")
    
just.subscribe(onNext:{ (s) in
    print(s)
})

print("------------")

just.do(onNext: { (s) in
    print("do(onNext: \(s)")
}, onError: { (error) in
    print("do(onError: \(error)")
}, onCompleted: { 
    print("do(onCompleted)")
}, onSubscribe: { 
    print("do(onSubscribe")
}, onSubscribed: { 
    print("do(onSubscribed")
},onDispose: {
    print("do(onDispose")
}).subscribe(onNext:{ (s) in
    print(s)
})

let subscription = just.subscribe(onNext:{ (s) in
    print(s)
})

subscription.dispose()

var label = UILabel()
let observable = Observable<Int>.interval(1, scheduler: MainScheduler.instance)

observable
    .map { (index) -> String in
        return "当前 index= \(index)"
    }.subscribe(onNext: { (s) in
        label.text = s
    })

observable
    .map { (index) -> String in
        return "当前 index= \(index)"
    }
