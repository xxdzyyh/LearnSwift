import UIKit


//func instanceOfClass<T:NSObject>(object:T.Type) -> T {
//    return T.init()
//}
//
//let obj = instanceOfClass(object: NSDate.self)

class Tool<T:NSObject> {
    static func instanceOfClass() -> T {
        return T.init()
    }
}

let obj = Tool<NSDate>.instanceOfClass()

    
//instanceOfClass(object: NSDate.self)
//
///*
// 泛型程序设计是程序设计语言的一种风格或范式。
// 允许程序员在强类型程序设计语言中编写代码时使用一些以后才指定的类型，在实例化时（instantiate）作为参数指明这些类型。
// */
//
//
///// 交换两个对象
///// - Parameters:
/////   - a: T
/////   - b: T
///// 只要这两个对象是同一类型即可，不需要知道这两个对象的任何信息，
//func swap<T>(a:inout T,b:inout T) {
//    let tmp = a
//    a = b
//    b = tmp
//}
//
//
//var a = 8;
//var b = 16;
//
//swap(&a, &b)
//
//
///// 打印hashValue
///// - Parameter a:
///// 在使用泛型的同时，提供部分信息
//func printHash<T:Hashable>(a:T) {
//    // 对传入的值有一定的约束
//    print(a.hashValue)
//}
//
//func printAny<T>(obj:T) {
//    print(obj)
//}
//
//func printNSObject<T:NSObject>(obj:T) {
//    print(obj.description)
//}
//
//func printObject1(obj:NSObject) {
//    print(obj.description)
//}
//
//
//class MyClass {
//
//}
//
//// error: global function 'printObject(obj:)' requires that 'MyClass' inherit from 'NSObject'
//// printObject(obj: MyClass())
//
//// error: cannot convert value of type 'MyClass' to expected argument type 'NSObject'
//// printObject1(obj: MyClass())
//
//printAny(obj: MyClass())
//
//class  MyClass1: NSObject {
//
//}
//
//printNSObject(obj: MyClass1())
//
//printObject1(obj: MyClass1())
//
//
//
//class Goods : NSObject {
//    var name = "123"
//    var url = "1233123"
//
//    override class func description() -> String {
//        return "Goods"
//    }
//}
//
//class User : NSObject {
//    override class func description() -> String {
//        return "User"
//    }
//}
//
//class PageModel<T:NSObject> : NSObject {
//    var page : Int = 0
//    var total : Int = 0
//    var list : [T] = [T.init()]
//    var size : Int = 20
//
//    func test() -> T {
//        return T.init()
//    }
//}
//
//class Root<T:NSObject> : NSObject {
//    var code : Int = 0
//    var messgae : String = ""
//    var data : PageModel<T>?
//
//    override init() {
//
//    }
//}
//
////class RootError1<T,D> : NSObject where D : PageModel<T> {
////    var data : D?
////    override init() {
////        data = PageModel<T>.init() as! D
////        print(data!)
////    }
////}
////
////var re = RootError1<Goods,PageModel<Goods>>()
//
//
//
//var resp = Root<PageModel<Goods>>()
//
////resp.data?.dataList.first
//
//var resp1 = Root<User>()
//
//
///**
// error: expected '>' to complete generic argument list
// class RootError1<T:PageModel<K:NSObject>> : NSObject {
//                               ^
//
// Generic.playground:90:29: note: to match this opening '<'
// class RootError1<T:PageModel<K:NSObject>> : NSObject {
//
// class RootError1<T:PageModel<K:NSObject>> : NSObject {
//
// }
//
//
// error: reference to generic type 'PageModel' requires arguments in <...>
// class RootError1<T:PageModel> : NSObject {
//                    ^
//                             <NSObject>
//
// Generic.playground:84:7: note: generic type 'PageModel' declared here
// class PageModel<T:NSObject> : NSObject {
//       ^
//
// class RootError1<T:PageModel> : NSObject {
//
// }
// */
//
//class RootError<T:PageModel<NSObject>> : NSObject {
//    var code : Int = 0
//    var messgae : String = ""
//    var data : T?
//}
//
///**
//
// error: 'RootError' requires that 'PageModel<Goods>' inherit from 'PageModel<NSObject>'
//var  resp3 = RootError<PageModel<Goods>>()
//             ^
//
//Generic.playground:90:7: note: requirement specified as 'T' : 'PageModel<NSObject>' [with T = PageModel<Goods>]
//class RootError<T:PageModel<NSObject>> : NSObject {
//*/
////var  resp3 = RootError<PageModel<Goods>>()
//
