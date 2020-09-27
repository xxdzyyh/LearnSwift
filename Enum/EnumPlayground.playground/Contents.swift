import UIKit

enum ApiType {
    case home
    case userInfo(userId:String)
}

var apiType = ApiType.userInfo(userId: "12345")

if case let ApiType.userInfo(userId) = apiType {
    // "12345"
    print(userId)
}

apiType = ApiType.home

if case ApiType.home = apiType {
    // "ApiType.home"
    print("ApiType.home")
}

switch apiType {
case .home:
    print("home")
case .userInfo("12345"):
    print("userInfo(\"12345\")")
case let .userInfo(userId):
    print("userInfo \(userId)")
}

enum Direction : String {
    case e
    case s
    case w
    case n
}

let a = Direction.e.rawValue
let b = Direction.w.rawValue



//
//enum Name : String {
//    case Tom
//    case Tony = "122"
//    case Ted
//}
//
//let c = Name.Tom.rawValue // c = "Tom"
//let d = "122"
//
//if d == Name.Tom.rawValue {
//
//}

//switch d {
//case Name.Tom:
//    print("Tom")
//case Name.Tony:
//    print("Tony")
//default:
//    print(d)
//}
//

//let e = Name.Type
//let f = Name.init(rawValue: <#T##String#>)

struct MyApi : Equatable,ExpressibleByStringLiteral {
    var url : String?
    
    static func == (obj1:MyApi,obj2:MyApi) -> Bool {
        if obj1.url == nil && obj2.url == nil {
            return true
        }
        
        if obj1.url == nil || obj2.url == nil {
            return false
        }
        
        if obj1.url!.elementsEqual(obj2.url!) {
            return true
        } else {
            return false
        }
    }
    
    init(stringLiteral value: StringLiteralType) {
        self.url = value
    }
}

enum MyApiEnum : MyApi,RawRepresentable {
    typealias RawValue = MyApi
    
    case home, detail
    case unknown
    
    // Enum with raw type cannot have cases with arguments
    // case userInfo(userId:String)

    var rawValue: RawValue {
        switch self {
        case .home:
            return MyApi("123")
        case .detail:
            return MyApi("234")
        default:
            return MyApi("xxxx")
        }
    }
    
    init?(rawValue: MyApi) {
        switch rawValue {
        case MyApi("123") : self = MyApiEnum.home
        case MyApi("234") : self = MyApiEnum.detail
        default:
            self = MyApiEnum.unknown
        }
    }
}


let kk = MyApiEnum.detail.rawValue

// MyApi(url: Optional("234"))
print(kk)
