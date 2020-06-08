import UIKit

class MyObject {
    var name = ""
    init() {
        print("MyObject init")
    }
	
    deinit {
        print("MyObject deinit")
    }
	
}

struct MyStruct {
    var name = "init name"
    init() {
        print("MyStruct init")
    }
	
	/**
	Deinitializers may only be declared within a class
	
	deinit {
		print("MyStruct init")
	}
	*/
}

func getConstPointerType<T> (ptr:UnsafePointer<T>) -> UnsafePointer<T> {
    return ptr
}

func getMutablePointerType<T> (ptr: UnsafeMutablePointer<T>) -> UnsafeMutablePointer<T> {
    return ptr
}

func updateName(_ myStruct : inout MyObject) {
    myStruct.name = "updateName"
}

func errorUpdateName(_ myStruct : MyObject) {
    myStruct.name = "errorUpdateName"
}

var myStruct: MyStruct = MyStruct()

let p1 = UnsafePointer<MyStruct>(&myStruct)

print(p1.pointee.name)
p1.deallocate()

var p2 = UnsafeMutablePointer<MyStruct>(&myStruct)

p2.pointee.name = "p2"

print(p2.pointee.name)

p2.deallocate()
