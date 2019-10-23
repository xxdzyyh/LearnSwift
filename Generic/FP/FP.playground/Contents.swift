import UIKit

// 判断一个Point是不是在圆心为(0,0)半径为r的圆上
func inRanage(target: CGPoint,range:CGFloat) -> Bool {
    return sqrt(target.x*target.x+target.y*target.y) <= range
}


