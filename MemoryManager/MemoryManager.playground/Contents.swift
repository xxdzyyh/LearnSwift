import UIKit

protocol CellRegister {
    func cell(for tableView:UITableView) -> Self
}

class MyCell : UITableViewCell,CellRegister {
    func cell(for tableView: UITableView) -> Self {
        return tableView.dequeueReusableCell(withIdentifier: "identifer") as! Self
    }
}

//extension UITableViewCell : CellRegister {
//    func cell(for tableView: UITableView) -> Self {
//        return tableView.dequeueReusableCell(withIdentifier: "identifer") as! Self
//    }
//}

var array = [1,2,3]

for _ in array {
    array.removeLast()
    print(array)
}

print(array)

//extension UITableViewCell {
//    func cell(for tableView:UITableView) -> Self {
//        return tableView.dequeueReusableCell(withIdentifier: "identifer") as! Self
//    }
//}
    
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

let c1 = MyObject()
c1.name = "c1"
let c2 = c1
c2.name = "c2"

// c2 名字发生变化是c1会跟着变
print("\(c1.name)=\(c2.name)")


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
//p1.deallocate()

var p2 = UnsafeMutablePointer<MyStruct>(&myStruct)
p2.pointee.name = "p2"
print(p2.pointee.name)

//p2.deallocate()



