//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

extension UIView {
    @objc func toThemeStyle() -> Self {
        print("UIView toThemeStyle")
        for sub in self.subviews {
            sub.toThemeStyle()
        }
        return self
    }
}

extension UIButton {
     override func toThemeStyle() -> Self {
        print("UIButton toThemeStyle")
        self.setTitleColor(.red, for: .normal)
        return self
    }
}


let v = UIView()
let b = UIButton()

v.addSubview(b)
v.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
v.toThemeStyle().backgroundColor = .red

//b.toThemeStyle().setTitleColor(<#T##color: UIColor?##UIColor?#>, for: <#T##UIControl.State#>)
//
print(v.backgroundColor)


//MAKR: - defer

final class MyClass : NSObject {
    var _lock = NSRecursiveLock()
    func insert() {
        self._lock.lock()
        print("lock")
        
        defer {
            print("unlock")
            self._lock.unlock()
        }
        
        print("insert")
    }
}

MyClass.init().insert()

func test() {
    defer {
        // 无论是否catch到异常，都会执行defer跟的block
        print("finally")
    }
    do {
        print("do")
//        throw NSError()
    } catch {
        print("catch")
    }

}

test()
