import UIKit

//struct NumberStruct {
//    var age = 20
//    var height = 180
//    var weight = 70
//}
//
//struct UserStruct {
//    var p = 0
//    var q = 0
//}
//
//var num = NumberStruct()
//var numPtr = UnsafeMutablePointer<NumberStruct>(&num)
//
//numPtr.advanced(by: 1)
//
//var length = numPtr.withMemoryRebound(to: Int.self, capacity: 0) {
//    return $0
//}
//
//length[0] = 999
//length[3] = 998
//
////print(length[0])
////print(length[1])
////print(length[2])
////print(length[3])
////print(length[4])
////
////print(num)
//
//print(MemoryLayout<UInt64>.stride)
//
//let uint64Point = UnsafeRawPointer(length).bindMemory(to: UInt64.self, capacity: 2)
//
//var fullInterget = uint64Point.pointee
//var fistByte = uint64Point

print(MemoryLayout<UInt8>.stride)

var n : Array<UInt8> = [1,2,3,4,5,6,7,8]

let size = MemoryLayout.stride(ofValue: n)

let uint8Pointer: UnsafePointer<UInt8> = UnsafePointer<UInt8>(&n)

let index3 = (uint8Pointer + 2).pointee

//let length = uint8Pointer.withMemoryRebound(to: Int8.self, capacity: 8) {
//    return strlen($0)
//}
//
let uint64Pointer = UnsafeRawPointer(uint8Pointer).bindMemory(to: UInt64.self, capacity: 1)

var fullInteger = uint64Pointer.pointee 
var firstByte = uint8Pointer.pointee  

let rawPointer = UnsafeRawPointer(uint64Pointer)

fullInteger = rawPointer.load(as: UInt64.self)   // OK
firstByte = rawPointer.load(as: UInt8.self)     


var strs = ["Tony","Sam","Dave"]

let strPtr = UnsafePointer<String>(&strs)

var first = strs[0]
var secode = strs[1]
var third = strs[2]

class Human {
    var age: Int?
    var name: String? 
    var nicknames = ["Tony","Sam","Dave"]
    
    //返回指向 Human 实例头部的指针
    func headPointerOfClass() -> UnsafeMutablePointer<Int8> {
        let opaquePointer = Unmanaged.passUnretained(self as AnyObject).toOpaque()
        let mutableTypedPointer = opaquePointer.bindMemory(to: Int8.self, capacity: MemoryLayout<Human>.stride)        
        return UnsafeMutablePointer<Int8>(mutableTypedPointer)
    }
}

print(MemoryLayout<Human>.size)

var human = Human()

human.age = 18
//
////拿到指向 human 堆内存的 void * 指针
//var humanRawPtr = UnsafeMutableRawPointer(human.headPointerOfClass())
//
////nicknames 数组在内存中偏移 64byte 的位置(16 + 16 + 32)
//let humanNickNamesPtr =  humanRawPtr.advanced(by: 64).assumingMemoryBound(to: Array<String>.self)
//
//print(human.nicknames)   

var humanRawPtr = UnsafeMutablePointer<Human>(&human)

print(humanRawPtr.pointee.nicknames)
