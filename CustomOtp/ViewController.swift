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
        otpView.numberOfVelueInOTP(count: 5, spacingBetweenOTP: 20,txtColor: UIColor.white, fontStyle:UIFont.systemFont(ofSize: 20))
        otpView.backgroundColorWithTransprantColor(r: 0.0/255.0, g: 0.0/255.0, b: 0.0/255.0, opecity: 0.8)
       otpView.borderWidthOTP = 1.0
       otpView.borderColorOTP = UIColor.black
//        otpView.setTextfieldBottomLineWithColor(color: UIColor.green)
        otpView.otpDelegate = (self as customOtpDelegate)
        
        
    }
    @IBAction func ver(_ sender: Any) {
        
    }
   
    
}

