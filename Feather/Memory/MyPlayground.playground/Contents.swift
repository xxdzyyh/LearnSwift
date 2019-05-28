import UIKit

struct User {
    var age : Int = 0
}

let classSize = MemoryLayout<User>.size
let classStride = MemoryLayout<User>.stride
let classAligment = MemoryLayout<User>.alignment

struct HUser {
    // Int 8
    var index : Int = 0
    
    // Int 8 + 可选类型 1 = 9 byte
    // 虽然 可选只占用了1byte,但是对齐占据了7byte，所以可选类型比较浪费内存
    var a : Int?
    
    func add() -> Int {
        return a ?? 0 + index
    }
}

let user = HUser()

// stride = size + aligment
let size = MemoryLayout.size(ofValue: user)
let stride = MemoryLayout.stride(ofValue: user)
let aligment = MemoryLayout.alignment(ofValue: user)



enum Kind {
    case wolf
    case fox
    case dog
    case sheep
}

struct Animal {
    private var a : Int = 1
    var b : String = "animal"
    var c : Kind = .wolf
    var d : String?
    var e : Int8 = 8
    
    // 获取头指针
    mutating func headPointerOfStruct() ->UnsafeMutablePointer<Int8> {
        return withUnsafeMutablePointer(to: &self) {
            return UnsafeMutableRawPointer($0).bindMemory(to: Int8.self, capacity: MemoryLayout<Animal>.stride)
        }
    }
    
    func printA() {
        print("Animal a:\(a)")
    }
}

var animal = Animal()
var animalPtr : UnsafeMutablePointer<Int8> = animal.headPointerOfStruct()
var animalRawPtr = UnsafeMutableRawPointer(animalPtr)

let aPtr = animalRawPtr.advanced(by: 0).assumingMemoryBound(to: Int.self)

aPtr.pointee
animal.printA()
aPtr.initialize(to: 100)
aPtr.pointee
animal.printA()


