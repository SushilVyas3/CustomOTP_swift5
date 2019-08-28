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
        otpView.numberOfVelueInOTP(count: 5, spacingBetweenOTP: 20,txtColor: UIColor.black, fontStyle:UIFont.systemFont(ofSize: 20), isSequretext: true)
        otpView.backgroundColorWithTransprantColor(r: 110.0/255.0, g: 120.0/255.0, b: 130.0/255.0, opecity: 1.0)
        otpView.setShadowOnTextField(shadowColorText: UIColor.gray, shodowOffsetWidth: 5, shadowOffsetHight: 5, shadowOpacityTxt: 0.7, shadowRadius: 2)
       otpView.borderWidthOTP = 1.0
       otpView.borderColorOTP = UIColor.black
//        otpView.setTextfieldBottomLineWithColor(color: UIColor.black, mainViewBackgroundColor:  UIColor(red: 237.0/255.0, green: 228.0/255.0, blue: 171.0/255.0, alpha: 1.0))
        otpView.otpDelegate = (self as customOtpDelegate)
        
        
    }
    @IBAction func ver(_ sender: Any) {
        
    }
   
    
}

