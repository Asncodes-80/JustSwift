//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Alireza Soltani Neshan on 4/20/1400 AP.
//

import UIKit


class ConvertViewController: UIViewController {
    
    @IBOutlet private var celsiusLabel: UILabel!
    @IBOutlet private var textField: UITextField!
    
    // Degree var
    private var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            willUpdateCelsius()
        }
    }
    private var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        textField.delegate = self
        
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
        
        willUpdateCelsius()
    }

    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        if let text = textField.text, !text.isEmpty, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(_ gestureDetector: UIGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    private func willUpdateCelsius() {
        let numberFormatter: NumberFormatter = {
            let nf = NumberFormatter()
            nf.numberStyle = .decimal
            nf.minimum = 0
            nf.maximum = 0.80
            return nf
        }()
        
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(<#Bool#>)
//        let colors: [UIColor] = [
//            .red,
//            .blue,
//            .magenta,
//            .green,
//            .cyan,
//            .darkGray,
//            .purple
//        ]
//
//        let randomN: Int = Int.random(in: 0...6)
//        view.backgroundColor = colors[randomN]
//    }
}

// Related function for Step 2:
//private func gradientLayer(colors: [CGColor], view: UIView) {
//    let gradientLayer = CAGradientLayer()
//    gradientLayer.colors = colors
//    gradientLayer.frame = view.bounds
//    view.layer.insertSublayer(gradientLayer, at: 0)
//}


extension UIViewController: UITextFieldDelegate {
    // Prevent from multiple dot for decimal
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let existingInTextFiled = textField.text?.range(of: ".")
        let exitingInString = string.range(of: ".")
        let existingAlphabetCharacter = string.rangeOfCharacter(from: CharacterSet.letters)
        
        if existingInTextFiled != nil, exitingInString != nil {
            return false
        } else {
            if  existingAlphabetCharacter != nil {
                return false
            } else {
                return true
            }
        }
    }
}
