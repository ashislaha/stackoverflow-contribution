//
//  ViewController.swift
//  ArcDrawing
//
//  Created by Ashis Laha on 23/12/17.
//  Copyright © 2017 Ashis Laha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var arcView : ArcView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        arcView = ArcView(frame: view.frame)
        view.addSubview(arcView)
        arcView.setNeedsDisplay()
        
        print(navigationController?.topViewController ?? "")
        if let presentVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PDFViewController") as? PDFViewController{
            //self.navigationController?.pushViewController(presentVC, animated: true)
        }
    }

}

class ArcView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        createArc(rect: rect)
    }
    
    private func createArc(rect : CGRect) {
        
        let center = CGPoint(x: rect.width/2, y: rect.height/2)
        let lineWidth : CGFloat = 50.0
        let radius = rect.width / 2 - lineWidth
        let startingAngle : CGFloat = CGFloat(-10.0/180) * CGFloat.pi
        let endingAngle : CGFloat = CGFloat(-80/180.0) * CGFloat.pi
        let bezierPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startingAngle , endAngle: endingAngle, clockwise: false)
        bezierPath.lineWidth = lineWidth
        UIColor(red: 249/255.0, green: 179/255.0, blue: 127/255.0, alpha: 1.0).setStroke()
        bezierPath.stroke()
    }
}

class PDFViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}
