import UIKit
import PlaygroundSupport
import RxSwift
import RxCocoa

var disposeBag : DisposeBag? = DisposeBag()

Observable.just(Date().timeIntervalSince1970).do(onNext: { (event) in
    
}, onDispose: {
    print("onDispose")
}).subscribe(onNext: { (event) in
    
}, onDisposed: {
    print("subscribe onDispose")
}).disposed(by: disposeBag!)

//disposeBag = nil

//获取豆瓣某频道下的歌曲信息
func getPlaylist(_ channel: String) -> Single<[String: Any]> {
    return Single<[String: Any]>.create { single in
        let url = "https://douban.fm/j/mine/playlist?" + "type=n&channel=\(channel)&from=mainsite"
        let task = URLSession.shared.dataTask(with: URL(string: url)!) { data, _, error in
            if let error = error {
                single(.error(error))
                return
            }

            guard let data = data,let json = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves),let result = json as? [String: Any] else {
                single(.error(DataError.cantParseJSON))
                return
            }
            single(.success(result))
        }

        print("-----",task,"---------")
        task.resume()
        return Disposables.create { task.cancel() }
    }
}

//与数据相关的错误类型
enum DataError: Error {
   case cantParseJSON
}


//let o = getPlaylist("0")
//
//o.subscribe(onSuccess: { (result) in
//    print("------------------------------")
//    print(result)
//    print("------------------------------")
//}) { (error) in
//    print(error)
//}.disposed(by: disposeBag)
//
//
//o.subscribe(onSuccess: { (result) in
//    print("------------------------------")
//    print(result)
//    print("------------------------------")
//}) { (error) in
//    print(error)
//}.disposed(by: disposeBag)
//
//
func getPlaylistWithCache(_ channel: String) -> Observable<[String: Any]> {
    return Observable.of(channel).flatMap({ (channel) -> Single<[String:Any]> in
        return getPlaylist(channel)
    }).share(replay: 1, scope: .whileConnected)
}

let ob = getPlaylistWithCache("0")

ob.subscribe(onNext: { (result) in
    print("------------------------------")
    print(result)
    print("------------------------------")
}, onError: { (error) in
    
}).disposed(by: disposeBag)

ob.subscribe(onNext: { (result) in
    print("------------------------------")
    print(result)
    print("------------------------------")
}, onError: { (error) in
    
}).disposed(by: disposeBag)

ob.subscribe(onNext: { (result) in
    print("------------------------------")
    print(result)
    print("------------------------------")
}, onError: { (error) in
    
}).disposed(by: disposeBag)

//let button = UIButton.init(type: .system)
//
//let p = PublishSubject<String>()
//
//p.bind(to: button.rx.title(for: .normal))
//p.onNext("234")
//button.sizeToFit()
//print(button.title(for: .normal))
//
//let observerType = AnyObserver<String>.init { (envet) in
//    print(envet)
//}
//
//p.bind(to: observerType)
//p.onNext("asdfg")
//
//print(button.title(for: .normal))


//let pb1 = PublishSubject<Int>()
//let pb2 = PublishSubject<String>()
//
//pb1.withLatestFrom(pb2).subscribe { (event) in
//    print(event)
//}
//
//pb1.withLatestFrom(pb2).subscribe {
//    print($0)
//}
//
//pb1.withLatestFrom(pb2).subscribe {
//    print($0)
//}.disposed(by: disposeBag)
//
//pb2.onNext("西海情歌")
//pb1.onNext(1)
//
//
//
//// AnonymousObservable
//let observable = Observable<String>.create { (observer) -> Disposable in
//    observer.onNext("String A")
//    observer.onCompleted()
//    return Disposables.create {
//        print("Disposed")
//    }
//}
//
//class MyModel : NSObject {
//
//}
//
//class MyModel2 : NSObject {
//
//}
//
//func request() -> Single<MyModel> {
//    return Single<MyModel>.create { (observer) in
//        observer(.success(MyModel()))
//        return Disposables.create {
//
//        }
//    }
//}
//
////
//request().map { (model) -> MyModel2 in
//    return MyModel2()
//}
//
//
//print(observable)
//
//observable.subscribe(onNext: { (string) in
//    print(string)
//} ,onCompleted: {
//     print("onCompleted")
//}) {
//     print("onDispose")
//}.disposed(by: disposeBag)
//
//
//observable.subscribe(onNext: { (string) in
//    print(string + "2")
//} ,onCompleted: {
//     print("onCompleted 2")
//}) {
//     print("onDispose 2")
//}.disposed(by: disposeBag)
//
//
//
//let of = Observable.of("a","b","c")
//
//of.subscribe(onNext: { (s) in
//    print(s)
//})
//print("------------")
//
//of.subscribe { (event) in
//    print(event)
//    // 获取事件里的数据
//    print(event.element ?? "")
//}
//print("------------")
//
//let from = Observable.from(["a","b","c"]).subscribe(onNext: { (s) in
//    print(s)
//})
//print("------------")
//
//let just = Observable.just("a")
//
//just.subscribe(onNext:{ (s) in
//    print(s)
//})
//
//print("------------")
//
//just.do(onNext: { (s) in
//    print("do(onNext: \(s)")
//}, onError: { (error) in
//    print("do(onError: \(error)")
//}, onCompleted: {
//    print("do(onCompleted)")
//}, onSubscribe: {
//    print("do(onSubscribe")
//}, onSubscribed: {
//    print("do(onSubscribed")
//},onDispose: {
//    print("do(onDispose")
//}).subscribe(onNext:{ (s) in
//    print(s)
//})
//
//let subscription = just.subscribe(onNext:{ (s) in
//    print(s)
//})
//
//subscription.dispose()
//
//var label = UILabel()
//let observable = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
//
//observable
//    .map { (index) -> String in
//        return "当前 index= \(index)"
//    }.subscribe(onNext: { (s) in
//        label.text = s
//    })
//
//observable.map { (index) -> String in
//    return "当前 index= \(index)"
//}
//
