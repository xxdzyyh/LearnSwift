//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport


extension String {
    func xf_subString(from index:Int) -> String {
        if index <= 0 {
            return self
        }
        
        if index >= self.count {
            return ""
        }
        
        return String(self[self.index(self.startIndex,offsetBy: index)..<self.index(self.startIndex,offsetBy: self.count)])
    }
    
    func xf_subString(to index:Int) -> String  {
        if index >= self.count {
            return self
        }
        
        if index <= 0 {
            return ""
        }
        
        return String(self[..<self.index(self.startIndex,offsetBy: index)])
    }
}

"123456789".xf_subString(to: 0)
"123456789".xf_subString(to: 1)
"123456789".xf_subString(to: 5)
"123456789".xf_subString(to: 8)
"123456789".xf_subString(to: 9)
"123456789".xf_subString(to: 11)

"123456789".xf_subString(from:0)
"123456789".xf_subString(from:1)
"123456789".xf_subString(from:5)
"123456789".xf_subString(from:8)
"123456789".xf_subString(from:9)
"123456789".xf_subString(from:11)

/**
 public func secondsToPrettyTime(seconds:Int) -> String {
     if seconds < 60 {
         return "\(seconds)秒"
     } else if seconds < 3600 {
         let min = seconds / 60
         let sec = seconds % 60
         return "\(min)分钟\(sec)秒"
     } else {
         let hour = seconds / 3600
         let min = (seconds % 3600) / 60
         let sec = (seconds % 3600) % 60
         return "\(hour)小时\(min)分钟\(sec)秒"
     }
 }


 secondsToPrettyTime(seconds: 0)
 secondsToPrettyTime(seconds: 10)
 secondsToPrettyTime(seconds: 70)
 secondsToPrettyTime(seconds: 400)
 secondsToPrettyTime(seconds: 4000)
 */

//enum ValidationResult {
//    case ok(msg: String)
//    case empty(msg: String)
//    case validating
//    case failed(msg: String)
//}
//
//extension ValidationResult {
//    var isValid: Bool {
//        switch self {
//        case .ok:   return true
//        default:    return false
//        }
//    }
//}
//
//func validateIDNumber(idNumber : String) -> ValidationResult {
//        let count = idNumber.count
//    print(count)
//        if count == 0 {
//            return .empty(msg: "请输入身份证号")
//        }
//
//        if count != 15 && count != 18 {
//            print("fail 1")
//            return .failed(msg: "请输入正确的身份证号")
//        } else {
//            if count == 15 {
//                if isPurnInt(string: idNumber) {
//                    return .ok(msg: "")
//                } else {
//                    print("fail 2")
//                    return .failed(msg: "请输入正确的身份证号")
//                }
//            } else {
//                let pre = String(idNumber[..<idNumber.index(idNumber.startIndex,offsetBy: 17)])
//                let last = idNumber.last!
//
//                if last.isNumber {
//                    if isPurnInt(string: pre) {
//                        return .ok(msg: "")
//                    } else {
//                        print("fail 3")
//                        return .failed(msg: "请输入正确的身份证号")
//                    }
//                } else {
//                    if last == "X" || last == "x" {
//                        if isPurnInt(string: pre) {
//                            return .ok(msg: "")
//                        } else {
//                            print("fail 4")
//                            return .failed(msg: "请输入正确的身份证号")
//                        }
//                    } else {
//                        print("fail 5")
//                        return .failed(msg: "请输入正确的身份证号")
//                    }
//                }
//            }
//    }
//}
//
//
//    // 判断输入的字符串是否为数字，不含其它字符
//    func isPurnInt(string: String) -> Bool {
//        let scan: Scanner = Scanner(string: string)
//        var val:Int = 0
//        return scan.scanInt(&val) && scan.isAtEnd
//    }
//
//
//validateIDNumber(idNumber: "421127199111133216")
//validateIDNumber(idNumber: "42112719911113321x")
//validateIDNumber(idNumber: "42112719911113321X")
//validateIDNumber(idNumber: "4a112719911113321X")
//validateIDNumber(idNumber: "42112719911113326")
//validateIDNumber(idNumber: "4211271991111332169")
//validateIDNumber(idNumber: "421127199111133")
//validateIDNumber(idNumber: "42112719911113")
//validateIDNumber(idNumber: "42112719911113x")
//validateIDNumber(idNumber: "42112719911113X")
//
//
//
//
//func isWholeChinese(string:String) -> Bool{
//    for char in string {
////        if "\u{4E00}" <= char && char <= "\u{9FA5}" {
////
////        } else {
////            return false
////        }
//
//        guard "\u{4E00}" <= char && char <= "\u{9FA5}" else {
//            return false
//        }
//    }
//    return true;
//}
//
//isWholeChinese(string: "我是a")
//isWholeChinese(string: "我")
//
//isWholeChinese(string: "我没中国人")
//isWholeChinese(string: "1")
