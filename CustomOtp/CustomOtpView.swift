//
//  CustomOtpView.swift
//  CustomOtp
//
//  Created by Mac on 20/08/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

public protocol customOtpDelegate {
    func textFieldDidEnterOtp(otpStr:String)
}
class CustomOtpView: UIView,UITextFieldDelegate {
   public var otpDelegate : customOtpDelegate?
    var numberOfInput = 1
    var nextTag = 1
    var aView = UIStackView()
    var underLineColor = UIColor()
    var isSetshadow = Bool()
    private var otpInputStr = String()
    var textFieldsArr = [UITextField]()
    /// Discripation : use when show border width
    var borderWidthOTP: CGFloat = 0.0{
        
        didSet{
            for tf in aView.subviews{
                tf.layer.borderWidth = borderWidthOTP
            }
        }
    }
    /// Discripation : use when show border colr
    var borderColorOTP: UIColor = UIColor.clear {
        
        didSet {

            for tf in aView.subviews{
                tf.layer.borderColor = borderColorOTP.cgColor
            }
        }
    }
    

    /// set underline on textField
    ///
    /// - Parameters:
    ///   - color: underline color
    ///   - mainViewBackgroundColor: superview background color
    func setTextfieldBottomLineWithColor(color: UIColor, mainViewBackgroundColor: UIColor){
        isSetshadow = false
        underLineColor = color
        for tf in aView.subviews{
        tf.layer.backgroundColor = mainViewBackgroundColor.cgColor
        tf.layer.masksToBounds = false
        tf.layer.shadowColor = color.cgColor
        tf.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        tf.layer.shadowOpacity = 1.0
        tf.layer.shadowRadius = 0.0
        }
    }
    
    /// set shadow on textfield
    ///
    /// - Parameters:
    ///   - shadowColorText: color on shadow
    ///   - shodowOffsetWidth: width of shadow
    ///   - shadowOffsetHight: hight of shadow
    ///   - shadowOpacityTxt: shadow opacity
    ///   - shadowRadius: shadow radius
    func setShadowOnTextField(shadowColorText: UIColor, shodowOffsetWidth: CGFloat, shadowOffsetHight: CGFloat, shadowOpacityTxt: Float, shadowRadius: CGFloat) {
        isSetshadow = true
        for tf in aView.subviews{
            tf.layer.backgroundColor = UIColor.clear.cgColor
            tf.layer.masksToBounds = false
            tf.layer.shadowColor = shadowColorText.cgColor
            tf.layer.shadowOffset = CGSize(width: shodowOffsetWidth, height: shadowOffsetHight)
            tf.layer.shadowOpacity = shadowOpacityTxt
            tf.layer.shadowRadius = shadowRadius
        }
    }
    /// back ground color of textfield using for otp
    ///
    /// - Parameters:
    ///   - r: red color
    ///   - g: green color
    ///   - b: blue color
    ///   - opecity: opecity
    func backgroundColorWithTransprantColor(r:CGFloat,g:CGFloat,b:CGFloat,opecity:CGFloat){
        for tf in aView.subviews{
            tf.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: opecity)
        }
    }
    /// this function use for how many count of otp fields are creat
    ///
    /// - Parameters:
    ///   - count: total number of count of otp
    ///   - spacingBetweenOTP: space between textField
    ///   - txtColor: input text Color
    ///   - fontStyle: textfield font
    func numberOfVelueInOTP(count:Int, spacingBetweenOTP:CGFloat, txtColor:UIColor, fontStyle:UIFont){
        numberOfInput = count
        self .addSubview(aView)
        
        aView.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraint(NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: aView, attribute: .top, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: aView, attribute: .leading, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: aView, attribute: .trailing, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: aView, attribute: .bottom, multiplier: 1.0, constant: 0.0))

        
        aView.alignment = .fill
        aView.distribution = .fillEqually
        aView.axis = .horizontal
        aView.spacing = spacingBetweenOTP
       
        for index in 1...count{
          let textFld = UITextField()
            textFld.textAlignment = .center
            textFld.delegate = self
            textFld.tag = index
            textFld.keyboardType = .numberPad
            textFld.borderStyle = .none
            textFld.textColor = txtColor
            textFld.font = fontStyle
            textFld.backgroundColor = UIColor.clear
            textFld.addTarget(self, action: #selector(changeText(sender:)), for: .editingChanged)
            textFieldsArr.append(textFld)
            aView .addArrangedSubview(textFld)
            
        }
        
    }

    
    @objc func changeText (sender : UITextField) {
        nextTag = sender.tag
            if sender.tag <= numberOfInput {
                if(sender.text?.count ?? 0 > 0){
                    nextTag += 1
                    
                }
                if let char = sender.text?.cString(using: String.Encoding.utf8) {
                    let isBackSpace = strcmp(char, "\\b")
                    if (isBackSpace == -92) {
                        print("Backspace was pressed")
                        nextTag -= 1
                    }
                }
                let nextResponder = sender.superview?.viewWithTag(nextTag) as UIResponder?
                if nextResponder != nil {
                    // Found next responder, so set it
                    otpInputStr = ""
                    nextResponder?.becomeFirstResponder()
                } else {
                    // Not found, so remove keyboard
                    var arr = [String]()
                    for tf in textFieldsArr{
                        arr .append(tf.text ?? "")
                    }
                    let otpStr = arr.joined(separator: "")
//                   let trimmed = otpStr.trimmingCharacters(in: .whitespacesAndNewlines)
                    otpInputStr = otpStr.replacingOccurrences(of: " ", with: "")
                    sender.resignFirstResponder()
                    
                }
//                if isSetshadow == false {
//                    if sender.text!.isEmpty || sender.text == " "{
//                        sender.layer.shadowColor = underLineColor.cgColor
//                    }else{
//                       sender.layer.shadowColor = UIColor.clear.cgColor
//                    }
//                }
            }
        if otpInputStr.count == numberOfInput {
            otpDelegate?.textFieldDidEnterOtp(otpStr: otpInputStr)
        }else{
            otpDelegate?.textFieldDidEnterOtp(otpStr: "Please enter all otp Fields")
        }
    }
    
   
   
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        nextTag = textField.tag
        if(textField.text?.count ?? 0 > 0){
             textField.text = " "
            
        }
        return true
    }
    
   
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
}

