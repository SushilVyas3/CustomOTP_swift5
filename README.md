# CustomOTP_swift5
when user need insert OTP and handling the OTP.


1. first in story board view controller add a view where use OTP

2. View Class set CustomOtpView 
![gitHubSetUpIMg](https://user-images.githubusercontent.com/23329039/63775225-862e3600-c8fc-11e9-9aa2-480bd8da65ca.png)

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
New commit _ add shadow on txt
/// set shadow on textfield
///
/// - Parameters:
///   - shadowColorText: color on shadow
///   - shodowOffsetWidth: width of shadow
///   - shadowOffsetHight: hight of shadow
///   - shadowOpacityTxt: shadow opacity
///   - shadowRadius: shadow radius
func setShadowOnTextField(shadowColorText: UIColor, shodowOffsetWidth: CGFloat, shadowOffsetHight: CGFloat, shadowOpacityTxt: Float, shadowRadius: CGFloat)
/// create a delegat when otp is enter
///
/// - Parameter otpStr: give error msg when otp field not full fill when all otp are enter the shwo otp str
func textFieldDidEnterOtp(otpStr:String)

some screen demo

![boxType](https://user-images.githubusercontent.com/23329039/63853266-e0d89800-c9b7-11e9-9e15-1b3829f42166.gif)

![underlineType](https://user-images.githubusercontent.com/23329039/63853338-0bc2ec00-c9b8-11e9-912f-8b0a98d62f2a.gif)
