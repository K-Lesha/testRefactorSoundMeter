//
//  File.swift
//  
//
//  Created by ankudinov aleksandr on 24.06.2024.
//

import Foundation
import SwiftUI
import UIKit

public protocol Slide{
     var picture: UIImage {get set}
     var text:String  {get set}
     var buttonText:String  {get set}
     var description:String?  {get set}
}

public struct TutorialSlide:Slide {
    
    public init(picture: UIImage, text: String, buttonText: String = "CONTINUE", description:String? = nil) {
        self.picture = picture
        self.text = text
        self.buttonText = buttonText
        self.description = description
    }
    
    public var picture: UIImage
    public var text: String
    public var buttonText:String = "CONTINUE"
    
    public var closeAvailable:Bool?
    
    public var description: String?
}

public struct PaymentSlide:Slide {
    public var description: String?
    
    public init(picture: UIImage, text: String, buttonText: String = "CONTINUE", description: String?, closeAvailable: Bool?) {
        self.picture = picture
        self.text = text
        self.buttonText = buttonText
        self.description = description
        self.closeAvailable = closeAvailable
    }
    
    public var picture: UIImage
    public var text: String
    public var buttonText:String
    
    public var closeAvailable:Bool?
}

public struct SimpleConfig {
    public var runLimit:Int = 10
    public var rateTimer:TimeInterval = 0
    public  var closeAvailable:Bool = true
    public var appid:String = ""
    @AppStorage("runCount") public var runCount:Int = 0
    @AppStorage("onboardingComplete")  public var onboardingComplete:Bool = false
    
}

public struct UIConfig {
    public var slides:[Slide] = []
    public var features:[String] = []
    public var privacyLing:String = "https://www.apple.com/legal/privacy/pdfs/apple-privacy-policy-en-ww.pdf"
    public var termsLing:String  =  "https://www.apple.com/uk/legal/internet-services/itunes/uk/terms.html"
    public var siteLing:String = "https://www.apple.com"
    public var payInfo:String = ""
    public var backgroundColor:Color = .gray
    public var backgroundStyle:UIBlurEffect.Style = .light
    public var foreground:Color = .white
    public var secondaryForeground:Color = .gray
    public var buttonBackground:Color = .blue
    public var unlockIcon:UIImage? = UIImage(systemName: "figure.mind.and.body")
}
