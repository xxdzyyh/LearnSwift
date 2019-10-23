import UIKit

func swap<T>(a:inout T,b:inout T) {
    let tmp = a
    a = b
    b = tmp
}

var a = 8;
var b = 16;

swap(&a, &b)

func printHash<T:Hashable>(a:T) {
    print(a.hashValue)
}

func printObject<T:NSObject>(obj:T) {
    print(obj.description)
}

func printObject(obj:NSObject) {
    print(obj.description)
}


print(a)
print(b)

