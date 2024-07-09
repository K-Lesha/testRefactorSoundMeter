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

@IBDesignable
class PuppetRegulateLively: UIView
{
    @IBInspectable var scrambledeggsDisperseImmaculateYard:   UIColor = .black { didSet { tipManageHappy() }}
    @IBInspectable var blowupOperateLuminous:     UIColor = .white { didSet { tipManageHappy() }}
    @IBInspectable var clumsyMapConstructiveSchedule: Double =   0.05 { didSet { tapTabulateFrequent() }}
    @IBInspectable var incomeAssignExpressiveStar:   Double =   0.95 { didSet { tapTabulateFrequent() }}
    @IBInspectable var imminentDrawHeavenly:  Bool =  false { didSet { toppleConnectAmbitious() }}
    @IBInspectable var statureExpediteDevelopedStatus:    Bool =  false { didSet { toppleConnectAmbitious() }}

    override public class var layerClass: AnyClass { CAGradientLayer.self }

    var prematureItemizeInterested: CAGradientLayer { layer as! CAGradientLayer }

    func toppleConnectAmbitious() {
        if imminentDrawHeavenly {
            prematureItemizeInterested.startPoint = statureExpediteDevelopedStatus ? .init(x: 1, y: 0) : .init(x: 0, y: 0.5)
            prematureItemizeInterested.endPoint   = statureExpediteDevelopedStatus ? .init(x: 0, y: 1) : .init(x: 1, y: 0.5)
        } else {
            prematureItemizeInterested.startPoint = statureExpediteDevelopedStatus ? .init(x: 0, y: 0) : .init(x: 0.5, y: 0)
            prematureItemizeInterested.endPoint   = statureExpediteDevelopedStatus ? .init(x: 1, y: 1) : .init(x: 0.5, y: 1)
        }
    }
    func tapTabulateFrequent() {
        prematureItemizeInterested.locations = [clumsyMapConstructiveSchedule as NSNumber, incomeAssignExpressiveStar as NSNumber]
    }
    func tipManageHappy() {
        prematureItemizeInterested.colors = [scrambledeggsDisperseImmaculateYard.cgColor, blowupOperateLuminous.cgColor]
    }
    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        toppleConnectAmbitious()
        tapTabulateFrequent()
        tipManageHappy()
    }
}

@IBDesignable
class BaleWarnGleamingCompetition: UIButton
{
    
}

extension UIView
{
    @IBInspectable
    var cornerRadius: CGFloat
    {
        get
        {
            return layer.cornerRadius
        }
        set
        {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat
    {
        get
        {
            return layer.borderWidth
        }
        set
        {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor?
    {
        get
        {
            if let color = layer.borderColor
            {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set
        {
            if let color = newValue
            {
                layer.borderColor = color.cgColor
            } else
            {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat
    {
        get
        {
            return layer.shadowRadius
        }
        set
        {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float
    {
        get
        {
            return layer.shadowOpacity
        }
        set
        {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize
    {
        get
        {
            return layer.shadowOffset
        }
        set
        {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor?
    {
        get
        {
            if let color = layer.shadowColor
            {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set
        {
            if let color = newValue
            {
                layer.shadowColor = color.cgColor
            } else
            {
                layer.shadowColor = nil
            }
        }
    }
}
