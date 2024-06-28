//
// THIS APPLICATION WAS DEVELOPED BY IURII DOLOTOV
//
// IF YOU HAVE ANY QUESTIONS PLEASE DO NOT TO HESITATE TO CONTACT ME VIA MARKETPLACE OR EMAIL: utilityman.development@gmail.com
//
// THE AUTHOR REMAINS ALL RIGHTS TO THE PROJECT
//
// THE ILLEGAL DISTRIBUTION IS PROHIBITED
//

import Foundation
import UIKit

extension UIView {
    func addVerticalGradientLayer(topColor:UIColor, bottomColor:UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [
            topColor.cgColor,
            bottomColor.cgColor
        ]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        self.layer.insertSublayer(gradient, at: 0)
    }
}
