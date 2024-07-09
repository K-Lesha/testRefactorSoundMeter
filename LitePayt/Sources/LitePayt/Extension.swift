//
//  File.swift
//  
//
//  Created by ankudinov aleksandr on 24.06.2024.
//

import Foundation
import UIKit
import SwiftUI

extension UIDevice {
    var hasNotch: Bool {
        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}


//
//  Paywall+UIViewController.swift
//  WTMP
//
//  Created by ankudinov aleksandr on 14.05.2024.
//

import Foundation
import ApphudSDK
import UIKit
import SwiftUI


extension UIViewController {
    
    internal func checkPremium(block: (()->Void)? = nil) {
        Apphud.paywallsDidLoadCallback { paywallsList, error in
            Task {
              if let paywall = await Apphud.paywall(ApphudPaywallID.onboarding.rawValue) {
                  Apphud.paywallShown(paywall)
            
                  var upgradeViewController:UIViewController!
                  upgradeViewController = UIHostingController(rootView: TutorialWall(block: block))
                  upgradeViewController.view.backgroundColor = .clear
                  upgradeViewController.modalPresentationStyle = .overFullScreen
                  self.present(upgradeViewController, animated: true, completion: nil)
              }
            }
        }
    }
    
    public func fullCheckPremium(block: (()->Void)? = nil) {
        Apphud.paywallsDidLoadCallback { paywallsList, error in
            Task {
              if let paywall = await Apphud.paywall(ApphudPaywallID.main.rawValue) {
                  Apphud.paywallShown(paywall)
                  
                  var upgradeViewController:UIViewController!
                  upgradeViewController = UIHostingController(rootView: WallView(block: block))
                  upgradeViewController.view.backgroundColor = .clear
                  upgradeViewController.modalPresentationStyle = .overFullScreen
                  self.present(upgradeViewController, animated: true, completion: nil)
              }
            }
        }
    }
}

struct BlurView: UIViewRepresentable {

    let style: UIBlurEffect.Style

    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        return view
    }

    func updateUIView(_ uiView: UIView,
                      context: UIViewRepresentableContext<BlurView>) {
        
    }
}

extension UIApplication {
    var firstKeyWindow: UIWindow? {
        let windowScenes = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
        let activeScene = windowScenes
            .filter { $0.activationState == .foregroundActive }
        let firstActiveScene = activeScene.first
        let keyWindow = firstActiveScene?.keyWindow
        return keyWindow
    }
}


