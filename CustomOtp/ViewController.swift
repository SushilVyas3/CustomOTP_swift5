//
//  ViewController.swift
//  CustomOtp
//
//  Created by Mac on 20/08/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController,customOtpDelegate {
    func textFieldDidEnterOtp(otpStr: String) {
        print("------------\(otpStr)")
    }
    

    @IBOutlet weak var otpView: CustomOtpView!
    override func viewDidLoad() {
        super.viewDidLoad()
        otpView.numberOfVelueInOTP(count: 5, spacingBetweenOTP: 20, txtColor: UIColor.black,
                                   isSetUnderLine: false, txtFildFont: UIFont.systemFont(ofSize: 20))
        otpView.changeUnderLineColor = UIColor.green;
        otpView.borderWidthOTP = 1.0
        otpView.borderColorOTP = UIColor.blue
        otpView.OTPbackGroundColor = UIColor.white
        otpView.setShadowOnTextField(shadowColorText: UIColor.gray, shodowOffsetWidth: 5.0, shadowOffsetHight: 5.0, shadowOpacityTxt: 0.7, shadowRadius: 2.0)
        otpView.otpDelegate = (self as customOtpDelegate)
        
        
    }
    @IBAction func ver(_ sender: Any) {
        
    }
   
    
}

