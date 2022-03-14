//
//  Extensions.swift
//  MealPlan
//
//  Created by Christian Grinling on 28/10/2021.
//


import Foundation
import UIKit
import AVFoundation

extension UIView {
    
    func pinEdgesToSuperView() {
        guard let superView = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leftAnchor.constraint(equalTo: superView.leftAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        rightAnchor.constraint(equalTo: superView.rightAnchor).isActive = true
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, paddingTop: CGFloat, bottom: NSLayoutYAxisAnchor?, paddingBottom: CGFloat, left: NSLayoutXAxisAnchor?, paddingLeft: CGFloat, right: NSLayoutXAxisAnchor?, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
    translatesAutoresizingMaskIntoConstraints = false
        
    if let top = top {
    topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
    if let bottom = bottom {
    bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
    if let right = right {
    rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
    if let left = left {
    leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
    if width != 0 {
    widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
    if height != 0 {
    heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func SFSymbolFont(button: UIButton, symbol: String, size: CGFloat, colour: UIColor) {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: size, weight: .bold, scale: .large)
        let largeBoldDoc = UIImage(systemName: symbol, withConfiguration: largeConfig)?.withTintColor(colour).withRenderingMode(.alwaysOriginal)
        button.setImage(largeBoldDoc, for: .normal)
    }
}

extension UILabel {
    func layout(colour:UIColor, size: CGFloat, text: String, bold: Bool) {
        self.text = text
        self.textColor = colour
        if bold == true {
            self.font = UIFont.boldSystemFont(ofSize: size)
        }
        
        else {
            self.font = UIFont.systemFont(ofSize: size)
        }
        
    }
}


extension UIStackView {
    
    func layout(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution, alignment: UIStackView.Alignment, spacing: Int){
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = 10
    }

}

extension UIButton {
    
    
    func setsizedImage(symbol: String, size: CGFloat, colour: UIColor) {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: size, weight: .bold, scale: .large)
        let largeBoldDoc = UIImage(systemName: symbol, withConfiguration: largeConfig)?.withTintColor(colour).withRenderingMode(.alwaysOriginal)
        self.setImage(largeBoldDoc, for: .normal)
    }
    
    
    func layout(textcolour:UIColor?, backgroundColour:UIColor?, size: CGFloat?, text: String?, image: UIImage?, cornerRadius: CGFloat?) {
        setTitle(text, for: .normal)
        setTitleColor(textcolour, for: .normal)
        if let Size = size {
            titleLabel?.font = UIFont.boldSystemFont(ofSize: Size)
        }

        setImage(image, for: .normal)
        if let radius = cornerRadius {
        layer.cornerRadius = radius
        }
        layer.masksToBounds = true
        backgroundColor = backgroundColour
    
    }
    
    func setHighlighted() {
        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 0.38, green: 0.11, blue: 0.81, alpha: 1.00).cgColor
        setTitleColor(.black, for: .normal)
    }
    
    func setNormal() {
        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        backgroundColor = UIColor(red: 0.38, green: 0.11, blue: 0.81, alpha: 1.00)
        layer.borderWidth = 0
        layer.borderColor = nil
        setTitleColor(.white, for: .normal)
    }
}

extension UIViewController {
    
    func AlertofError(_ error:String, _ Message:String){
        let alertController = UIAlertController(title: "\(error)", message: "\(Message)", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func Alert(_ field:String){
       let alertController = UIAlertController(title: "\(field) Needed", message: "Please type in \(field)", preferredStyle: .alert)
       let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
       alertController.addAction(defaultAction)
       self.present(alertController, animated: true, completion: nil)
    }
}



extension UITextField {

    func addPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = UITextField.ViewMode.always
    }
    
    func layout(placeholder: String, backgroundcolour: UIColor, bordercolour: UIColor,borderWidth: CGFloat, cornerRadius: CGFloat) {
        self.placeholder = placeholder
        self.backgroundColor = backgroundcolour
        layer.borderColor = bordercolour.cgColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
}

var vSpinner : UIView?
extension UIViewController {
    
    
    func getTodaysDate() -> String {
        let date = Date()
        let dateFormatter  = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
    
    func getDayName() -> String {
            let df  = DateFormatter()
            df.dateFormat = "YYYY-MM-dd"
            let date = df.date(from: getTodaysDate())!
            df.dateFormat = "EEE"
            return df.string(from: date)
        }
    
    func getDate() -> String{
        let formatter : DateFormatter = DateFormatter()
         formatter.dateFormat = "d/M/yy"
         let myStr : String = formatter.string(from:   NSDate.init(timeIntervalSinceNow: 0) as Date)
        return myStr
    }
    
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }

}

class categoryButton : UIButton {

    required init(color: UIColor, titleString : String) {
        super.init(frame: .zero)
        setTitleColor(color, for: .normal)
        setTitle(titleString, for: .normal)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



