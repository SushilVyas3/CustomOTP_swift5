# CustomOTP_swift5
when user need insert OTP and handling the OTP.


1. first in story board view controller add a view where use OTP

2. View Class set CustomOtpView (follow image https://github.com/SushilVyas3/CustomOtp/issues/1#issue-485625269)

3. first create iboutlet otp view to get instanse function in your class

4. on view did load call following function for set up opt count 


//////////////////////// otp view is a outlet of custom class CustomOtpView////////////////////
/// - Parameters:
///   - count: total number of count of otp
///   - spacingBetweenOTP: space between textField
///   - txtColor: input text Color
///   - fontStyle: textfield font style
otpView.numberOfVelueInOTP(count: 5, spacingBetweenOTP: 20,txtColor: UIColor.green, fontStyle:UIFont.systemFont(ofSize: 20))

5. For text field border width and border color create a var to set border width an
-otpView.borderWidthOTP = 1.0
-otpView.borderColorOTP = UIColor.black


6. For textfield background color 
otpView.backgroundColorWithTransprantColor(r: 110.0/255.0, g: 158/255.0, b: 255.0/255.0, opecity: 0.8)

7. when use UnderLine type textField then use (5 and 6 point not use)
otpView.setTextfieldBottomLineWithColor(color: UIColor.green)

8. import custome delegate customOtpDelegate on your view controller to find otp string (call following function in your view controller)
/// create a delegat when otp is enter
///
/// - Parameter otpStr: give error msg when otp field not full fill when all otp are enter the shwo otp str
func textFieldDidEnterOtp(otpStr:String)
