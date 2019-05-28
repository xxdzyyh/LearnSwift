import UIKit
import PlaygroundSupport
import RxSwift

let of = Observable.of("a","b","c").subscribe(onNext: { (s) in
    print(s)
})

let from = Observable.from(["a","b","c"]).subscribe(onNext: { (s) in
    print(s)
})

