//
//  ViewController.swift
//  LayerAnimation
//
//  Created by Ashis Laha on 09/12/17.
//  Copyright © 2017 Ashis Laha. All rights reserved.
//

import UIKit

// Controller
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
    }

    private let myView : MyView = {
        let view = MyView()
        view.translatesAutoresizingMaskIntoConstraints = false // enable auto layout
        view.backgroundColor = .red
        return view
    }() // execute closure
    
    private func addView() {
        view.addSubview(myView)
        
        NSLayoutConstraint.activate([
             myView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), // leading
             myView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), // top
             myView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.2), // width = 20 % of view width
             myView.heightAnchor.constraint(equalTo: myView.widthAnchor, multiplier: 1.0) // height = width
            ])
    }
}

// View
class MyView : UIView {
    
    // draw view
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    // layerClass
    public override class var layerClass: Swift.AnyClass {
        return CoordLayer.self
    }
}

// Layer
class CoordLayer : CALayer {
    
    override func display() {
        // some custom operations
        backgroundColor = UIColor.red.cgColor // to visualize
        customAnimation() // add animation
        print("Display")
    }
    
    override class func needsDisplay(forKey key: String) -> Bool {
        if key == "transform.translation.x" {
             return true
        }
       return super.needsDisplay(forKey: key)
    }
    
    // add animation
    private func customAnimation() {
        let values = [100,150,200,250]
        let times : [NSNumber] = [0.0, 0.25, 0.5, 1.0] // not necessary always
        
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x") // moving view along x direction
        animation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)]  // array of timing function
        animation.values = values // taking the animated property values for animation
        animation.keyTimes = times // define the timing array
        animation.duration = 5.0 // CFTimeInterval
        animation.isRemovedOnCompletion = false // do not remove the animation effect, no state changes.
        animation.fillMode = kCAFillModeForwards
        animation.delegate = self
        
        // add animation on coordLayer
        self.add(animation, forKey: "animation")
    }
}

extension CoordLayer : CAAnimationDelegate {
    func animationDidStart(_ anim: CAAnimation) {
        print("Animation started")
    }
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print("Animation stopped")
    }
}

