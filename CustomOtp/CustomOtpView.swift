//
//  CustomOtpView.swift
//  CustomOtp
//
//  Created by Mac on 20/08/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

public protocol customOtpDelegate: class {
    func textFieldDidEnterOtp(otpStr: String)
}
class CustomOtpView: UIView, UITextFieldDelegate {
   public weak var otpDelegate: customOtpDelegate?
    var numberOfInput = 1
    var nextTag = 1
    var mainView = UIStackView()
    var bView = UIStackView()
    var aView = UIStackView()
    var underLineColor = UIColor()
    var isSetshadow = Bool()
    private var otpInputStr = String()
    var textFieldsArr = [UITextField]()
    
    var borderWidthOTP: CGFloat = 0.0 {
        
        didSet {
            for txtFld in aView.subviews{
            txtFld.layer.borderWidth = borderWidthOTP
                }
        }
    }
    /// Discripation : use when show border colr
    var borderColorOTP: UIColor = UIColor.clear {
        
        didSet {
            for txtFld in aView.subviews {
                txtFld.layer.borderColor = borderColorOTP.cgColor
            }
        }
    }
    
    var OTPbackGroundColor: UIColor = UIColor.clear{
        didSet {
            underLineColor = OTPbackGroundColor
            for txtFld in aView.subviews {
             txtFld.backgroundColor = OTPbackGroundColor
            }
        }
    }
    var changeUnderLineColor: UIColor = UIColor.clear{
        didSet {
            for lbl in bView.subviews{
                lbl.backgroundColor = changeUnderLineColor
            }
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
            tf.clipsToBounds = false
            tf.layer.backgroundColor = underLineColor.cgColor
            tf.layer.masksToBounds = false
            tf.layer.shadowColor = shadowColorText.cgColor
            tf.layer.shadowOffset = CGSize(width: shodowOffsetWidth, height: shadowOffsetHight)
            tf.layer.shadowOpacity = shadowOpacityTxt
            tf.layer.shadowRadius = shadowRadius
        }
    }
    /// Discripation : use when show border width
    
    /// this function use for how many count of otp fields are creat
    ///
    /// - Parameters:
    ///   - count: total number of count of otp
    ///   - spacingBetweenOTP: space between textField
    ///   - txtColor: input text Color
    ///   - fontStyle: textfield font
    
    
    func numberOfVelueInOTP(count: Int, spacingBetweenOTP: CGFloat,
                            txtColor: UIColor, isSetUnderLine: Bool, txtFildFont: UIFont) {
        numberOfInput = count
        self .addSubview(mainView)
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraint(NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: mainView,
                                              attribute: .top, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: mainView,
                                              attribute: .leading, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: mainView,
                                              attribute: .trailing, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: mainView,
                                              attribute: .bottom, multiplier: 1.0, constant: 0.0))
        mainView.alignment = .fill
        mainView.distribution = .fillProportionally
        mainView.axis = .vertical
        mainView.spacing = 0.0
        
        mainView.addArrangedSubview(aView)
        
        aView.alignment = .fill
        aView.distribution = .fillEqually
        aView.axis = .horizontal
        aView.spacing = spacingBetweenOTP
        if isSetUnderLine == true{
       mainView.addArrangedSubview(bView)
       bView.translatesAutoresizingMaskIntoConstraints = false
       bView.addConstraint(NSLayoutConstraint(item: bView, attribute: .height, relatedBy: .equal, toItem: nil,
                                                 attribute: .height, multiplier: 1.0, constant: 2.0))
        
        bView.alignment = .fill
        bView.distribution = .fillEqually
        bView.axis = .horizontal
        bView.spacing = spacingBetweenOTP
        }
       
        for index in 1...count {
          let coTextFld = UITextField()
            coTextFld.textAlignment = .center
            coTextFld.delegate = self
            coTextFld.tag = index
            coTextFld.keyboardType = .numberPad
            coTextFld.borderStyle = .none
            coTextFld.textColor = txtColor
            coTextFld.textContentType = .oneTimeCode
            coTextFld.font = txtFildFont
            coTextFld.addTarget(self, action: #selector(changeText(sender:)), for: .editingChanged)
            textFieldsArr.append(coTextFld)
            
            let botamLine = UILabel()
            botamLine.backgroundColor = UIColor.black
            aView .addArrangedSubview(coTextFld)
            bView .addArrangedSubview(botamLine)

        }
        
    }
   
    @objc func changeText (sender: UITextField) {
        if sender.text?.count == numberOfInput {
            setTextFieldAllValue(textFld: sender);
        } else {
           
            enterinNexttextField(textFld: sender)
        }
        if otpInputStr.count == numberOfInput {
            otpDelegate?.textFieldDidEnterOtp(otpStr: otpInputStr)
        } else {
            otpDelegate?.textFieldDidEnterOtp(otpStr: "Please enter all otp Fields")
        }
    }
    
    func setTextFieldAllValue (textFld: UITextField) {
        if let strChr = textFld.text {
            let charactors = Array(strChr)
            print(charactors)
            for index in 0..<charactors.count {
                if let tField  = self.viewWithTag(index+1) as? UITextField {
                    tField.text = "\(charactors[index])"
                }
            }
            otpInputStr = strChr.replacingOccurrences(of: " ", with: "")
            textFld.resignFirstResponder()
        }
    }
    
    func enterinNexttextField (textFld: UITextField) {
        nextTag = textFld.tag
        if textFld.tag <= numberOfInput {
            if textFld.text?.count ?? 0 > 0 {
                nextTag += 1
                
            }
            if let char = textFld.text?.cString(using: String.Encoding.utf8) {
                let isBackSpace = strcmp(char, "\\b")
                if isBackSpace == -92 {
                    print("Backspace was pressed")
                    nextTag -= 1
                }
            }
            let nextResponder = textFld.superview?.viewWithTag(nextTag) as UIResponder?
            if nextResponder != nil {
                // Found next responder, so set it
                otpInputStr = ""
                nextResponder?.becomeFirstResponder()
            } else {
                // Not found, so remove keyboard
                var arr = [String]()
                for txtf in textFieldsArr {
                    arr .append(txtf.text ?? "")
                }
                let otpStr = arr.joined(separator: "")
                //                   let trimmed = otpStr.trimmingCharacters(in: .whitespacesAndNewlines)
                otpInputStr = otpStr.replacingOccurrences(of: " ", with: "")
                textFld.resignFirstResponder()
                
            }
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        nextTag = textField.tag
        if textField.text?.count ?? 0 > 0 {
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
