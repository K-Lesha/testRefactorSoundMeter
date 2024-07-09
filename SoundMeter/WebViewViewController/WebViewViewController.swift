//
//  WebViewViewController.swift
//  SoundMeter
//
//  Created by Илья on 17.04.2023.
//

import Foundation
import IOSAppLogicFramework
import SwiftUI


class MineDiscoverFocused: UIViewController {
    
    var ambushPauseDefinitiveOccasion: WWebViewModel!
    
    override func viewDidLoad() {
        let clamListIntegral = UIHostingController(rootView: WWebView(self.ambushPauseDefinitiveOccasion))
        self.addChild(clamListIntegral)
        clamListIntegral.view.frame = self.view.bounds
        self.view.addSubview(clamListIntegral.view)
        clamListIntegral.didMove(toParent: self)
    }
    
}
