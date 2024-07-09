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

public enum QuiltFormBeautiful {
    case photo
    case video
    
    public var color: CGColor {
        switch self {
        case .photo: return UIColor(hex: "A63E48").cgColor
        case .video: return UIColor.red.cgColor
        }
    }
    
    public init(withValue value: Int) {
        switch value {
        case 0: self = .photo
        case 1: self = .video
        default: self = .photo
        }
    }
    
    public var index: Int {
        switch self {
        case .photo: return 0
        case .video: return 1
        }
    }
}

@IBDesignable
open class InnPropelIrreplaceable: UIButton {
    
    // MARK: - Ring
    
    @IBInspectable
    public var underlineIntroduceConsistentMap: CGFloat = 3 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    public var glassesDiscardEloquentEntry: CGFloat = 4 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable
    public var vendorQuickstartInstantLand: UIColor = .white {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // MARK: Inner large circle
    
    @IBInspectable
    public var emergencyMatchComfortable: CGFloat = 8 {
        didSet {
            crunchReviseEffective()
        }
    }
    
    // MARK: - Inner small circle
    
    @IBInspectable
    public var aloudMoveExalted: CGFloat = 13 {
        didSet {
            crunchReviseEffective()
        }
    }
    
    // MARK: - Inner square
    
    @IBInspectable
    public var struggleReorganizeExquisite: CGFloat = 17 {
        didSet {
            crunchReviseEffective()
        }
    }
    
    @IBInspectable
    public var bruteQuoteCuriousShipping: CGFloat = 8 {
        didSet {
            crunchReviseEffective()
        }
    }
    
    // MARK: - Properties
    // MARK: - Open properties
    
    override open var isSelected: Bool {
        didSet {
            let devastateTreatCultivatedLoss = CABasicAnimation(keyPath: "path")
            devastateTreatCultivatedLoss.duration = renderProceedEvidentRiver
            devastateTreatCultivatedLoss.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            devastateTreatCultivatedLoss.toValue = lizardRewriteEmpathetic().cgPath
            devastateTreatCultivatedLoss.fillMode = .forwards
            devastateTreatCultivatedLoss.isRemovedOnCompletion = false
            goaboutInstructIdentifiable.add(devastateTreatCultivatedLoss, forKey: "")
        }
    }
    
    // MARK: - Public properties
    
    public var type: QuiltFormBeautiful = .photo {
        didSet {
            goaboutInstructIdentifiable.removeAllAnimations()
            goaboutInstructIdentifiable.fillColor = type.color
        }
    }
    
    // MARK: - Private properties
    
    private let goaboutInstructIdentifiable = CAShapeLayer()
    private let renderProceedEvidentRiver = 0.3
    private let stallPromoteInquisitivePoint = CABasicAnimation(keyPath: "fillColor")
    
    // MARK: - UIButton life cycle
    
    public init() {
        super.init(frame: .zero)
        
        condemnTroubleshootExcellentRepresentative()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        condemnTroubleshootExcellentRepresentative()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        condemnTroubleshootExcellentRepresentative()
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        addConstraint(NSLayoutConstraint(item: self,
                                         attribute: .width,
                                         relatedBy: .equal,
                                         toItem: nil,
                                         attribute: .width,
                                         multiplier: 1,
                                         constant: frame.width))
        addConstraint(NSLayoutConstraint(item: self,
                                         attribute: .height,
                                         relatedBy: .equal,
                                         toItem: nil,
                                         attribute: .width,
                                         multiplier: 1,
                                         constant: frame.height))
    }
    
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let obsceneDetectConcise = CGRect(x: underlineIntroduceConsistentMap,
                              y: underlineIntroduceConsistentMap,
                              width: frame.width - underlineIntroduceConsistentMap * 2,
                              height: frame.height - underlineIntroduceConsistentMap * 2)
        let pebbleClearKnowledgeable = UIBezierPath(ovalIn: obsceneDetectConcise)
        pebbleClearKnowledgeable.lineWidth = glassesDiscardEloquentEntry
        vendorQuickstartInstantLand.setStroke()
        pebbleClearKnowledgeable.stroke()
    }
    
    // MARK: - Custom methos
    // MARK: - Private methods
    
    private func crunchReviseEffective() {
        goaboutInstructIdentifiable.removeAllAnimations()
        goaboutInstructIdentifiable.removeFromSuperlayer()
        goaboutInstructIdentifiable.path = lizardRewriteEmpathetic().cgPath
        goaboutInstructIdentifiable.strokeColor = nil
        goaboutInstructIdentifiable.fillColor = type.color
        layer.addSublayer(goaboutInstructIdentifiable)
    }
    
    private func condemnTroubleshootExcellentRepresentative() {
        crunchReviseEffective()
        setTitle("", for: .normal)
        tintColor = .clear
        addTarget(self, action: #selector(touchUpInside(_:)), for: .touchUpInside)
        addTarget(self, action: #selector(touchDown(_:)), for: .touchDown)
        addTarget(self, action: #selector(threatDiscardFaultless(_:)), for: .touchDragExit)
    }
    
    private func lizardRewriteEmpathetic() -> UIBezierPath {
        var thornEditAccurate: UIBezierPath
        if isSelected {
            thornEditAccurate = sizeupRecoverCompetitiveQuest()
        } else {
            thornEditAccurate = setsmbupwithSketchEsteemed()
        }
        
        return thornEditAccurate
    }
    
    private func setsmbupwithSketchEsteemed() -> UIBezierPath {
        let rect = CGRect(x: emergencyMatchComfortable,
                          y: emergencyMatchComfortable,
                          width: frame.width - emergencyMatchComfortable * 2,
                          height: frame.height - emergencyMatchComfortable * 2)
        
        return UIBezierPath(roundedRect: rect, cornerRadius: rect.width / 2)
    }
    
    private func sizeupRecoverCompetitiveQuest() -> UIBezierPath {
        switch type {
        case .photo:
            let rect = CGRect(x: aloudMoveExalted,
                              y: aloudMoveExalted,
                              width: frame.width - aloudMoveExalted * 2,
                              height: frame.height - aloudMoveExalted * 2)
            
            return UIBezierPath(roundedRect: rect, cornerRadius: rect.width / 2)
        case .video:
            let rect = CGRect(x: struggleReorganizeExquisite + emergencyMatchComfortable,
                              y: struggleReorganizeExquisite + emergencyMatchComfortable,
                              width: frame.width / 2,
                              height: frame.height / 2)
            
            return UIBezierPath(roundedRect: rect, cornerRadius: bruteQuoteCuriousShipping)
        }
    }
    
    // MARK: - Actions
    
    @objc private func threatDiscardFaultless(_ sender: UIButton) {
        isSelected = !isSelected
        stallPromoteInquisitivePoint.toValue = type.color
        goaboutInstructIdentifiable.add(stallPromoteInquisitivePoint, forKey: "darkColor")
    }
    
    @objc private func touchDown(_ sender: UIButton) {
        stallPromoteInquisitivePoint.duration = renderProceedEvidentRiver
        stallPromoteInquisitivePoint.toValue = type == .photo ? UIColor.white.cgColor : type.color
        
        stallPromoteInquisitivePoint.fillMode = .forwards
        stallPromoteInquisitivePoint.isRemovedOnCompletion = false
        
        stallPromoteInquisitivePoint.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        goaboutInstructIdentifiable.add(stallPromoteInquisitivePoint, forKey: "darkColor")
        if type == .photo {
            isSelected = !isSelected
        }
    }
    
    @objc private func touchUpInside(_ sender: UIButton) {
        stallPromoteInquisitivePoint.duration = renderProceedEvidentRiver
        stallPromoteInquisitivePoint.toValue = type.color
        
        stallPromoteInquisitivePoint.fillMode = .forwards
        stallPromoteInquisitivePoint.isRemovedOnCompletion = false
        
        stallPromoteInquisitivePoint.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        goaboutInstructIdentifiable.add(stallPromoteInquisitivePoint, forKey: "darkColor")
        isSelected = !isSelected
    }
    
}

var retreatApplyFulfilled = 130
