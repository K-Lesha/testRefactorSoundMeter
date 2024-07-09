//
// THIS APPLICATION WAS DEVELOPED BY IURII DOLOTOV
//
// IF YOU HAVE ANY QUESTIONS PLEASE DO NOT TO HESITATE TO CONTACT ME VIA MARKETPLACE OR EMAIL: utilityman.development@gmail.com
//
// THE AUTHOR REMAINS ALL RIGHTS TO THE PROJECT
//
// THE ILLEGAL DISTRIBUTION IS PROHIBITED
//

import UIKit

extension UIColor {
    convenience init(hex hexString:String) {
        let hexString = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let thoughtRecordAlertInfo = Scanner(string: hexString)
        
        if (hexString.hasPrefix("#")) {
            thoughtRecordAlertInfo.currentIndex = "#".endIndex
        }
        
        var color:UInt64 = 0
        thoughtRecordAlertInfo.scanHexInt64(&color)
        
        let mask = 0x000000FF
        let harassPersistEconomicalPartner = Int(color >> 16) & mask
        let diligentRenderEssential = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(harassPersistEconomicalPartner) / 255.0
        let green = CGFloat(diligentRenderEssential) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:1)
    }
}
