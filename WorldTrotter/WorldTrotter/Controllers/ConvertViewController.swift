//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Alireza Soltani Neshan on 4/20/1400 AP.
//

import UIKit

class ConvertViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Step 1:
        // UIWindow -> UI View(UIButton, UILable, UITextField, etc...) -> UIElements
        // CGRect as frame -> create UIView from the frame -> add UIView to subviews

        // 1.At frist create a frame for our object (frame with CGRect)
        // 2.Create a UIView from our frame
        // 3.Put custom properties for UIView
        // 4.Add custom UIView to Subview of the View
//        let firstFrame: CGRect = CGRect(x: 160, y: 240, width: 100, height: 150)
//        let firstView: UIView  = UIView(frame: firstFrame)
//        firstView.backgroundColor = .blue
//
//        let secondFrame: CGRect = CGRect(x: 10, y: 100, width: 100, height: 30)
//        let secondView: UIView = UIView(frame: secondFrame)
//        secondView.backgroundColor = .green
//
//        view.addSubview(firstView)
////        view.addSubview(secondView)
//        firstView.addSubview(secondView)
        
//        Step 2:
//        gradientLayer(colors: colors, view: view)
//        // make our frame
//        //  ------
//        // |      |
//        // |      |
//        //  ------
//        let qFrame: CGRect = CGRect(x: 30, y: 50, width: 100, height: 100)
//        let qView: UIView = UIView(frame: qFrame)
////        qView.backgroundColor = .red
//        let grLayer = CAGradientLayer()
//        grLayer.colors = colors
//        grLayer.frame = qView.bounds
//        qView.layer.insertSublayer(grLayer, at: 0)
//        view.addSubview(qView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(<#Bool#>)
        let colors: [UIColor] = [
            .red,
            .blue,
            .magenta,
            .green,
            .cyan,
            .darkGray,
            .purple
        ]
        
        let randomN: Int = Int.random(in: 0...6)
        view.backgroundColor = colors[randomN]
    }
}

// Related function for Step 2:
//private func gradientLayer(colors: [CGColor], view: UIView) {
//    let gradientLayer = CAGradientLayer()
//    gradientLayer.colors = colors
//    gradientLayer.frame = view.bounds
//    view.layer.insertSublayer(gradientLayer, at: 0)
//}


