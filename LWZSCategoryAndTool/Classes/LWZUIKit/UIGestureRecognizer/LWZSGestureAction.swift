//
//  LWZSGestureAction.swift
//  LWZSCategoryAndTool
//
//  Created by admin on 2019/11/6.
//

import UIKit

class LWZSGestureAction <T: UIGestureRecognizer> {

    public typealias GestureRecognizer = (_ gestureRecognizer: T) -> Void

    private var beginHandler: GestureRecognizer? = nil
    private var cancelledHandler: GestureRecognizer? = nil
    private var changeHandler: GestureRecognizer? = nil
    private var endedHandler: GestureRecognizer? = nil
    private var failedHandler: GestureRecognizer? = nil
    
    
    
    @objc public func gestureRecognizer(gesture: UIGestureRecognizer) {
        switch gesture.state {
        case .began:
            beginHandler?(gesture as! T)
        case .cancelled:
            cancelledHandler?(gesture as! T)
        case .changed:
            changeHandler?(gesture as! T)
        case .ended:
            endedHandler?(gesture as! T)
        case .failed:
            failedHandler?(gesture as! T)
        case .possible:
            break
        }
    }
    
    
    
}
